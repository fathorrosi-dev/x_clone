import 'package:flutter/material.dart';

/// A utility class that defines corner radius constants and border radius utilities
/// following Material 3 design specifications.
///
/// This class provides standardized corner radii for various UI components and
/// helper methods for creating border radius and shape configurations.
class AppCorners {
  const AppCorners._();

  // Material 3 Shape Scale Constants
  static const double none = 0;
  static const double extraSmall = 4;
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double extraLarge = 28;
  static const double full = 1000; // For circular shapes

  // Material 3 Component Specific Border Radii
  static BorderRadius get bottomSheet => const BorderRadius.only(
    topLeft: Radius.circular(large),
    topRight: Radius.circular(large),
  );

  static BorderRadius get card => BorderRadius.circular(medium);
  static BorderRadius get cardFull => BorderRadius.circular(large);

  static BorderRadius get dialog => BorderRadius.circular(extraLarge);

  static BorderRadius get button => BorderRadius.circular(full);
  static BorderRadius get buttonSquared => BorderRadius.circular(small);

  static BorderRadius get textField => BorderRadius.circular(small);
  static BorderRadius get checkbox => BorderRadius.circular(small);
  static BorderRadius get chip => BorderRadius.circular(small);

  static BorderRadius get tooltip => BorderRadius.circular(small);
  static BorderRadius get snackbar => BorderRadius.circular(small);

  static BorderRadius get fab => BorderRadius.circular(full);
  static BorderRadius get extendedFab => BorderRadius.circular(full);

  // Shape Builders
  static RoundedRectangleBorder cardShape({bool full = false}) =>
      RoundedRectangleBorder(borderRadius: full ? cardFull : card);

  static RoundedRectangleBorder buttonShape({bool squared = false}) =>
      RoundedRectangleBorder(borderRadius: squared ? buttonSquared : button);

  static RoundedRectangleBorder dialogShape() =>
      RoundedRectangleBorder(borderRadius: dialog);

  static RoundedRectangleBorder bottomSheetShape() =>
      RoundedRectangleBorder(borderRadius: bottomSheet);

  // Continuous Corner Shapes
  static ShapeBorder continuousRectangleBorder(double radius) =>
      ContinuousRectangleBorder(borderRadius: BorderRadius.circular(radius));

  // Helper Methods
  static BorderRadius custom({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) => BorderRadius.only(
    topLeft: Radius.circular(topLeft),
    topRight: Radius.circular(topRight),
    bottomLeft: Radius.circular(bottomLeft),
    bottomRight: Radius.circular(bottomRight),
  );

  static BorderRadius symmetric({double horizontal = 0, double vertical = 0}) =>
      BorderRadius.only(
        topLeft: Radius.circular(vertical),
        topRight: Radius.circular(vertical),
        bottomLeft: Radius.circular(horizontal),
        bottomRight: Radius.circular(horizontal),
      );
}
