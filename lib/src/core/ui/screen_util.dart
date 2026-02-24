import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_screen_util/mini_screen_util.dart';

class ADScreenUtil {
  static ADScreenUtil? _instance;

  ADScreenUtil._();

  static ADScreenUtil get instance => _instance ??= ADScreenUtil._();

  bool _initialized = false;
  bool _wasWarningLogged = false;

  Widget init({required Size resolution, required Widget child}) {
    _initialized = true;
    return MiniScreenInit(designSize: resolution, child: child);
  }

  double w(num value) => _getScaledValue(value, MiniScreenUtil.w);
  double h(num value) => _getScaledValue(value, MiniScreenUtil.h);
  double r(num value) => _getScaledValue(value, MiniScreenUtil.r);
  double sp(num value) => _getScaledValue(value, MiniScreenUtil.sp);
  double sw(num value) => _getScaledValue(value, (v) => MiniScreenUtil.screen.width * v);
  double sh(num value) => _getScaledValue(value, (v) => MiniScreenUtil.screen.height * v);

  double _getScaledValue(num value, double Function(num) scaler) {
    if (kIsWeb) return value.toDouble();

    if (_initialized) return scaler(value);

    if (kDebugMode && !_wasWarningLogged) {
      _wasWarningLogged = true;
      log(
        'Scaling methods used before init(). Returning original values without scaling.',
        name: 'ZScreenUtil',
        level: 900,
      );
    }

    return value.toDouble();
  }
}
