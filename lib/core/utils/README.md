# Utils Directory Documentation

## Overview

The `utils` directory contains utility classes and functions that provide common functionality across the application. These utilities are organized into specific categories to maintain clean architecture and promote code reusability.

## Directory Structure

```
utils/
├── animation_utils.dart
├── breakpoints/
├── device/
├── dimensions/
│   └── screen_dimensions.dart
├── layout/
├── logger.dart
└── responsive_utils.dart
```

## Core Utilities

### 1. Responsive Utils (`responsive_utils.dart`)

Defines core breakpoints and constants for responsive design implementation:

```dart
class ResponsiveBreakpoints {
  // Core breakpoints
  static const double smallMobile = 320;
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double largeDesktop = 1440;

  // Maximum content widths
  static const double maxContentWidthSmallMobile = 300;
  static const double maxContentWidthMobile = 560;
  static const double maxContentWidthTablet = 840;
  static const double maxContentWidthDesktop = 1080;
  static const double maxContentWidthLargeDesktop = 1200;

  // Standard paddings
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
}
```

Used in conjunction with `responsive_extensions.dart` to provide a comprehensive responsive design system.

### 2. Screen Dimensions (`dimensions/screen_dimensions.dart`)

Provides Material 3 breakpoint utilities:

```dart
class ScreenDimensions {
  static bool isCompact(BuildContext context) => ...
  static bool isMedium(BuildContext context) => ...
  static bool isExpanded(BuildContext context) => ...
  static bool isWide(BuildContext context) => ...
}
```

### 3. Animation Utils (`animation_utils.dart`)

Provides standardized animation configurations and helper methods for consistent animations across the app.

```dart
// Standard durations
AnimationUtils.fast    // 200ms
AnimationUtils.normal  // 300ms
AnimationUtils.slow    // 500ms

// Predefined transitions
Widget slideTransition = AnimationUtils.slideTransition(
  child: YourWidget(),
  animation: animation,
  direction: AxisDirection.right,
);
```

### 4. Logger (`logger.dart`)

Custom logging utility for consistent debugging and error tracking.

```dart
Logger.debug('Debug message');
Logger.info('Info message');
Logger.error('Error message', error, stackTrace);
```

## Subdirectories

### 1. Breakpoints

Contains configuration and utilities for responsive breakpoints:
- Screen size breakpoints
- Content width constraints
- Device-specific adjustments

### 2. Device

Utilities for device-specific functionality:
- Platform detection
- Device capability checks
- Screen metrics

### 3. Dimensions

Screen and layout dimension utilities:
- Screen size calculations
- Safe area handling
- Dynamic sizing helpers

### 4. Layout

Layout-specific utilities:
- Padding calculations
- Margin helpers
- Grid system utilities

## Integration

### With Extensions

The utilities in this directory are designed to work seamlessly with the extensions in the `extensions` directory. For example:

1. `responsive_utils.dart` provides the core breakpoints used by `responsive_extensions.dart`
2. `screen_dimensions.dart` provides Material 3 breakpoint checks used in responsive layouts

### Best Practices

1. Keep utility classes focused and single-purpose
2. Use constants for configuration values
3. Implement pure functions where possible
4. Document usage with examples
5. Follow Material Design guidelines for breakpoints and spacing

## Usage Examples

### Responsive Layout

```dart
// In your widget
Widget build(BuildContext context) {
  return ResponsiveLayout(
    mobile: MobileLayout(),
    tablet: TabletLayout(),
    desktop: DesktopLayout(),
  );
}

// The layout will automatically use the appropriate breakpoints
// defined in ResponsiveBreakpoints
```

### Screen Dimensions

```dart
if (ScreenDimensions.isCompact(context)) {
  // Use compact layout
} else if (ScreenDimensions.isExpanded(context)) {
  // Use expanded layout
}
```

### Responsive Layout

```dart
Widget build(BuildContext context) {
  return Container(
    padding: context.responsive(
      mobile: EdgeInsets.all(16),
      tablet: EdgeInsets.all(24),
      desktop: EdgeInsets.all(32),
    ),
    child: YourWidget(),
  );
}
```

### Animated Widget

```dart
Widget build(BuildContext context) {
  return AnimatedContainer(
    duration: AnimationUtils.normal,
    curve: AnimationUtils.defaultCurve,
    padding: EdgeInsets.all(8),
    child: YourWidget(),
  );
}
```

### Device-Specific Logic

```dart
Widget build(BuildContext context) {
  if (context.isDesktop) {
    return DesktopLayout();
  }
  return MobileLayout();
}
```

## Contributing

When adding new utilities:
1. Follow the established directory structure
2. Document all public APIs
3. Include usage examples
4. Add appropriate tests
5. Consider cross-platform compatibility
