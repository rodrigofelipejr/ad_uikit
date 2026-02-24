import 'package:ad_uikit/src/components/atoms/shimmer/shimmer_style.dart';
import 'package:ad_uikit/src/components/atoms/shimmer/widgets/shimmer_widget.dart';
import 'package:ad_uikit/src/core/bases/base_component.dart';
import 'package:ad_uikit/src/core/bases/base_style.dart';
import 'package:ad_uikit/src/core/enums/behavior.dart';
import 'package:ad_uikit/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ADShimmerComponent extends StatelessWidget with ADStatelessStyleMixin<ADShimmerStyle, ADShimmerSharedStyle> {
  @override
  final ADBehavior behavior;
  @override
  final ADStyle<ADShimmerStyle, ADShimmerSharedStyle> styles;
  final Size size;

  const ADShimmerComponent({required this.styles, required this.size, this.behavior = ADBehavior.regular, super.key});

  @override
  Widget build(BuildContext context) {
    return _ShimmerComponent(style: style, size: size);
  }
}

class _ShimmerComponent extends StatelessWidget {
  final ADShimmerStyle style;
  final Size size;

  const _ShimmerComponent({required this.style, required this.size});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: style.baseColor,
      highlightColor: style.highlightColor,
      child: Container(
        width: size.width.r,
        height: size.height.r,
        margin: style.margin,
        decoration: BoxDecoration(
          color: style.shapeColor,
          borderRadius: style.isCircular ? null : style.borderRadius.r,
          shape: style.isCircular ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }
}
