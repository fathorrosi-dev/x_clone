import 'package:flutter/material.dart';
import '../theme/styles/app_insets.dart';

/// Extension on [BuildContext] to easily access insets and spacing
extension ThemeInsetsX on BuildContext {
  /// Grid spacing
  double get grid => AppInsets.grid;
  double get gridHalf => AppInsets.gridHalf;
  double get gridDouble => AppInsets.gridDouble;

  /// Standard spacing
  double get space4 => AppInsets.space4;
  double get space8 => AppInsets.space8;
  double get space12 => AppInsets.space12;
  double get space16 => AppInsets.space16;
  double get space24 => AppInsets.space24;
  double get space32 => AppInsets.space32;
  double get space40 => AppInsets.space40;
  double get space48 => AppInsets.space48;
  double get space56 => AppInsets.space56;
  double get space64 => AppInsets.space64;

  /// Component insets
  EdgeInsets get cardInsets => AppInsets.card;
  EdgeInsets get cardDenseInsets => AppInsets.cardDense;
  EdgeInsets get dialogInsets => AppInsets.dialog;
  EdgeInsets get listTileInsets => AppInsets.listTile;
  EdgeInsets get listTileDenseInsets => AppInsets.listTileDense;

  /// Responsive insets
  EdgeInsets responsiveInsets({
    double? horizontal,
    double? vertical,
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      return EdgeInsets.all(all);
    }

    if (horizontal != null || vertical != null) {
      return EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      );
    }

    return EdgeInsets.only(
      left: left ?? 0,
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
    );
  }
}
