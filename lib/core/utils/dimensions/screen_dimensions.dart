import 'package:flutter/widgets.dart';

/// Screen types based on Material 3 breakpoints
enum ScreenType {
  /// Compact layout (< 600dp)
  compact,

  /// Medium layout (600dp - 840dp)
  medium,

  /// Expanded layout (840dp - 1240dp)
  expanded,

  /// Wide layout (>= 1240dp)
  wide,
}

/// Utility class for screen dimension calculations and breakpoints following
/// Material 3 design system guidelines.
class ScreenDimensions {
  const ScreenDimensions._();

  // Material 3 Breakpoint Constants
  static const double kBreakpointCompact = 600.0;
  static const double kBreakpointMedium = 840.0;
  static const double kBreakpointExpanded = 1240.0;

  /// Whether the screen width is in the compact range (< 600dp).
  static bool isCompact(BuildContext context) =>
      MediaQuery.of(context).size.width < kBreakpointCompact;

  /// Whether the screen width is in the medium range (600dp - 840dp).
  static bool isMedium(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= kBreakpointCompact && width < kBreakpointMedium;
  }

  /// Whether the screen width is in the expanded range (>= 840dp).
  static bool isExpanded(BuildContext context) =>
      MediaQuery.of(context).size.width >= kBreakpointMedium;

  /// Whether the screen width is in the wide range (>= 1240dp).
  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= kBreakpointExpanded;

  /// Gets the current screen type based on Material 3 breakpoints.
  static ScreenType getScreenType(BuildContext context) {
    if (isWide(context)) return ScreenType.wide;
    if (isExpanded(context)) return ScreenType.expanded;
    if (isMedium(context)) return ScreenType.medium;
    return ScreenType.compact;
  }
}
