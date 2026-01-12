/// Theme state management using HydratedBloc
///
/// This Cubit manages theme preferences with persistent storage support.
/// It handles:
/// - Theme mode changes (system/light/dark)
/// - Dynamic color toggling
/// - Text scaling preferences
/// - Theme variant selection
///
/// The state is automatically saved to and restored from storage using
/// HydratedBloc's storage system.
library;

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:x_clone/core/theme/state/theme_state.dart';

/// Cubit for managing theme preferences with persistent storage
class ThemeCubit extends HydratedCubit<ThemeState> {
  /// Creates a new ThemeCubit instance
  ThemeCubit() : super(const ThemeState());

  /// Constants for text scaling
  static const double _minTextScale = 0.8;
  static const double _maxTextScale = 1.2;
  static const double _defaultTextScale = 1.0;

  /// Changes the current theme mode
  void setThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  /// Toggles between light and dark mode
  void toggleThemeMode(BuildContext context) {
    final newMode = switch (state.themeMode) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system =>
        MediaQuery.platformBrightnessOf(context) == Brightness.light
            ? ThemeMode.dark
            : ThemeMode.light,
    };
    setThemeMode(newMode);
  }

  /// Toggles dynamic color generation on/off
  void toggleDynamicColor() {
    emit(state.copyWith(useDynamicColor: !state.useDynamicColor));
  }

  /// Sets custom text scale factor
  ///
  /// The factor will be clamped between [_minTextScale] and [_maxTextScale]
  void setTextScaleFactor(double factor) {
    final clampedFactor = factor.clamp(_minTextScale, _maxTextScale);
    if (factor != clampedFactor) {
      debugPrint(
        'Warning: Text scale factor ($factor) clamped to $clampedFactor',
      );
    }

    emit(
      state.copyWith(textScaleFactor: clampedFactor, useSystemTextScale: false),
    );
  }

  /// Increases text scale factor by 0.1
  void increaseTextScale() {
    if (!state.useSystemTextScale) {
      final newScale = (state.textScaleFactor + 0.1).clamp(
        _minTextScale,
        _maxTextScale,
      );
      setTextScaleFactor(newScale);
    }
  }

  /// Decreases text scale factor by 0.1
  void decreaseTextScale() {
    if (!state.useSystemTextScale) {
      final newScale = (state.textScaleFactor - 0.1).clamp(
        _minTextScale,
        _maxTextScale,
      );
      setTextScaleFactor(newScale);
    }
  }

  /// Resets text scale factor to default
  void resetTextScale() {
    setTextScaleFactor(_defaultTextScale);
  }

  /// Toggles between system and custom text scaling
  void toggleSystemTextScale() {
    emit(state.copyWith(useSystemTextScale: !state.useSystemTextScale));
  }

  /// Changes the current theme variant
  void setThemeVariant(ThemeVariant variant) {
    emit(state.copyWith(themeVariant: variant));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      return ThemeState.fromJson(json);
    } catch (e) {
      debugPrint('Error deserializing theme state: $e');
      return const ThemeState();
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    try {
      return state.toJson();
    } catch (e) {
      debugPrint('Error serializing theme state: $e');
      return null;
    }
  }
}
