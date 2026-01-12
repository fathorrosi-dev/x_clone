/// Core utilities library
/// Provides common utility functions and helpers
library;

export 'logger.dart';
export 'animation_utils.dart';
export 'responsive_utils.dart';
export 'dimensions/screen_dimensions.dart';

/// Utility Functions Documentation:
///
/// 1. Logger (`logger.dart`)
/// - Structured logging with different log levels
/// - Debug information formatting
/// ```dart
/// logger.info('Operation completed');
/// logger.error('Error occurred', error, stackTrace);
/// ```
///
/// 2. Animation Utils (`animation_utils.dart`)
/// - Common animation curves and durations
/// - Animation helper functions
/// ```dart
/// widget.animate(
///   duration: AnimationUtils.defaultDuration,
///   curve: AnimationUtils.defaultCurve,
/// )
/// ```
///
/// 3. Responsive Utils (`responsive_utils.dart`)
/// - Screen size calculations
/// - Device type detection
/// ```dart
/// if (ResponsiveUtils.isTablet(context)) {
///   // Tablet-specific logic
/// }
/// ```
///
/// 4. Screen Dimensions (`dimensions/screen_dimensions.dart`)
/// - Device-specific measurements
/// - Responsive scaling helpers
/// ```dart
/// final screenWidth = ScreenDimensions.width(context);
/// final isLandscape = ScreenDimensions.isLandscape(context);
/// ```
