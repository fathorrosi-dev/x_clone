/// Theme state management for the application
///
/// This file defines the state structure for theme preferences, including:
/// - Theme mode (system/light/dark)
/// - Dynamic color support
/// - Text scaling preferences
/// - Theme variant selection
library;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../app_style.dart';

part 'theme_state.g.dart';

/// Available theme variants
enum ThemeVariant {
  /// Default Material 3 theme
  material,

  /// Custom brand theme
  brand,
}

/// Constants for text scaling
class ThemeConstants {
  static const double minTextScale = 0.8;
  static const double maxTextScale = 1.2;
  static const double defaultTextScale = 1.0;
}

/// Immutable state class for theme preferences
@JsonSerializable()
class ThemeState extends Equatable {
  /// Creates a new theme state instance
  ///
  /// Parameters:
  /// - [themeMode]: The current theme mode (system/light/dark)
  /// - [useDynamicColor]: Whether to use dynamic color generation
  /// - [textScaleFactor]: Custom text scaling factor
  /// - [useSystemTextScale]: Whether to use system text scaling
  /// - [themeVariant]: Selected theme variant
  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.useDynamicColor = true,
    this.textScaleFactor = ThemeConstants.defaultTextScale,
    this.useSystemTextScale = true,
    this.themeVariant = ThemeVariant.material,
  });

  /// Current theme mode (system/light/dark)
  final ThemeMode themeMode;

  /// Whether dynamic color generation is enabled
  final bool useDynamicColor;

  /// Custom text scaling factor (between 0.8 and 1.2)
  final double textScaleFactor;

  /// Whether to use system text scaling
  final bool useSystemTextScale;

  /// Selected theme variant
  final ThemeVariant themeVariant;

  /// Gets the system text scale from the given context
  static TextScaler _getSystemTextScale(BuildContext context) {
    final view = View.of(context);
    final mediaQuery = MediaQueryData.fromView(view);
    return mediaQuery.textScaler;
  }

  /// Gets the custom text scaler based on the text scale factor
  TextScaler get _customTextScaler => TextScaler.linear(textScaleFactor);

  /// Creates a theme data instance with the given configuration
  ThemeData _createTheme(
    BuildContext context, {
    required Brightness brightness,
  }) {
    // Use system text scaling directly since ResponsiveTextStyle handles it
    return AppStyle.createTheme(
      brightness: brightness,
      useDynamicColor: useDynamicColor,
      variant: themeVariant,
      // Only apply custom text scaling when system scaling is disabled
      textScaler: useSystemTextScale ? TextScaler.noScaling : _customTextScaler,
    );
  }

  /// Light theme configuration
  ThemeData createLightTheme(BuildContext context) =>
      _createTheme(context, brightness: Brightness.light);

  /// Dark theme configuration
  ThemeData createDarkTheme(BuildContext context) =>
      _createTheme(context, brightness: Brightness.dark);

  @override
  List<Object> get props => [
    themeMode,
    useDynamicColor,
    textScaleFactor,
    useSystemTextScale,
    themeVariant,
  ];

  /// Creates a new instance with updated values
  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? useDynamicColor,
    double? textScaleFactor,
    bool? useSystemTextScale,
    ThemeVariant? themeVariant,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      useDynamicColor: useDynamicColor ?? this.useDynamicColor,
      textScaleFactor:
          textScaleFactor?.clamp(
            ThemeConstants.minTextScale,
            ThemeConstants.maxTextScale,
          ) ??
          this.textScaleFactor,
      useSystemTextScale: useSystemTextScale ?? this.useSystemTextScale,
      themeVariant: themeVariant ?? this.themeVariant,
    );
  }

  /// Create ThemeState from JSON
  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);

  /// Convert ThemeState to JSON
  Map<String, dynamic> toJson() => _$ThemeStateToJson(this);

  /// Get effective text scaler based on context
  TextScaler getEffectiveTextScaler(BuildContext context) {
    if (useSystemTextScale) {
      return _getSystemTextScale(context);
    }
    return _customTextScaler;
  }

  /// Get effective brightness based on theme mode and platform
  Brightness getEffectiveBrightness(BuildContext context) {
    return switch (themeMode) {
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark,
      ThemeMode.system => MediaQuery.platformBrightnessOf(context),
    };
  }
}
