import 'package:flutter/material.dart';

/// Material Design 3 typography implementation
/// Provides standardized text styles following Material 3 type scale
@immutable
class AppText {
  const AppText._();

  // Font families
  static const String _fontFamily = 'Roboto';

  // Font weights
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;

  /// Display Large - 57/64 (size/height)
  static TextStyle displayLarge({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
    fontWeight: _regular,
    color: color,
  );

  /// Display Medium - 45/52
  static TextStyle displayMedium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45,
    height: 52 / 45,
    letterSpacing: 0,
    fontWeight: _regular,
    color: color,
  );

  /// Display Small - 36/44
  static TextStyle displaySmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    height: 44 / 36,
    letterSpacing: 0,
    fontWeight: _regular,
    color: color,
  );

  /// Headline Large - 32/40
  static TextStyle headlineLarge({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: 0,
    fontWeight: _regular,
    color: color,
  );

  /// Headline Medium - 28/36
  static TextStyle headlineMedium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: 0,
    fontWeight: _regular,
    color: color,
  );

  /// Headline Small - 24/32
  static TextStyle headlineSmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: 0,
    fontWeight: _regular,
    color: color,
  );

  /// Title Large - 22/28
  static TextStyle titleLarge({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: 0,
    fontWeight: _regular,
    color: color,
  );

  /// Title Medium - 16/24
  static TextStyle titleMedium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    fontWeight: _medium,
    color: color,
  );

  /// Title Small - 14/20
  static TextStyle titleSmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: _medium,
    color: color,
  );

  /// Label Large - 14/20
  static TextStyle labelLarge({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
    fontWeight: _medium,
    color: color,
  );

  /// Label Medium - 12/16
  static TextStyle labelMedium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
    fontWeight: _medium,
    color: color,
  );

  /// Label Small - 11/16
  static TextStyle labelSmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.5,
    fontWeight: _medium,
    color: color,
  );

  /// Body Large - 16/24
  static TextStyle bodyLarge({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    fontWeight: _regular,
    color: color,
  );

  /// Body Medium - 14/20
  static TextStyle bodyMedium({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.25,
    fontWeight: _regular,
    color: color,
  );

  /// Body Small - 12/16
  static TextStyle bodySmall({Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.4,
    fontWeight: _regular,
    color: color,
  );

  /// Creates a TextTheme using the defined text styles
  static TextTheme createTextTheme(ColorScheme colorScheme) => TextTheme(
    displayLarge: displayLarge(color: colorScheme.onSurface),
    displayMedium: displayMedium(color: colorScheme.onSurface),
    displaySmall: displaySmall(color: colorScheme.onSurface),
    headlineLarge: headlineLarge(color: colorScheme.onSurface),
    headlineMedium: headlineMedium(color: colorScheme.onSurface),
    headlineSmall: headlineSmall(color: colorScheme.onSurface),
    titleLarge: titleLarge(color: colorScheme.onSurface),
    titleMedium: titleMedium(color: colorScheme.onSurface),
    titleSmall: titleSmall(color: colorScheme.onSurface),
    labelLarge: labelLarge(color: colorScheme.onSurface),
    labelMedium: labelMedium(color: colorScheme.onSurface),
    labelSmall: labelSmall(color: colorScheme.onSurface),
    bodyLarge: bodyLarge(color: colorScheme.onSurface),
    bodyMedium: bodyMedium(color: colorScheme.onSurface),
    bodySmall: bodySmall(color: colorScheme.onSurface),
  );

  /// Common component text styles
  static TextStyle get buttonText => labelLarge();
  static TextStyle get inputText => bodyLarge();
  static TextStyle get captionText => bodySmall();
  static TextStyle get overlineText => labelSmall().copyWith(
    letterSpacing: 1.5,
    fontWeight: _medium,
    height: 16 / 11,
  );

  /// Utility methods for text emphasis
  static TextStyle emphasize(TextStyle style) => style.copyWith(
    fontWeight: _medium,
    letterSpacing: style.letterSpacing! + 0.1,
  );

  static TextStyle deEmphasize(TextStyle style) => style.copyWith(
    fontWeight: _regular,
    letterSpacing: style.letterSpacing! - 0.1,
  );
}
