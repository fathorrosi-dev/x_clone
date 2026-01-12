/// Core library
/// The central export point for all core functionality in the application.
/// This file provides a well-organized, modular approach to accessing core features.
library;

//=======================
// FEATURE MODULES
//=======================

/// UI Components and Layouts
/// Provides reusable widgets, responsive layouts, and core UI building blocks
export 'components/index.dart';

/// Application Services
/// Handles API integration, storage, and other service-layer functionality
export 'services/index.dart';

/// Theme and Styling
/// Manages application-wide styling, colors, and typography
export 'theme/index.dart';

/// Navigation
/// Handles routing, transitions, and deep linking
export 'navigation/index.dart';

//=======================
// CORE UTILITIES
//=======================

/// Constants and Configuration
/// Application-wide constants, configuration, and feature flags
export 'constants/index.dart';

/// Extensions
/// Utility extensions for Flutter widgets and core functionality
export 'extensions/index.dart';

/// Utilities
/// Common utilities for logging, animations, and responsive design
export 'utils/index.dart';

/// Core Module Documentation
///
/// This library provides a comprehensive set of tools and utilities for building
/// robust Flutter applications. Here's a quick overview of each module:
///
/// 1. Feature Modules
///    - `components/`: Reusable UI components and layouts
///    - `services/`: Backend integration and local services
///    - `theme/`: Application styling and theming
///    - `navigation/`: Routing and navigation management
///
/// 2. Core Utilities
///    - `constants/`: Application-wide configuration
///    - `extensions/`: Convenience methods and utilities
///    - `utils/`: Helper functions and tools
///
/// Example Usage:
/// ```dart
/// import 'package:my_app/core/core.dart';
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       theme: AppTheme.light(),
///       darkTheme: AppTheme.dark(),
///       home: ResponsiveLayout(
///         mobile: MobileView(),
///         tablet: TabletView(),
///         desktop: DesktopView(),
///       ),
///     );
///   }
/// }
///
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     // Use extensions
///     final padding = context.responsivePadding;
///     final colors = context.colors;
///
///     // Use responsive utilities
///     if (context.isTablet) {
///       return TabletLayout();
///     }
///
///     return Container(
///       padding: padding,
///       color: colors.background,
///       child: YourContent(),
///     );
///   }
/// }
/// ```
///
/// Best Practices:
/// 1. Always import through core.dart for better maintainability
/// 2. Use the provided responsive utilities for adaptive layouts
/// 3. Leverage extensions for cleaner, more readable code
/// 4. Follow the established theming system for consistent styling
