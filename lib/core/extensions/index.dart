/// Core extensions library
/// Provides extension methods for common Flutter classes
library;

export 'context_extensions.dart';
export 'responsive_extensions.dart';
export 'theme_extensions.dart';
export 'theme_insets.dart';
export 'theme_sizes.dart';
export 'theme_corners.dart';
export 'responsive_text.dart';
export 'color_extensions.dart';

/// Extensions Documentation:
///
/// 1. Context Extensions (`context_extensions.dart`)
/// - Convenient access to Theme, MediaQuery, and Navigator
/// ```dart
/// // Instead of MediaQuery.of(context).size
/// context.screenSize
///
/// // Instead of Theme.of(context).colorScheme
/// context.colors
/// ```
///
/// 2. Responsive Extensions (`responsive_extensions.dart`)
/// - Screen size-aware utilities
/// ```dart
/// // Responsive padding
/// padding: context.responsivePadding
///
/// // Responsive spacing
/// SizedBox(height: context.spacing.medium)
/// ```
///
/// 3. Theme Extensions (`theme_extensions.dart`)
/// - Custom theme accessors
/// ```dart
/// // Access custom theme properties
/// context.customColors.surface
/// context.typography.heading1
/// ```
///
/// 4. Theme Insets (`theme_insets.dart`)
/// - Standardized spacing and insets
/// ```dart
/// // Standard edge insets
/// padding: context.insets.standard
///
/// // Content padding
/// padding: context.insets.content
/// ```
