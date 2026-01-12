import 'dart:math';
import 'package:flutter/material.dart';

/// Twitter (X) inspired color system implementation
/// Provides standardized colors for both light and dark themes
@immutable
class AppColors {
  const AppColors._();

  // Light Theme Colors
  static const Color _lightPrimary = Color(0xFF1D9BF0); // Twitter Blue
  static const Color _lightOnPrimary = Color(0xFFFFFFFF);
  static const Color _lightPrimaryContainer = Color(
    0xFFE8F5FE,
  ); // Light Blue background
  static const Color _lightOnPrimaryContainer = Color(0xFF1D9BF0);

  static const Color _lightSecondary = Color(0xFF536471); // Twitter Gray
  static const Color _lightOnSecondary = Color(0xFFFFFFFF);
  static const Color _lightSecondaryContainer = Color(
    0xFFF7F9F9,
  ); // Light Gray background
  static const Color _lightOnSecondaryContainer = Color(0xFF536471);

  static const Color _lightTertiary = Color(0xFF00BA7C); // Twitter Green
  static const Color _lightOnTertiary = Color(0xFFFFFFFF);
  static const Color _lightTertiaryContainer = Color(
    0xFFE6F3ED,
  ); // Light Green background
  static const Color _lightOnTertiaryContainer = Color(0xFF00BA7C);

  static const Color _lightSurface = Color(0xFFFFFFFF); // White
  static const Color _lightOnSurface = Color(0xFF0F1419); // Near Black
  static const Color _lightSurfaceVariant = Color(0xFFF7F9F9); // Light Gray
  static const Color _lightOnSurfaceVariant = Color(0xFF536471); // Twitter Gray

  static const Color _lightOutline = Color(0xFFCFD9DE); // Twitter Border Color
  static const Color _lightOutlineVariant = Color(
    0xFFEFF3F4,
  ); // Light Border Color

  // Dark Theme Colors
  static const Color _darkPrimary = Color(0xFF1D9BF0); // Twitter Blue
  static const Color _darkOnPrimary = Color(0xFFFFFFFF);
  static const Color _darkPrimaryContainer = Color(
    0xFF1E2732,
  ); // Dark Blue background
  static const Color _darkOnPrimaryContainer = Color(0xFF1D9BF0);

  static const Color _darkSecondary = Color(0xFF71767B); // Twitter Dark Gray
  static const Color _darkOnSecondary = Color(0xFFFFFFFF);
  static const Color _darkSecondaryContainer = Color(
    0xFF1E2732,
  ); // Dark Gray background
  static const Color _darkOnSecondaryContainer = Color(0xFFE7E9EA);

  static const Color _darkTertiary = Color(0xFF00BA7C); // Twitter Green
  static const Color _darkOnTertiary = Color(0xFFFFFFFF);
  static const Color _darkTertiaryContainer = Color(
    0xFF1E2732,
  ); // Dark Green background
  static const Color _darkOnTertiaryContainer = Color(0xFF00BA7C);

  static const Color _darkSurface = Color(0xFF000000); // Black
  static const Color _darkOnSurface = Color(0xFFE7E9EA); // Near White
  static const Color _darkSurfaceVariant = Color(
    0xFF15202B,
  ); // Twitter Dark Mode Blue
  static const Color _darkOnSurfaceVariant = Color(
    0xFF71767B,
  ); // Twitter Dark Gray

  static const Color _darkOutline = Color(0xFF2F3336); // Twitter Dark Border
  static const Color _darkOutlineVariant = Color(
    0xFF3E4144,
  ); // Dark Border Variant

  // Error Colors (shared between themes)
  static const Color _error = Color(0xFFF4212E); // Twitter Red
  static const Color _onError = Color(0xFFFFFFFF);
  static const Color _errorContainer = Color(
    0xFFFDE8E9,
  ); // Light Red background
  static const Color _onErrorContainer = Color(0xFFF4212E);

  // Inverse Colors (shared between themes)
  static const Color _inverseSurface = Color(
    0xFF15202B,
  ); // Twitter Dark Mode Blue
  static const Color _onInverseSurface = Color(0xFFE7E9EA); // Near White
  static const Color _inversePrimary = Color(0xFF1D9BF0); // Twitter Blue
  static const Color _surfaceTint = Color(0xFF1D9BF0); // Twitter Blue

  /// Creates a light theme color scheme
  static ColorScheme get light => const ColorScheme.light(
    primary: _lightPrimary,
    onPrimary: _lightOnPrimary,
    primaryContainer: _lightPrimaryContainer,
    onPrimaryContainer: _lightOnPrimaryContainer,
    secondary: _lightSecondary,
    onSecondary: _lightOnSecondary,
    secondaryContainer: _lightSecondaryContainer,
    onSecondaryContainer: _lightOnSecondaryContainer,
    tertiary: _lightTertiary,
    onTertiary: _lightOnTertiary,
    tertiaryContainer: _lightTertiaryContainer,
    onTertiaryContainer: _lightOnTertiaryContainer,
    error: _error,
    onError: _onError,
    errorContainer: _errorContainer,
    onErrorContainer: _onErrorContainer,
    surface: _lightSurface,
    onSurface: _lightOnSurface,
    surfaceContainerHighest: _lightSurfaceVariant,
    onSurfaceVariant: _lightOnSurfaceVariant,
    outline: _lightOutline,
    outlineVariant: _lightOutlineVariant,
    inverseSurface: _inverseSurface,
    onInverseSurface: _onInverseSurface,
    inversePrimary: _inversePrimary,
    surfaceTint: _surfaceTint,
  );

  /// Creates a dark theme color scheme
  static ColorScheme get dark => const ColorScheme.dark(
    primary: _darkPrimary,
    onPrimary: _darkOnPrimary,
    primaryContainer: _darkPrimaryContainer,
    onPrimaryContainer: _darkOnPrimaryContainer,
    secondary: _darkSecondary,
    onSecondary: _darkOnSecondary,
    secondaryContainer: _darkSecondaryContainer,
    onSecondaryContainer: _darkOnSecondaryContainer,
    tertiary: _darkTertiary,
    onTertiary: _darkOnTertiary,
    tertiaryContainer: _darkTertiaryContainer,
    onTertiaryContainer: _darkOnTertiaryContainer,
    error: _error,
    onError: _onError,
    errorContainer: _errorContainer,
    onErrorContainer: _onErrorContainer,
    surface: _darkSurface,
    onSurface: _darkOnSurface,
    surfaceContainerHighest: _darkSurfaceVariant,
    onSurfaceVariant: _darkOnSurfaceVariant,
    outline: _darkOutline,
    outlineVariant: _darkOutlineVariant,
    inverseSurface: _inverseSurface,
    onInverseSurface: _onInverseSurface,
    inversePrimary: _inversePrimary,
    surfaceTint: _surfaceTint,
  );

  /// Returns a color scheme based on the given brightness
  static ColorScheme getScheme(Brightness brightness) =>
      brightness == Brightness.light ? light : dark;

  /// Utility Functions

  /// Shifts a color's lightness by the given amount
  static Color shiftLightness(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Applies elevation tint to a surface color
  static Color elevatedSurface(Color surface, double elevation) {
    if (elevation == 0) return surface;
    final opacity = (4.5 * log(elevation + 1) + 2) / 100;
    return Color.alphaBlend(Colors.white.withValues(alpha: opacity), surface);
  }

  /// Returns a disabled container color based on theme brightness
  static Color disabledContainer(bool isDark) =>
      isDark ? _darkSurfaceVariant : _lightSurfaceVariant;

  /// Returns a disabled content color based on theme brightness
  static Color disabledContent(bool isDark) =>
      (isDark ? _darkOnSurface : _lightOnSurface).withValues(alpha: 0.38);
}
