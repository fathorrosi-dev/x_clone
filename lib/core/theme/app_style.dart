/// Core styling configuration for the application.
///
/// This library defines the application's visual style, including:
/// * Color schemes (light and dark)
/// * Typography
/// * Component styles
/// * Spacing and layout metrics
/// * Corner radii
/// * Insets and padding
///
/// The styling system follows Material 3 design guidelines and provides
/// a consistent visual language across the application.
library;

import 'package:flutter/material.dart';
import 'state/theme_state.dart';
import 'styles/app_colors.dart';
import 'styles/app_corners.dart';
import 'styles/app_insets.dart';
import 'styles/app_text.dart';

/// Core styling configuration for the application.
///
/// This class serves as the central point for theme management,
/// combining colors, typography, and component styles into a cohesive theme.
/// It supports:
/// * Light and dark themes
/// * Dynamic colors
/// * Text scaling
/// * Component-specific theming
/// * Material 3 design guidelines
class AppStyle {
  const AppStyle._();

  /// Creates a theme data instance with the specified configuration
  static ThemeData createTheme({
    required Brightness brightness,
    bool useDynamicColor = true,
    ThemeVariant variant = ThemeVariant.material,
    TextScaler textScaler = const TextScaler.linear(1.0),
  }) {
    final colorScheme = brightness == Brightness.light
        ? AppColors.light
        : AppColors.dark;

    return _baseTheme(
      colorScheme: colorScheme,
      brightness: brightness,
      textScaler: textScaler,
    );
  }

  /// Base theme configuration shared between light and dark themes
  static ThemeData _baseTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
    required TextScaler textScaler,
  }) {
    // Create base text theme - scaling will be handled by ResponsiveTextStyle
    final baseTextTheme = AppText.createTextTheme(colorScheme);

    // Only apply custom text scaling when provided
    // System text scaling will be handled by ResponsiveTextStyle
    final textTheme = textScaler == TextScaler.noScaling
        ? baseTextTheme
        : baseTextTheme.apply(
            fontSizeFactor: textScaler.scale(1.0),
            fontSizeDelta: 0.0,
          );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: brightness,

      // Typography
      textTheme: textTheme,
      primaryTextTheme: textTheme,

      // Component Themes
      appBarTheme: _buildAppBarTheme(colorScheme),
      cardTheme: _buildCardTheme(),
      elevatedButtonTheme: _buildButtonTheme(),
      inputDecorationTheme: _buildInputTheme(colorScheme),
      drawerTheme: _buildDrawerTheme(colorScheme),
      iconTheme: _buildIconTheme(colorScheme),

      // Metrics
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  /// Builds the app bar theme
  static AppBarTheme _buildAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 2,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      centerTitle: true,
      titleTextStyle: AppText.titleLarge(color: colorScheme.onSurface),
    );
  }

  /// Builds the icon theme
  static IconThemeData _buildIconTheme(ColorScheme colorScheme) {
    return IconThemeData(color: colorScheme.onSurface);
  }

  /// Builds the card theme
  static CardThemeData _buildCardTheme() {
    return CardThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: AppCorners.card),
      clipBehavior: Clip.antiAlias,
      margin: AppInsets.card,
    );
  }

  /// Builds the button theme
  static ElevatedButtonThemeData _buildButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: AppInsets.button,
        shape: RoundedRectangleBorder(borderRadius: AppCorners.buttonSquared),
      ),
    );
  }

  /// Builds the input decoration theme
  static InputDecorationTheme _buildInputTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      contentPadding: AppInsets.textField,
      border: OutlineInputBorder(
        borderRadius: AppCorners.textField,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppCorners.textField,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppCorners.textField,
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppCorners.textField,
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
    );
  }

  /// Builds the drawer theme
  static DrawerThemeData _buildDrawerTheme(ColorScheme colorScheme) {
    return DrawerThemeData(
      backgroundColor: colorScheme.surface,
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(AppCorners.large),
        ),
      ),
    );
  }
}
