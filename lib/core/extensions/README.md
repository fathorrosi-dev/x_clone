# Extensions Directory Documentation

## Overview

The `extensions` directory contains Dart extensions that enhance the functionality of built-in classes and provide convenient utilities for UI development. These extensions help maintain clean, readable code while providing type-safe access to theme properties and common utilities.

## Key Extensions

### Theme Extensions

#### `theme_sizes.dart`
Provides convenient access to standardized sizes:
```dart
extension ThemeSizes on BuildContext {
  // Access standard sizes through context
  double get standardHeight => ...;
  double get buttonHeight => ...;
}

// Usage example
Container(
  height: context.buttonHeight,
  width: context.standardWidth,
)
```

#### `theme_insets.dart`
Manages padding and margin values:
```dart
extension ThemeInsets on BuildContext {
  // Access standard insets through context
  EdgeInsets get standard => ...;
  EdgeInsets get large => ...;
}

// Usage example
Padding(
  padding: context.insets.standard,
  child: YourWidget(),
)
```

#### `theme_corners.dart`
Provides border radius values:
```dart
extension ThemeCorners on BuildContext {
  // Access border radius values through context
  BorderRadius get small => ...;
  BorderRadius get medium => ...;
}

// Usage example
Container(
  decoration: BoxDecoration(
    borderRadius: context.corners.medium,
  ),
)
```

### Responsive Extensions (`responsive_extensions.dart`)

Provides comprehensive responsive design utilities through BuildContext extensions:

```dart
extension ResponsiveContextExtension on BuildContext {
  // Screen information
  bool get isMobile => ...
  bool get isTablet => ...
  bool get isDesktop => ...
  bool get isLargeDesktop => ...

  // Material 3 breakpoints
  bool get isCompact => ...
  bool get isMedium => ...
  bool get isExpanded => ...

  // Layout helpers
  EdgeInsets get responsivePadding => ...
  double get maxContentWidth => ...
  double responsiveFontSize(double base, {double? min, double? max}) => ...
}

// Usage examples
if (context.isMobile) {
  // Mobile-specific layout
}

Text(
  'Responsive Text',
  style: TextStyle(
    fontSize: context.responsiveFontSize(16, min: 14, max: 20),
  ),
)

Container(
  padding: context.responsivePadding,
  constraints: BoxConstraints(
    maxWidth: context.maxContentWidth,
  ),
)
```

### Widget Extensions (`responsive_extensions.dart`)

Extends Widget class with responsive capabilities:

```dart
extension ResponsiveWidgetExtension on Widget {
  Widget responsiveWidget({
    Widget? compact,
    Widget? medium,
    Widget? expanded,
    Widget? wide,
  }) => ...

  Widget visibleOnMobile() => ...
  Widget visibleOnTablet() => ...
  Widget visibleOnDesktop() => ...
}

// Usage examples
MyWidget().visibleOnMobile()

Container().responsiveWidget(
  compact: MobileLayout(),
  medium: TabletLayout(),
  expanded: DesktopLayout(),
)
```

## Best Practices

1. **Extension Usage**
   - Keep extensions focused on a single responsibility
   - Use meaningful names that reflect the extension's purpose
   - Document all extension methods
   - Include usage examples in comments

2. **Performance**
   - Avoid complex computations in extension methods
   - Cache values when appropriate
   - Use const constructors where possible

3. **Maintenance**
   - Group related extensions in the same file
   - Keep extension methods simple and pure
   - Test extension methods thoroughly

4. Use the responsive extensions to handle different screen sizes and orientations
5. Prefer using the provided responsive methods over manual calculations
6. Keep responsive logic in the widget tree rather than business logic
7. Use the Material 3 breakpoint checks (`isCompact`, `isMedium`, etc.) for Material Design consistency

## Example Usage

### Combined Theme Extensions

```dart
class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.insets.standard,
      margin: context.insets.small,
      decoration: BoxDecoration(
        borderRadius: context.corners.medium,
        color: Theme.of(context).cardColor,
      ),
      constraints: BoxConstraints(
        maxWidth: context.sizes.cardWidth,
        minHeight: context.sizes.cardMinHeight,
      ),
      child: YourContent(),
    );
  }
}
```

### Creating New Extensions

When creating new extensions:
1. Follow the naming convention: `theme_*.dart` for theme-related extensions
2. Add comprehensive documentation
3. Include usage examples
4. Consider edge cases and null safety

## Integration Guide

1. Import required extensions:
```dart
import 'package:my_app/core/extensions/theme_sizes.dart';
import 'package:my_app/core/extensions/theme_insets.dart';
import 'package:my_app/core/extensions/theme_corners.dart';
```

2. Use extensions in your widgets:
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.insets.standard,
      decoration: BoxDecoration(
        borderRadius: context.corners.small,
      ),
      constraints: BoxConstraints(
        maxWidth: context.sizes.maxWidth,
      ),
    );
  }
}
```

## Integration with Utils

The responsive extensions work in conjunction with `responsive_utils.dart` which defines the core breakpoints and constants. The extensions use these values internally to provide a consistent responsive experience.
