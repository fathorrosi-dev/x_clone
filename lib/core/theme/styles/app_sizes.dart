import 'package:flutter/material.dart';

/// Material Design 3 sizing system implementation
/// This class provides standardized sizes and spacing following Material 3 guidelines
@immutable
class AppSizes {
  const AppSizes._();

  // Material 3 Breakpoints (dp)
  static const double breakpointCompact = 0;
  static const double breakpointMedium = 600;
  static const double breakpointExpanded = 840;
  static const double breakpointWide = 1240;

  // Material 3 Spacing System (dp)
  static const double space0 = 0;
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space56 = 56;
  static const double space64 = 64;

  // Material 3 Navigation Component Sizes (dp)
  static const double navigationBarHeight = 80;
  static const double navigationRailWidth = 80;
  static const double navigationDrawerWidth = 360;
  static const double appBarHeight = 64;
  static const double bottomAppBarHeight = 80;

  // Material 3 Touch Targets (dp)
  static const double minimumTouchTarget = 48;
  static const double iconButtonSize = 48;
  static const double fabSize = 56;
  static const double smallFabSize = 40;

  // Material 3 Container Sizes (dp)
  static const double cardMinWidth = 120;
  static const double dialogMinWidth = 280;
  static const double dialogMaxWidth = 560;
  static const double modalBottomSheetMinHeight = 120;
  static const double maxContentWidth = 1200;
  static const double maxModalWidth = 640;

  // Material 3 List and Grid Sizes (dp)
  static const double listItemHeight = 56;
  static const double listItemHeightSmall = 48;
  static const double listItemHeightLarge = 72;
  static const double gridItemSize = 120;

  // Material 3 Form Element Sizes (dp)
  static const double textFieldHeight = 56;
  static const double buttonHeight = 40;
  static const double chipHeight = 32;

  // Material 3 Layout Sizes (dp)
  static const double contentMargin = 16;
  static const double contentSpacing = 8;
  static const double gutterSpacing = 24;

  // Material 3 Border and Divider Sizes (dp)
  static const double dividerThickness = 1;
  static const double borderWidth = 1;
  static const double borderWidthFocused = 2;
  static const double borderWidthError = 2;

  // Material 3 Elevation Values (dp)
  static const double elevation0 = 0;
  static const double elevation1 = 1;
  static const double elevation2 = 3;
  static const double elevation3 = 6;
  static const double elevation4 = 8;
  static const double elevation5 = 12;

  /// Responsive Layout Helpers
  static bool isCompact(BuildContext context) =>
      MediaQuery.of(context).size.width < breakpointMedium;

  static bool isMedium(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= breakpointMedium && width < breakpointExpanded;
  }

  static bool isExpanded(BuildContext context) =>
      MediaQuery.of(context).size.width >= breakpointExpanded;

  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= breakpointWide;

  /// Returns responsive margin based on screen size
  static EdgeInsets getResponsiveMargin(BuildContext context) {
    if (isCompact(context)) {
      return const EdgeInsets.all(space16);
    } else if (isMedium(context)) {
      return const EdgeInsets.all(space24);
    }
    return const EdgeInsets.all(space32);
  }

  /// Returns responsive padding based on screen size
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isCompact(context)) {
      return const EdgeInsets.symmetric(horizontal: space16, vertical: space16);
    } else if (isMedium(context)) {
      return const EdgeInsets.symmetric(horizontal: space24, vertical: space24);
    }
    return const EdgeInsets.symmetric(horizontal: space32, vertical: space32);
  }

  /// Returns responsive width constrained by max width
  static double getResponsiveWidth(BuildContext context, {double? maxWidth}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final targetWidth = maxWidth ?? maxContentWidth;
    return screenWidth > targetWidth ? targetWidth : screenWidth;
  }

  /// Returns responsive grid column count based on screen size
  static int getResponsiveGridColumns(BuildContext context) {
    if (isCompact(context)) return 2;
    if (isMedium(context)) return 3;
    return 4;
  }

  /// Returns responsive grid item size based on available space
  static double getResponsiveGridItemSize(BuildContext context) {
    final columns = getResponsiveGridColumns(context);
    final availableWidth = getResponsiveWidth(context) - (contentMargin * 2);
    final totalGutterSpace = gutterSpacing * (columns - 1);
    return (availableWidth - totalGutterSpace) / columns;
  }

  /// Returns responsive dialog width based on screen size
  static double getResponsiveDialogWidth(BuildContext context) {
    if (isCompact(context)) return 320;
    if (isMedium(context)) return 480;
    return 560;
  }

  /// Returns responsive modal height as percentage of screen height
  static double getResponsiveModalHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.7;

  /// Returns minimum app size for different screen sizes
  static Size getMinAppSize(BuildContext context) => const Size(320, 568);
}
