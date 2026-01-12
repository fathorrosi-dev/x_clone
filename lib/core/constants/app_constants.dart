/// Application-wide constants library
///
/// This file serves as a barrel file that exports all constant-related
/// modules for easy access throughout the application.
library;

export 'ui/animation_constants.dart';
export 'validation/validation_constants.dart';
export 'ui/responsive_constants.dart';
export 'app_constants.dart';

/// Shared preferences keys
class PreferenceKeys {
  static const themeMode = 'theme_mode';
  static const useDynamicColors = 'use_dynamic_colors';
  static const currency = 'currency';
  static const language = 'language';
}
