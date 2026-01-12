import 'package:flutter/widgets.dart';
import '../dimensions/screen_dimensions.dart';
import '../dimensions/content_dimensions.dart';

/// Utility class for layout-related calculations and helpers.
class LayoutUtils {
  const LayoutUtils._();

  /// Calculates the number of grid columns based on screen width.
  ///
  /// Returns:
  /// * 4 columns for compact screens
  /// * 8 columns for medium screens
  /// * 12 columns for expanded/wide screens
  static int getGridColumns(BuildContext context) {
    final screenType = ScreenDimensions.getScreenType(context);

    return switch (screenType) {
      ScreenType.compact => 4,
      ScreenType.medium => 8,
      ScreenType.expanded || ScreenType.wide => 12,
    };
  }

  /// Calculates the width for a grid item based on the number of columns it should span.
  ///
  /// [columnSpan] must be less than or equal to the total number of columns for the current screen size.
  static double getGridItemWidth(BuildContext context, int columnSpan) {
    final totalColumns = getGridColumns(context);
    assert(
      columnSpan <= totalColumns,
      'Column span cannot exceed total columns',
    );

    final maxWidth = ContentDimensions.getMaxContentWidth(context);
    return (maxWidth / totalColumns) * columnSpan;
  }

  /// Whether the layout should use a single column (stack) layout.
  static bool shouldUseSingleColumn(BuildContext context) {
    return ScreenDimensions.isCompact(context);
  }

  /// Whether the layout should show navigation rail instead of drawer.
  static bool shouldShowNavigationRail(BuildContext context) {
    return !ScreenDimensions.isCompact(context) &&
        !ScreenDimensions.isWide(context);
  }

  /// Whether the layout should show permanent drawer.
  static bool shouldShowPermanentDrawer(BuildContext context) {
    return ScreenDimensions.isWide(context);
  }
}
