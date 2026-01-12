/// Platform-aware scroll behavior configuration that extends [ScrollBehavior].
///
/// This class customizes scrolling behavior across different platforms to provide
/// a native feel while maintaining Material Design guidelines. It handles:
/// * Scroll physics (bouncing vs clamping)
/// * Scrollbar visibility and appearance
/// * Overscroll indicators and effects
///
/// The behavior automatically adapts based on the current platform:
/// * iOS/macOS: Uses bouncing physics for natural feel
/// * Android: Uses clamping physics with material effects
/// * Desktop: Implements scrollbars and clamping physics
library;

import 'package:flutter/material.dart';

/// Custom scroll behavior that adapts to different platforms
///
/// This class extends [ScrollBehavior] to provide platform-specific
/// scrolling behaviors. It ensures that scrolling feels natural on
/// each platform while maintaining Material Design guidelines.
class AppScrollBehavior extends ScrollBehavior {
  /// Creates a new [AppScrollBehavior] instance with platform-specific defaults
  const AppScrollBehavior();

  /// Determines the appropriate scroll physics based on platform
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const BouncingScrollPhysics();
      default:
        return const ClampingScrollPhysics();
    }
  }

  /// Builds platform-appropriate scrollbar
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // Only show scrollbars on desktop platforms
    if (getPlatform(context).isDesktop) {
      return Scrollbar(controller: details.controller, child: child);
    }
    return child;
  }

  /// Builds platform-specific overscroll indicator
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // iOS uses its native overscroll effect
    if (getPlatform(context) == TargetPlatform.iOS) {
      return child;
    }

    // All other platforms use the stretching indicator
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }

  /// Optimization: only notify if platform changes
  @override
  bool shouldNotify(ScrollBehavior oldDelegate) =>
      oldDelegate.runtimeType != runtimeType;
}

/// Extension to help with platform-specific checks
extension TargetPlatformX on TargetPlatform {
  /// Whether the platform is a desktop platform
  bool get isDesktop =>
      this == TargetPlatform.linux ||
      this == TargetPlatform.macOS ||
      this == TargetPlatform.windows;
}
