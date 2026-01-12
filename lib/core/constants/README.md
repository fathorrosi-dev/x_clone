# Constants Directory Documentation

## Overview

The `constants` directory contains all application-wide constant values, organized into logical categories. These constants ensure consistency throughout the application and make maintenance easier by centralizing configuration values.

## Directory Structure

```
constants/
├── app_constants.dart
├── config/
│   └── env_config.dart
├── ui/
│   ├── animation_constants.dart
│   └── responsive_constants.dart
└── validation/
    └── validation_constants.dart
```

## Core Constants

### App Constants (`app_constants.dart`)

Central barrel file that exports all constants and defines application-wide values.

```dart
// Shared preferences keys
PreferenceKeys.themeMode         // Theme mode storage key
PreferenceKeys.useDynamicColors  // Dynamic colors preference
PreferenceKeys.currency          // Currency preference
PreferenceKeys.language          // Language preference
```

### UI Constants

#### Animation Constants (`ui/animation_constants.dart`)

Standard animation durations for consistent motion design.

```dart
// Duration constants
AnimationDurations.short   // 200ms - Quick animations
AnimationDurations.medium  // 350ms - Standard transitions
AnimationDurations.long    // 500ms - Elaborate animations

// Custom duration
final customDuration = AnimationDurations.custom(400);
```

#### Responsive Constants (`ui/responsive_constants.dart`)

Breakpoints and sizing constants for responsive layouts.

```dart
// Screen breakpoints
ResponsiveConstants.mobileBreakpoint   // Mobile max width
ResponsiveConstants.tabletBreakpoint   // Tablet max width
ResponsiveConstants.desktopBreakpoint  // Desktop min width
```

### Validation Constants (`validation/validation_constants.dart`)

Form validation rules and constraints.

```dart
// Input constraints
ValidationConstants.minDescriptionLength  // Minimum text length (3)
ValidationConstants.maxDescriptionLength  // Maximum text length (100)
ValidationConstants.maxAmount            // Maximum numeric value

// Validation patterns
ValidationConstants.emailPattern     // Email regex pattern
ValidationConstants.passwordPattern  // Password requirements
```

### Environment Config (`config/env_config.dart`)

Environment-specific configuration constants.

## Usage Guidelines

### 1. Accessing Constants

Always use the constant classes directly:

```dart
// Good
if (text.length > ValidationConstants.maxDescriptionLength) {
  // Handle error
}

// Bad
if (text.length > 100) {  // Magic number
  // Handle error
}
```

### 2. Animation Usage

Use predefined durations for consistent animations:

```dart
AnimatedContainer(
  duration: AnimationDurations.medium,  // Standard transition
  child: YourWidget(),
);
```

### 3. Form Validation

Implement form validation using validation constants:

```dart
TextFormField(
  validator: (value) {
    if (value.length < ValidationConstants.minDescriptionLength) {
      return 'Description too short';
    }
    return null;
  },
);
```

### 4. Responsive Design

Apply responsive constants for layout decisions:

```dart
Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= ResponsiveConstants.desktopBreakpoint) {
    return DesktopLayout();
  }
  return MobileLayout();
}
```

## Best Practices

1. **Constant Naming**
   - Use clear, descriptive names
   - Follow naming conventions
   - Group related constants together

2. **Value Organization**
   - Keep constants organized by category
   - Use appropriate data types
   - Document units where applicable

3. **Maintenance**
   - Regularly review and update values
   - Document changes in comments
   - Consider backwards compatibility

4. **Type Safety**
   - Use strong typing for constants
   - Avoid magic numbers/strings
   - Provide type documentation

## Contributing

When adding new constants:

1. **Location**
   - Place in appropriate category
   - Create new categories if needed
   - Update barrel file exports

2. **Documentation**
   - Add clear descriptions
   - Include usage examples
   - Document units and ranges

3. **Validation**
   - Verify values are correct
   - Test in different contexts
   - Consider edge cases

4. **Integration**
   - Update related constants
   - Check for conflicts
   - Test affected features

## Example Implementation

```dart
// Adding a new validation constant
class ValidationConstants {
  /// Maximum length for titles (existing)
  static const maxTitleLength = 50;

  /// New constant for minimum title length
  /// Must be at least 3 characters to ensure meaningful content
  static const minTitleLength = 3;
}

// Using constants in code
TextField(
  maxLength: ValidationConstants.maxTitleLength,
  validator: (value) {
    if (value.length < ValidationConstants.minTitleLength) {
      return 'Title must be at least ${ValidationConstants.minTitleLength} characters';
    }
    return null;
  },
);
```
