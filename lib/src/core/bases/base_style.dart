import 'package:ad_uikit/src/core/enums/behavior.dart';
import 'package:equatable/equatable.dart';

abstract class ADBaseStyles extends Equatable {
  const ADBaseStyles();
  @override
  List<Object?> get props => [];
}

class ADStyle<T, U> {
  final T regular;
  final U shared;
  final T? disabled;
  final T? empty;
  final T? error;
  final T? loading;

  const ADStyle({required this.regular, required this.shared, this.disabled, this.empty, this.error, this.loading});

  ({T style, U shared}) resolveFor(ADBehavior behavior) {
    switch (behavior) {
      case ADBehavior.regular:
        return (style: regular, shared: shared);
      case ADBehavior.disabled:
        return (style: disabled ?? regular, shared: shared);
      case ADBehavior.empty:
        return (style: empty ?? regular, shared: shared);
      case ADBehavior.error:
        return (style: error ?? regular, shared: shared);
      case ADBehavior.loading:
        return (style: loading ?? regular, shared: shared);
    }
  }
}
