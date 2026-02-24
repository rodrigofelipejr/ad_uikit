import 'package:ad_uikit/src/core/ui/screen_util.dart';
import 'package:flutter/material.dart';

extension ADScreenUtilExtension on num {
  double get w => ADScreenUtil.instance.w(this);
  double get h => ADScreenUtil.instance.h(this);
  double get r => ADScreenUtil.instance.r(this);
  double get sp => ADScreenUtil.instance.sp(this);
  double get sw => ADScreenUtil.instance.sw(this);
  double get sh => ADScreenUtil.instance.sh(this);
}

extension BorderRadiusGeometryExtension on BorderRadiusGeometry {
  BorderRadiusGeometry get r {
    if (this is BorderRadius) {
      final br = this as BorderRadius;
      return BorderRadius.only(
        topLeft: Radius.circular(br.topLeft.x.r),
        topRight: Radius.circular(br.topRight.x.r),
        bottomLeft: Radius.circular(br.bottomLeft.x.r),
        bottomRight: Radius.circular(br.bottomRight.x.r),
      );
    }

    if (this is BorderRadiusDirectional) {
      final brd = this as BorderRadiusDirectional;
      return BorderRadiusDirectional.only(
        topStart: Radius.circular(brd.topStart.x.r),
        topEnd: Radius.circular(brd.topEnd.x.r),
        bottomStart: Radius.circular(brd.bottomStart.x.r),
        bottomEnd: Radius.circular(brd.bottomEnd.x.r),
      );
    }

    return this;
  }
}
