# Core Directory Documentation

## Overview

The `core` directory serves as the foundation of the Flutter application, containing essential components, utilities, and configurations that are used throughout the project. This directory is structured to promote code reusability, maintainability, and scalability.

## Directory Structure

### 🎨 Theme
The `theme` directory manages the application's visual styling and design system:
- Color schemes
- Typography
- Spacing and sizing constants
- Theme configurations

### 🧩 Components
Reusable UI components that maintain consistency across the application.

### 🔧 Extensions
Custom Dart extensions that enhance the functionality of built-in classes and provide convenient utilities:
- `theme_sizes.dart`: Size-related extensions
- `theme_insets.dart`: Padding and margin extensions
- `theme_corners.dart`: Border radius extensions

### 📱 Responsive
Utilities and widgets for creating responsive layouts that adapt to different screen sizes.

### 🔄 Network
Network-related configurations and API service implementations.

### 🚦 Navigation
Navigation management and routing configurations.

### ⚙️ Utils
General utility functions and helper methods.

### 🎯 Constants
Application-wide constants and configuration values.

### 🛠 Services
Core services for features like authentication, storage, and state management.

## Getting Started

To use components and utilities from the core directory, first import the relevant files:

```dart
import 'package:my_app/core/theme/app_theme.dart';
import 'package:my_app/core/extensions/theme_extensions.dart';
import 'package:my_app/core/components/components.dart';
```

## Best Practices

1. **Theme Usage**
   - Always use theme constants instead of hard-coded values
   - Access colors through the theme: `Theme.of(context).colorScheme`
   - Use predefined text styles from the theme

2. **Responsive Design**
   - Utilize responsive utilities for adaptive layouts
   - Test layouts on different screen sizes
   - Use relative units instead of fixed pixels

3. **Component Development**
   - Keep components single-responsibility
   - Document component APIs
   - Include usage examples in comments

4. **Extension Usage**
   - Use extensions to simplify common operations
   - Keep extensions focused and well-documented
   - Avoid complex logic in extensions

## Documentation Structure

Each subdirectory contains its own README.md with:
- Detailed explanation of the directory's purpose
- File descriptions and usage examples
- Best practices specific to that module
- Code snippets demonstrating common use cases

## Contributing

When adding new functionality to the core directory:
1. Follow the established directory structure
2. Add appropriate documentation
3. Include usage examples
4. Update this README if necessary
