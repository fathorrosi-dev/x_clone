import 'package:flutter/material.dart';

/// A utility class that defines padding and spacing constants following Material 3
/// design specifications.
///
/// This class provides standardized spacing values and pre-configured edge insets
/// for various UI components. All values can be scaled using [AppInsets.scaled].
class AppInsets {
  const AppInsets._();

  // Material 3 Layout Grid Constants
  static const double grid = 8.0;
  static const double gridHalf = 4.0;
  static const double gridDouble = 16.0;

  // Material 3 Standard Spacing Constants
  static const double none = 0.0;
  static const double space4 = 4.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space24 = 24.0;
  static const double space32 = 32.0;
  static const double space40 = 40.0;
  static const double space48 = 48.0;
  static const double space56 = 56.0;
  static const double space64 = 64.0;

  // Material 3 Component Specific Insets
  static EdgeInsets get card => const EdgeInsets.all(space16);
  static EdgeInsets get cardDense => const EdgeInsets.all(space12);
  static EdgeInsets get cardLoose => const EdgeInsets.all(space24);

  static EdgeInsets get dialog => const EdgeInsets.all(space24);
  static EdgeInsets get dialogHeader =>
      const EdgeInsets.symmetric(horizontal: space24, vertical: space16);

  static EdgeInsets get listTile =>
      const EdgeInsets.symmetric(horizontal: space16, vertical: space12);
  static EdgeInsets get listTileDense =>
      const EdgeInsets.symmetric(horizontal: space16, vertical: space8);

  static EdgeInsets get button =>
      const EdgeInsets.symmetric(horizontal: space24, vertical: space12);
  static EdgeInsets get buttonCompact =>
      const EdgeInsets.symmetric(horizontal: space16, vertical: space8);

  static EdgeInsets get textField =>
      const EdgeInsets.symmetric(horizontal: space16, vertical: space16);
  static EdgeInsets get textFieldDense =>
      const EdgeInsets.symmetric(horizontal: space12, vertical: space12);

  // Screen Edge Insets
  static EdgeInsets get screen => const EdgeInsets.all(space16);
  static EdgeInsets get screenHorizontal =>
      const EdgeInsets.symmetric(horizontal: space16);
  static EdgeInsets get screenVertical =>
      const EdgeInsets.symmetric(vertical: space16);

  // Navigation Component Insets
  static EdgeInsets get navigationRail =>
      const EdgeInsets.symmetric(horizontal: space12, vertical: space12);
  static EdgeInsets get bottomNavigation =>
      const EdgeInsets.symmetric(horizontal: space16, vertical: space16);
  static EdgeInsets get drawer => EdgeInsets.zero;
  static EdgeInsets get bottomSheet =>
      const EdgeInsets.symmetric(horizontal: space16, vertical: space24);

  /// Creates a scaled version of [AppInsets] where all values are multiplied by [scale].
  static AppInsetsScale scaled(double scale) => AppInsetsScale(scale);

  // Helper Methods
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static EdgeInsets all(double value) => EdgeInsets.all(value);

  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
}

/// A utility class that provides scaled versions of all [AppInsets] values.
class AppInsetsScale {
  const AppInsetsScale(this._scale);
  final double _scale;

  // Scaled Material 3 Layout Grid
  double get grid => AppInsets.grid * _scale;
  double get gridHalf => AppInsets.gridHalf * _scale;
  double get gridDouble => AppInsets.gridDouble * _scale;

  // Scaled Material 3 Standard Spacing
  double get none => 0;
  double get space4 => AppInsets.space4 * _scale;
  double get space8 => AppInsets.space8 * _scale;
  double get space12 => AppInsets.space12 * _scale;
  double get space16 => AppInsets.space16 * _scale;
  double get space24 => AppInsets.space24 * _scale;
  double get space32 => AppInsets.space32 * _scale;
  double get space40 => AppInsets.space40 * _scale;
  double get space48 => AppInsets.space48 * _scale;
  double get space56 => AppInsets.space56 * _scale;
  double get space64 => AppInsets.space64 * _scale;

  // Scaled Component Specific Insets
  EdgeInsets get card => EdgeInsets.all(space16);
  EdgeInsets get cardDense => EdgeInsets.all(space12);
  EdgeInsets get cardLoose => EdgeInsets.all(space24);

  EdgeInsets get dialog => EdgeInsets.all(space24);
  EdgeInsets get dialogHeader =>
      EdgeInsets.symmetric(horizontal: space24, vertical: space16);

  EdgeInsets get listTile =>
      EdgeInsets.symmetric(horizontal: space16, vertical: space12);
  EdgeInsets get listTileDense =>
      EdgeInsets.symmetric(horizontal: space16, vertical: space8);

  EdgeInsets get button =>
      EdgeInsets.symmetric(horizontal: space24, vertical: space12);
  EdgeInsets get buttonCompact =>
      EdgeInsets.symmetric(horizontal: space16, vertical: space8);

  EdgeInsets get textField =>
      EdgeInsets.symmetric(horizontal: space16, vertical: space16);
  EdgeInsets get textFieldDense =>
      EdgeInsets.symmetric(horizontal: space12, vertical: space12);

  // Scaled Screen Edge Insets
  EdgeInsets get screen => EdgeInsets.all(space16);
  EdgeInsets get screenHorizontal => EdgeInsets.symmetric(horizontal: space16);
  EdgeInsets get screenVertical => EdgeInsets.symmetric(vertical: space16);

  // Scaled Navigation Component Insets
  EdgeInsets get navigationRail =>
      EdgeInsets.symmetric(horizontal: space12, vertical: space12);
  EdgeInsets get bottomNavigation =>
      EdgeInsets.symmetric(horizontal: space16, vertical: space16);
  EdgeInsets get drawer => EdgeInsets.zero;
  EdgeInsets get bottomSheet =>
      EdgeInsets.symmetric(horizontal: space16, vertical: space24);

  // Helper Methods
  EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(
        horizontal: horizontal * _scale,
        vertical: vertical * _scale,
      );

  EdgeInsets all(double value) => EdgeInsets.all(value * _scale);

  EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: left * _scale,
    top: top * _scale,
    right: right * _scale,
    bottom: bottom * _scale,
  );
}
