# Theme Directory Documentation

## Overview

The `theme` directory contains all styling-related configurations and constants for the application. It establishes a consistent design system that can be easily maintained and modified.

## Directory Contents

### Styles

#### `app_sizes.dart`
Defines standard sizing constants used throughout the app:
```dart
// Example usage
Container(
  width: AppSizes.buttonWidth,
  height: AppSizes.buttonHeight,
  child: YourWidget(),
)
```

#### `app_insets.dart`
Contains padding and margin constants:
```dart
// Example usage
Padding(
  padding: AppInsets.standard,
  child: YourWidget(),
)
```

## Usage Examples

### 1. Applying Theme in Widgets

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.insets.standard, // Using theme_insets extension
      decoration: BoxDecoration(
        borderRadius: context.corners.medium, // Using theme_corners extension
      ),
      child: Text(
        'Hello World',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
```

### 2. Responsive Sizing

```dart
Container(
  width: context.sizes.containerWidth, // Using theme_sizes extension
  height: context.sizes.containerHeight,
)
```

## Best Practices

1. **Theme Constants**
   - Always use theme constants instead of hard-coded values
   - Access colors through `Theme.of(context)`
   - Use predefined text styles

2. **Responsive Design**
   - Use relative sizing through extensions
   - Test layouts on different screen sizes
   - Consider both mobile and tablet layouts

3. **Maintenance**
   - Keep all theme-related constants in appropriate files
   - Document any changes to theme constants
   - Use semantic naming for constants

## Theme Components

### Colors
- Primary and accent colors
- Text colors
- Background colors
- Status colors (error, success, warning)

### Typography
- Text styles for different purposes
- Font families
- Font sizes and weights

### Spacing
- Standard padding and margins
- Layout grid specifications
- Component-specific spacing

### Shapes
- Border radius values
- Standard shapes for components
- Shadow configurations

## Integration Guide

1. Import required theme files:
```dart
import 'package:my_app/core/theme/app_theme.dart';
import 'package:my_app/core/extensions/theme_extensions.dart';
```

2. Access theme in widgets:
```dart
final colors = Theme.of(context).colorScheme;
final textStyles = Theme.of(context).textTheme;
```

3. Use theme extensions:
```dart
final padding = context.insets.large;
final borderRadius = context.corners.small;
```
