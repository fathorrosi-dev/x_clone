import 'package:flutter/material.dart';
import '../dimensions/screen_dimensions.dart';

/// Utility class for managing padding values based on screen size.
class PaddingUtils {
  const PaddingUtils._();

  // Screen Padding Values
  static const EdgeInsets _kCompactPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  );
  static const EdgeInsets _kMediumPadding = EdgeInsets.symmetric(
    horizontal: 32.0,
    vertical: 16.0,
  );
  static const EdgeInsets _kExpandedPadding = EdgeInsets.symmetric(
    horizontal: 48.0,
    vertical: 24.0,
  );

  /// Gets the appropriate screen padding based on the screen type.
  ///
  /// Returns different padding values for different screen types:
  /// * Compact: 16dp horizontal, 8dp vertical
  /// * Medium: 32dp horizontal, 16dp vertical
  /// * Expanded/Wide: 48dp horizontal, 24dp vertical
  static EdgeInsets getScreenPadding(BuildContext context) {
    if (ScreenDimensions.isCompact(context)) {
      return _kCompactPadding;
    } else if (ScreenDimensions.isMedium(context)) {
      return _kMediumPadding;
    }
    return _kExpandedPadding;
  }

  /// Gets horizontal padding based on screen type.
  static double getHorizontalPadding(BuildContext context) {
    if (ScreenDimensions.isCompact(context)) {
      return 16.0;
    } else if (ScreenDimensions.isMedium(context)) {
      return 32.0;
    }
    return 48.0;
  }

  /// Gets vertical padding based on screen type.
  static double getVerticalPadding(BuildContext context) {
    if (ScreenDimensions.isCompact(context)) {
      return 8.0;
    } else if (ScreenDimensions.isMedium(context)) {
      return 16.0;
    }
    return 24.0;
  }
}
