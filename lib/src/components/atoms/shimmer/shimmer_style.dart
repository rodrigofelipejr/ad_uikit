import 'package:ad_uikit/src/core/bases/base_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class ADShimmerStyle extends ADBaseStyles {
  final BorderRadiusGeometry borderRadius;
  final Color baseColor;
  final Color highlightColor;
  final Color shapeColor;
  final bool isCircular;
  final EdgeInsets? margin;

  const ADShimmerStyle({
    required this.borderRadius,
    required this.baseColor,
    required this.highlightColor,
    required this.shapeColor,
    required this.isCircular,
    this.margin,
  });

  @override
  List<Object?> get props => [borderRadius, baseColor, highlightColor, shapeColor, isCircular, margin];
}

final class ADShimmerSharedStyle extends ADBaseStyles {
  const ADShimmerSharedStyle();
}
