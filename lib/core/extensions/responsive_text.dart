import 'package:flutter/material.dart';

extension ResponsiveTextStyle on TextStyle {
  /// Creates a responsive text style that automatically adjusts font size
  /// based on screen width while maintaining the original style properties
  TextStyle responsive(BuildContext context, {double? min, double? max}) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Reference width for scaling (portrait and landscape)
    final referenceWidth = mediaQuery.orientation == Orientation.portrait
        ? 375.0
        : 667.0;

    // Calculate the base size based on screen width
    double size = fontSize! * (screenWidth / referenceWidth);

    // Apply the system text scaling
    size = mediaQuery.textScaler.scale(size);

    // Apply min and max constraints if provided
    if (min != null && size < min) size = min;
    if (max != null && size > max) size = max;

    // Return a copy of the original style with the new font size
    return copyWith(fontSize: size);
  }
}

// Optional: Extension on BuildContext for even more convenient access
extension TextThemeResponsive on BuildContext {
  /// Provides a responsive version of the current text theme
  TextTheme get responsiveTextTheme {
    final textTheme = Theme.of(this).textTheme;
    return TextTheme(
      displayLarge: textTheme.displayLarge?.responsive(this),
      displayMedium: textTheme.displayMedium?.responsive(this),
      displaySmall: textTheme.displaySmall?.responsive(this),
      headlineLarge: textTheme.headlineLarge?.responsive(this),
      headlineMedium: textTheme.headlineMedium?.responsive(this),
      headlineSmall: textTheme.headlineSmall?.responsive(this),
      titleLarge: textTheme.titleLarge?.responsive(this),
      titleMedium: textTheme.titleMedium?.responsive(this),
      titleSmall: textTheme.titleSmall?.responsive(this),
      bodyLarge: textTheme.bodyLarge?.responsive(this),
      bodyMedium: textTheme.bodyMedium?.responsive(this),
      bodySmall: textTheme.bodySmall?.responsive(this),
      labelLarge: textTheme.labelLarge?.responsive(this),
      labelMedium: textTheme.labelMedium?.responsive(this),
      labelSmall: textTheme.labelSmall?.responsive(this),
    );
  }
}
