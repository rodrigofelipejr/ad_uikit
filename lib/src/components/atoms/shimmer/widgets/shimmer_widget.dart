import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum ZShimmerDirection { ltr, rtl, ttb, btt }

class Shimmer extends StatefulWidget {
  final Widget child;
  final Duration period;
  final ZShimmerDirection direction;
  final Gradient gradient;
  final int loop;
  final bool enabled;

  const Shimmer({
    required this.child,
    required this.gradient,
    super.key,
    this.direction = ZShimmerDirection.ltr,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
  });

  Shimmer.fromColors({
    required this.child,
    required Color baseColor,
    required Color highlightColor,
    super.key,
    this.period = const Duration(milliseconds: 1500),
    this.direction = ZShimmerDirection.ltr,
    this.loop = 0,
    this.enabled = true,
  }) : gradient = LinearGradient(
         begin: Alignment.topLeft,
         colors: <Color>[baseColor, baseColor, highlightColor, baseColor, baseColor],
         stops: const <double>[0, 0.35, 0.5, 0.65, 1],
       );

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period);
    _setupAnimation();
  }

  void _setupAnimation() {
    _controller.addStatusListener(_handleStatusChange);
    if (widget.enabled) unawaited(_controller.forward());
  }

  void _handleStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _count++;
      if (widget.loop <= 0) {
        unawaited(_controller.repeat());
      } else if (_count < widget.loop) {
        unawaited(_controller.forward(from: 0));
      }
    }
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      widget.enabled ? _controller.repeat() : _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: _Shimmer(
        direction: widget.direction,
        gradient: widget.gradient,
        percent: _controller,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Shimmer extends SingleChildRenderObjectWidget {
  final Animation<double> percent;
  final ZShimmerDirection direction;
  final Gradient gradient;

  const _Shimmer({required this.percent, required this.direction, required this.gradient, super.child});

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percent, direction, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter renderObject) {
    renderObject
      ..percent(percent)
      ..gradient(gradient)
      ..direction(direction);
  }
}

class _ShimmerFilter extends RenderProxyBox {
  ZShimmerDirection _direction;
  Gradient _gradient;
  Animation<double> _percent;

  _ShimmerFilter(this._percent, this._direction, this._gradient);

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _percent.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _percent.removeListener(markNeedsPaint);
    super.detach();
  }

  void percent(Animation<double> value) {
    if (_percent == value) return;
    if (attached) _percent.removeListener(markNeedsPaint);
    _percent = value;
    if (attached) _percent.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  void gradient(Gradient value) {
    if (_gradient == value) return;
    _gradient = value;
    markNeedsPaint();
  }

  void direction(ZShimmerDirection value) {
    if (_direction == value) return;
    _direction = value;
    markNeedsPaint();
  }

  @override
  bool get alwaysNeedsCompositing => child != null;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final width = child!.size.width;
    final height = child!.size.height;
    final t = _percent.value;

    Rect shaderRect;
    if (_direction == ZShimmerDirection.rtl || _direction == ZShimmerDirection.ltr) {
      shaderRect = Rect.fromLTWH(0, 0, 3 * width, height);
    } else {
      shaderRect = Rect.fromLTWH(0, 0, width, 3 * height);
    }

    double dx = 0;
    double dy = 0;

    if (_direction == ZShimmerDirection.rtl) {
      dx = _offset(width, -width, t) - width;
    } else if (_direction == ZShimmerDirection.ltr) {
      dx = _offset(-width, width, t) - width;
    } else if (_direction == ZShimmerDirection.ttb) {
      dy = _offset(-height, height, t) - height;
    } else if (_direction == ZShimmerDirection.btt) {
      dy = _offset(height, -height, t) - height;
    }

    final paint = Paint()
      ..shader = _gradient.createShader(shaderRect)
      ..blendMode = BlendMode.srcIn;

    context.canvas.saveLayer(offset & size, Paint());
    context.paintChild(child!, offset);

    context.canvas.translate(offset.dx + dx, offset.dy + dy);
    context.canvas.drawRect(shaderRect, paint);

    context.canvas.restore();
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }
}
