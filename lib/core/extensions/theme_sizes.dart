import 'package:flutter/material.dart';

import '../theme/styles/app_sizes.dart';

/// Extension on [BuildContext] to easily access size values
extension ThemeSizesX on BuildContext {
  /// Material 3 Breakpoints
  double get breakpointCompact => AppSizes.breakpointCompact;
  double get breakpointMedium => AppSizes.breakpointMedium;
  double get breakpointExpanded => AppSizes.breakpointExpanded;
  double get breakpointWide => AppSizes.breakpointWide;

  /// Material 3 Spacing System
  double get sizeSpace0 => AppSizes.space0;
  double get sizeSpace4 => AppSizes.space4;
  double get sizeSpace8 => AppSizes.space8;
  double get sizeSpace12 => AppSizes.space12;
  double get sizeSpace16 => AppSizes.space16;
  double get sizeSpace24 => AppSizes.space24;
  double get sizeSpace32 => AppSizes.space32;
  double get sizeSpace40 => AppSizes.space40;
  double get sizeSpace48 => AppSizes.space48;
  double get sizeSpace56 => AppSizes.space56;
  double get sizeSpace64 => AppSizes.space64;

  /// Material 3 Navigation Component Sizes
  double get navigationBarHeight => AppSizes.navigationBarHeight;
  double get navigationRailWidth => AppSizes.navigationRailWidth;
  double get navigationDrawerWidth => AppSizes.navigationDrawerWidth;
  double get appBarHeight => AppSizes.appBarHeight;
  double get bottomAppBarHeight => AppSizes.bottomAppBarHeight;

  /// Material 3 Touch Targets
  double get minimumTouchTarget => AppSizes.minimumTouchTarget;
  double get iconButtonSize => AppSizes.iconButtonSize;
  double get fabSize => AppSizes.fabSize;
  double get smallFabSize => AppSizes.smallFabSize;

  /// Material 3 Container Sizes
  double get cardMinWidth => AppSizes.cardMinWidth;
  double get dialogMinWidth => AppSizes.dialogMinWidth;
  double get dialogMaxWidth => AppSizes.dialogMaxWidth;
  double get modalBottomSheetMinHeight => AppSizes.modalBottomSheetMinHeight;
  double get maxContentWidth => AppSizes.maxContentWidth;
  double get maxModalWidth => AppSizes.maxModalWidth;

  /// Material 3 List and Grid Sizes
  double get listItemHeight => AppSizes.listItemHeight;
  double get listItemHeightSmall => AppSizes.listItemHeightSmall;

  /// Helper method to get responsive value based on screen width
  T getResponsiveValue<T>({
    required T compact,
    T? medium,
    T? expanded,
    T? wide,
  }) {
    final width = MediaQuery.of(this).size.width;
    if (width >= breakpointWide && wide != null) return wide;
    if (width >= breakpointExpanded && expanded != null) return expanded;
    if (width >= breakpointMedium && medium != null) return medium;
    return compact;
  }
}
