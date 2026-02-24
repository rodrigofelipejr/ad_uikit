import 'package:ad_uikit/src/components/atoms/shimmer/shimmer_style.dart';
import 'package:ad_uikit/src/core/bases/base_style.dart';
import 'package:ad_uikit/src/tokens/colors.dart';
import 'package:ad_uikit/src/tokens/sizes.dart';
import 'package:flutter/material.dart';

abstract class ADShimmerStyles {
  static const Color _kBaseColor = ADColors.black40;
  static const Color _kHighlightColor = ADColors.black20;
  static const Color _kShapeColor = ADColors.black20;
  static const BorderRadius _kBorderRadiusZero = BorderRadius.zero;
  static const BorderRadius _kBorderRadius4 = BorderRadius.all(Radius.circular(ADSizes.x04));

  static const _kSharedStyle = ADShimmerSharedStyle();

  static const standard = ADStyle<ADShimmerStyle, ADShimmerSharedStyle>(
    shared: _kSharedStyle,
    regular: ADShimmerStyle(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      shapeColor: _kShapeColor,
      borderRadius: _kBorderRadiusZero,
      isCircular: false,
    ),
  );

  static const standardRounded = ADStyle<ADShimmerStyle, ADShimmerSharedStyle>(
    shared: _kSharedStyle,
    regular: ADShimmerStyle(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      shapeColor: _kShapeColor,
      borderRadius: _kBorderRadius4,
      isCircular: false,
    ),
  );

  static const standardCircular = ADStyle<ADShimmerStyle, ADShimmerSharedStyle>(
    shared: _kSharedStyle,
    regular: ADShimmerStyle(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      shapeColor: _kShapeColor,
      borderRadius: _kBorderRadiusZero,
      isCircular: true,
    ),
  );
}
