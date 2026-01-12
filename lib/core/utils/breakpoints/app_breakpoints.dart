import 'package:responsive_framework/responsive_framework.dart';

/// Material 3 breakpoint constants and configurations for responsive design.
///
/// This class provides standard breakpoints and configurations following
/// Material 3 design guidelines for responsive layouts.
class AppBreakpoints {
  const AppBreakpoints._();

  // Base breakpoints
  static const double kMobile = 450;
  static const double kTablet = 800;
  static const double kDesktop = 1200;
  static const double k4K = 1920;

  // Additional breakpoints for finer control
  static const double kMobileSmall = 320;
  static const double kMobileLarge = 480;
  static const double kTabletSmall = 600;
  static const double kTabletLarge = 900;
  static const double kLaptop = 1024;
  static const double kDesktopLarge = 1440;

  /// Enhanced breakpoint configuration with fine-grained control
  static const List<Breakpoint> kBreakpoints = [
    Breakpoint(start: 0, end: 320, name: 'mobile-small'),
    Breakpoint(start: 321, end: 450, name: MOBILE),
    Breakpoint(start: 451, end: 600, name: 'tablet-small'),
    Breakpoint(start: 601, end: 800, name: TABLET),
    Breakpoint(start: 801, end: 1024, name: 'laptop'),
    Breakpoint(start: 1025, end: 1200, name: DESKTOP),
    Breakpoint(start: 1201, end: 1440, name: 'desktop-large'),
    Breakpoint(start: 1441, end: double.infinity, name: '4k'),
  ];

  /// Standard breakpoint configuration for the app.
  ///
  /// Defines breakpoints for:
  /// * Mobile (0-450dp)
  /// * Tablet (451-800dp)
  /// * Desktop (801-1200dp)
  /// * 4K (1201dp+)
  static const List<Breakpoint> kResponsiveBreakpoints = [
    Breakpoint(start: 0, end: 450, name: MOBILE),
    Breakpoint(start: 451, end: 800, name: TABLET),
    Breakpoint(start: 801, end: 1920, name: DESKTOP),
  ];
}
