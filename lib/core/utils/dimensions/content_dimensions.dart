import 'package:flutter/widgets.dart';
import 'screen_dimensions.dart';

/// Utility class for content dimension calculations based on screen size.
class ContentDimensions {
  const ContentDimensions._();

  // Content Width Scale Factors
  static const double _kWideContentScale = 0.75;
  static const double _kExpandedContentScale = 0.85;
  static const double _kMediumContentScale = 0.90;

  // Maximum Content Widths
  static const double _kMaxWideWidth = 1400.0;
  static const double _kMaxExpandedWidth = 1200.0;
  static const double _kMaxMediumWidth = 840.0;
  static const double _kMaxCompactWidth = 600.0;

  /// Gets the maximum content width based on the current screen type.
  ///
  /// The width is calculated as a percentage of the screen width, with
  /// different scales for different screen types:
  /// * Wide: 75% of screen width, max 1400dp
  /// * Expanded: 85% of screen width, max 1200dp
  /// * Medium: 90% of screen width, max 840dp
  /// * Compact: 100% of screen width, max 600dp
  static double getMaxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final screenType = ScreenDimensions.getScreenType(context);

    return switch (screenType) {
      ScreenType.wide => (width * _kWideContentScale).clamp(
        0.0,
        _kMaxWideWidth,
      ),
      ScreenType.expanded => (width * _kExpandedContentScale).clamp(
        0.0,
        _kMaxExpandedWidth,
      ),
      ScreenType.medium => (width * _kMediumContentScale).clamp(
        0.0,
        _kMaxMediumWidth,
      ),
      ScreenType.compact => width.clamp(0.0, _kMaxCompactWidth),
    };
  }

  /// Gets the appropriate content scale factor based on screen type.
  static double getContentScale(BuildContext context) {
    final screenType = ScreenDimensions.getScreenType(context);

    return switch (screenType) {
      ScreenType.wide => _kWideContentScale,
      ScreenType.expanded => _kExpandedContentScale,
      ScreenType.medium => _kMediumContentScale,
      ScreenType.compact => 1.0,
    };
  }
}
