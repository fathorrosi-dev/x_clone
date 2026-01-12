/// Constants library
/// Provides application-wide constants and configuration
library;

export 'app_constants.dart';
export 'ui/responsive_constants.dart';

/// Constants Documentation:
///
/// 1. App Constants (`app_constants.dart`)
/// - Application-wide configuration
/// - Feature flags
/// - API endpoints
/// ```dart
/// // API base URL
/// AppConstants.apiBaseUrl
///
/// // Feature flags
/// AppConstants.isFeatureEnabled
/// ```
///
/// 2. Responsive Constants (`ui/responsive_constants.dart`)
/// - Breakpoints for different screen sizes
/// - Default spacing and sizing
/// ```dart
/// // Screen breakpoints
/// if (width >= Breakpoints.tablet) {
///   // Tablet layout
/// }
///
/// // Layout constants
/// padding: EdgeInsets.all(ResponsiveLayoutConstants.defaultPadding)
/// ```
///
/// Best Practices:
/// - Keep constants organized by category
/// - Use meaningful names
/// - Document units where applicable
/// - Consider creating separate constant files for large feature sets
