/// Theme library
/// Provides consistent theming across the application
library;

export 'styles/app_colors.dart';
export 'styles/app_corners.dart';
export 'styles/app_insets.dart';
export 'styles/app_text.dart';
export 'state/theme_state.dart';
export 'state/theme_cubit.dart';

/// Theme Components:
///
/// 1. [AppColors]
/// - Defines the application's color palette
/// - Includes both light and dark theme colors
///
/// 2. [AppTheme]
/// - Configures the global application theme
/// - Provides theme data for both light and dark modes
///
/// 3. [TextStyles]
/// - Defines consistent text styles across the app
/// - Includes responsive typography
///
/// Usage Example:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   darkTheme: AppTheme.darkTheme,
///   // ...
/// )
///
/// // Using text styles
/// Text(
///   'Hello',
///   style: TextStyles.heading1,
/// )
/// ```
