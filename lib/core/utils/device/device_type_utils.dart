import 'package:flutter/material.dart';
import '../breakpoints/app_breakpoints.dart';

/// Utility class for device type detection and screen size categorization.
class DeviceTypeUtils {
  const DeviceTypeUtils._();

  /// Whether the current device is considered a mobile device.
  ///
  /// Returns `true` if the screen width is smaller than [AppBreakpoints.kTablet].
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppBreakpoints.kTablet;
  }

  /// Whether the current device is considered a tablet.
  ///
  /// Returns `true` if the screen width is between [AppBreakpoints.kTablet]
  /// and [AppBreakpoints.kDesktop].
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppBreakpoints.kTablet && width < AppBreakpoints.kDesktop;
  }

  /// Whether the current device is considered a desktop.
  ///
  /// Returns `true` if the screen width is larger than [AppBreakpoints.kDesktop].
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppBreakpoints.kDesktop;
  }

  /// Whether the current device is in landscape orientation.
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Whether the current device is in portrait orientation.
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
