import 'package:ad_uikit/src/tokens/colors.dart';
import 'package:ad_uikit/src/tokens/sizes.dart';
import 'package:ad_uikit/src/tokens/typography.dart';
import 'package:flutter/material.dart';

abstract class ADTextStyleInter {
  static const String _package = 'ad_uikit';
  static const String _family = ADTypography.familyInter;
  static const double _height100 = 1;
  static const double _height110 = 1.1;
  static const double _height120 = 1.2;
  static const double _height130 = 1.3;
  static const double _height135 = 1.35;
  static const double _height140 = 1.40;
  static const double _height145 = 1.45;
  static const double _height150 = 1.5;
  static const double _height160 = 1.6;
  static const double _spacingQuarter = 0.2;
  static const double _spacing0 = 0;
  static const double _spacingMinusHalf = -0.5;
  static const double _spacingMinus1 = -1;

  static const TextStyle heading1 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x40,
    height: _height110,
    letterSpacing: _spacingMinus1,
    fontWeight: ADTypography.semibold,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle heading2 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x32,
    height: _height100,
    letterSpacing: _spacingMinus1,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle heading3 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x30,
    height: _height100,
    letterSpacing: _spacingMinusHalf,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle heading4 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x28,
    height: _height135,
    letterSpacing: _spacingMinus1,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle heading5 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x22,
    height: _height145,
    letterSpacing: _spacingMinus1,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );

  static const TextStyle bodyXXLMedium = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x20,
    height: _height130,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyXXLRegular = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x20,
    height: _height130,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyXLMedium = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x18,
    height: _height145,
    letterSpacing: _spacingMinus1,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyXLRegular = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x18,
    height: _height145,
    letterSpacing: _spacingMinus1,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyLMedium = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x16,
    height: _height140,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyXRegular = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x18,
    height: _height140,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyLRegular = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x16,
    height: _height140,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyMMedium = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x14,
    height: _height145,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyMRegular = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x14,
    height: _height145,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodySMedium = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x12,
    height: _height150,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodySRegular = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x12,
    height: _height150,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyXSMedium = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x10,
    height: _height160,
    letterSpacing: _spacingQuarter,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle bodyXSRegular = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x10,
    height: _height160,
    letterSpacing: _spacingQuarter,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x56,
    height: _height110,
    letterSpacing: _spacingMinus1,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle display2 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x28,
    height: _height135,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.medium,
    color: ADColors.base100,
    package: _package,
  );
  static const TextStyle display3 = TextStyle(
    fontFamily: _family,
    fontSize: ADSizes.x28,
    height: _height120,
    letterSpacing: _spacing0,
    fontWeight: ADTypography.regular,
    color: ADColors.base100,
    package: _package,
  );
}
