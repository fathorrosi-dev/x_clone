import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// A class that provides responsive values based on screen size.
///
/// This class helps in defining different values for different screen sizes
/// and automatically selecting the appropriate value based on the current
/// screen width.
class ResponsiveValue<T> {
  /// Creates a [ResponsiveValue] with values for different screen sizes.
  ///
  /// All parameters are required:
  /// * [mobile]: Value for mobile screens
  /// * [tablet]: Value for tablet screens
  /// * [desktop]: Value for desktop screens
  const ResponsiveValue({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  /// The value to use on mobile screens
  final T mobile;

  /// The value to use on tablet screens
  final T tablet;

  /// The value to use on desktop screens
  final T desktop;

  /// Gets the appropriate value based on the current screen size.
  ///
  /// Uses [ResponsiveBreakpoints] to determine the current screen size
  /// and returns the corresponding value.
  T getValue(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).largerThan(TABLET)) {
      return desktop;
    } else if (ResponsiveBreakpoints.of(context).largerThan(MOBILE)) {
      return tablet;
    }
    return mobile;
  }
}
