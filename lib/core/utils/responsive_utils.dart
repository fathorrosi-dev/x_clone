/// Defines breakpoints for responsive design across different screen sizes
class ResponsiveBreakpoints {
  const ResponsiveBreakpoints._();

  // Core breakpoints
  static const double smallMobile = 320;
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double largeDesktop = 1440;

  // Foldable device breakpoints
  static const double foldedWidth = 280;
  static const double unfoldedWidth = 720;

  /// Maximum content width for different form factors
  static const double maxContentWidthSmallMobile = 300;
  static const double maxContentWidthMobile = 560;
  static const double maxContentWidthTablet = 840;
  static const double maxContentWidthDesktop = 1080;
  static const double maxContentWidthLargeDesktop = 1200;

  /// Default paddings
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
}
