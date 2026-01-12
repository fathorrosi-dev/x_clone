import 'package:flutter/material.dart';
import 'package:x_clone/core/utils/dimensions/screen_dimensions.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:x_clone/core/utils/responsive_utils.dart' as app_responsive;

/// Enhanced extension methods for [BuildContext] to provide responsive layout functionality.
extension ResponsiveContextExtension on BuildContext {
  // Screen and device information
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  Orientation get orientation => MediaQuery.of(this).orientation;

  // Device type checks
  bool get isSmallMobile =>
      screenWidth < app_responsive.ResponsiveBreakpoints.mobile;
  bool get isMobile =>
      screenWidth >= app_responsive.ResponsiveBreakpoints.mobile &&
      screenWidth < app_responsive.ResponsiveBreakpoints.tablet;
  bool get isTablet =>
      screenWidth >= app_responsive.ResponsiveBreakpoints.tablet &&
      screenWidth < app_responsive.ResponsiveBreakpoints.desktop;
  bool get isDesktop =>
      screenWidth >= app_responsive.ResponsiveBreakpoints.desktop &&
      screenWidth < app_responsive.ResponsiveBreakpoints.largeDesktop;
  bool get isLargeDesktop =>
      screenWidth >= app_responsive.ResponsiveBreakpoints.largeDesktop;

  // Orientation checks
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  // Foldable device check
  bool get isFoldableDevice =>
      screenWidth <= app_responsive.ResponsiveBreakpoints.unfoldedWidth &&
      screenWidth >= app_responsive.ResponsiveBreakpoints.foldedWidth;

  // Screen size checks based on Material 3 breakpoints
  bool get isCompact => ScreenDimensions.isCompact(this);
  bool get isMedium => ScreenDimensions.isMedium(this);
  bool get isExpanded => ScreenDimensions.isExpanded(this);
  bool get isWide => ScreenDimensions.isWide(this);

  // Content width
  double get maxContentWidth {
    if (isLargeDesktop) {
      return app_responsive.ResponsiveBreakpoints.maxContentWidthLargeDesktop;
    }
    if (isDesktop) {
      return app_responsive.ResponsiveBreakpoints.maxContentWidthDesktop;
    }
    if (isTablet) {
      return app_responsive.ResponsiveBreakpoints.maxContentWidthTablet;
    }
    if (isMobile) {
      return app_responsive.ResponsiveBreakpoints.maxContentWidthMobile;
    }
    return app_responsive.ResponsiveBreakpoints.maxContentWidthSmallMobile;
  }

  // Layout helpers
  EdgeInsets get responsivePadding {
    if (isLargeDesktop) {
      return const EdgeInsets.all(
        app_responsive.ResponsiveBreakpoints.paddingXLarge,
      );
    }
    if (isDesktop) {
      return const EdgeInsets.all(
        app_responsive.ResponsiveBreakpoints.paddingLarge,
      );
    }
    if (isTablet) {
      return const EdgeInsets.all(
        app_responsive.ResponsiveBreakpoints.paddingMedium,
      );
    }
    return const EdgeInsets.all(
      app_responsive.ResponsiveBreakpoints.paddingSmall,
    );
  }

  EdgeInsets get responsiveMargin => responsivePadding;

  /// Get a responsive font size that scales with the screen width
  double responsiveFontSize(
    BuildContext context,
    double base, {
    double? min,
    double? max,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Use width or height depending on orientation
    final referenceWidth = mediaQuery.orientation == Orientation.portrait
        ? 375.0
        : 667.0;

    // Calculate the base size based on screen width
    double size = base * (screenWidth / referenceWidth);

    // Apply the system text scaling using the new API
    size = mediaQuery.textScaler.scale(size);

    if (min != null && size < min) return min;
    if (max != null && size > max) return max;

    return size;
  }

  /// Get a responsive width as a percentage of screen width
  double responsiveWidth(double percentage) => screenWidth * (percentage / 100);

  /// Get a responsive height as a percentage of screen height
  double responsiveHeight(double percentage) =>
      screenHeight * (percentage / 100);

  /// Get a responsive value based on screen size
  T responsive<T>({
    required T mobile,
    required T tablet,
    required T desktop,
    T? compact,
    T? medium,
    T? expanded,
    T? wide,
  }) {
    if (isWide && wide != null) return wide;
    if (isExpanded && expanded != null) return expanded;
    if (isMedium && medium != null) return medium;
    if (isCompact && compact != null) return compact;

    if (isDesktop) return desktop;
    if (isTablet) return tablet;
    return mobile;
  }
}

/// Enhanced extension methods for [Widget] to add responsive layout capabilities.
extension ResponsiveWidgetExtension on Widget {
  /// Makes this widget responsive with visibility control based on screen size.
  Widget responsive({
    bool visible = true,
    List<Condition<bool>>? showWhen,
    List<Condition<bool>>? hideWhen,
  }) {
    return ResponsiveVisibility(
      visible: visible,
      visibleConditions: showWhen ?? const [],
      hiddenConditions: hideWhen ?? const [],
      child: this,
    );
  }

  /// Shows this widget only on mobile devices
  Widget visibleOnMobile() => ResponsiveVisibility(
    visible: false,
    visibleConditions: const <Condition<bool>>[
      Condition<bool>.equals(name: MOBILE),
    ],
    child: this,
  );

  /// Shows this widget only on tablet devices
  Widget visibleOnTablet() => ResponsiveVisibility(
    visible: false,
    visibleConditions: const <Condition<bool>>[
      Condition<bool>.equals(name: TABLET),
    ],
    child: this,
  );

  /// Shows this widget only on desktop devices
  Widget visibleOnDesktop() => ResponsiveVisibility(
    visible: false,
    visibleConditions: const <Condition<bool>>[
      Condition<bool>.equals(name: DESKTOP),
    ],
    child: this,
  );

  /// Makes this widget responsive with different layouts for different screen sizes
  Widget responsiveWidget({
    Widget? compact,
    Widget? medium,
    Widget? expanded,
    Widget? wide,
  }) {
    return Builder(
      builder: (context) {
        if (context.isWide && wide != null) return wide;
        if (context.isExpanded && expanded != null) return expanded;
        if (context.isMedium && medium != null) return medium;
        if (context.isCompact && compact != null) return compact;
        return this;
      },
    );
  }

  /// Add responsive padding to widget
  Widget withResponsivePadding(BuildContext context) =>
      Padding(padding: context.responsivePadding, child: this);

  /// Add responsive margin to widget
  Widget withResponsiveMargin(BuildContext context) =>
      Container(margin: context.responsiveMargin, child: this);

  /// Constrain widget width responsively
  Widget constrainWidth(BuildContext context, double percentage) =>
      SizedBox(width: context.responsiveWidth(percentage), child: this);

  /// Constrain widget height responsively
  Widget constrainHeight(BuildContext context, double percentage) =>
      SizedBox(height: context.responsiveHeight(percentage), child: this);
}
