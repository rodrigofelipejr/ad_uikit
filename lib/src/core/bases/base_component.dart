import 'package:ad_uikit/src/core/bases/base_style.dart';
import 'package:ad_uikit/src/core/enums/behavior.dart';
import 'package:flutter/widgets.dart';

abstract class ADStatefulWidget<Style, Shared> extends StatefulWidget {
  const ADStatefulWidget({super.key});
  ADBehavior get behavior;
  ADStyle<Style, Shared> get styles;
}

mixin ADStatefulStyleMixin<Widget extends ADStatefulWidget<Style, Shared>, Style, Shared> on State<Widget> {
  Style get style => widget.styles.resolveFor(widget.behavior).style;
  Shared get sharedStyle => widget.styles.resolveFor(widget.behavior).shared;
  bool get isLoading => widget.behavior.isLoading;
}

mixin ADStatelessStyleMixin<Style, Shared> on StatelessWidget {
  ADStyle<Style, Shared> get styles;
  ADBehavior get behavior;
  Style get style => styles.resolveFor(behavior).style;
  Shared get sharedStyle => styles.resolveFor(behavior).shared;
  bool get isLoading => behavior.isLoading;
}
