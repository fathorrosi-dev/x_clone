import 'package:flutter/material.dart';
import 'package:x_clone/core/utils/dimensions/screen_dimensions.dart';
import 'package:x_clone/core/utils/layout/padding_utils.dart';
import 'package:x_clone/core/utils/breakpoints/app_breakpoints.dart';

/// Base class for all app components that provides common functionality
/// and responsive behavior.
///
/// This abstract class implements common methods and properties that are
/// shared across multiple components in the app.
abstract class BaseComponent extends StatelessWidget {
  const BaseComponent({super.key});

  /// Gets the appropriate max width based on screen size
  double getMaxWidth(BuildContext context) {
    if (ScreenDimensions.isWide(context)) {
      return AppBreakpoints.k4K;
    } else if (ScreenDimensions.isExpanded(context)) {
      return AppBreakpoints.kDesktop;
    } else if (ScreenDimensions.isMedium(context)) {
      return AppBreakpoints.kTablet;
    }
    return AppBreakpoints.kMobile;
  }

  /// Gets appropriate content constraints based on screen size
  BoxConstraints getContentConstraints(BuildContext context) {
    final maxWidth = getMaxWidth(context);
    return BoxConstraints(maxWidth: maxWidth, minWidth: 0);
  }

  /// Determines if scrollbar should be shown based on platform
  bool shouldShowScrollbar(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return true;
      default:
        return false;
    }
  }

  /// Gets appropriate padding based on screen size
  EdgeInsets getResponsivePadding(BuildContext context) {
    return PaddingUtils.getScreenPadding(context);
  }

  /// Gets appropriate horizontal padding based on screen size
  double getHorizontalPadding(BuildContext context) {
    return PaddingUtils.getHorizontalPadding(context);
  }

  /// Gets appropriate vertical padding based on screen size
  double getVerticalPadding(BuildContext context) {
    return PaddingUtils.getVerticalPadding(context);
  }

  /// Helper method to apply responsive constraints to a widget
  Widget withResponsiveConstraints(BuildContext context, Widget child) {
    return Center(
      child: ConstrainedBox(
        constraints: getContentConstraints(context),
        child: child,
      ),
    );
  }

  /// Helper method to apply responsive padding to a widget
  Widget withResponsivePadding(BuildContext context, Widget child) {
    return Padding(padding: getResponsivePadding(context), child: child);
  }
}
