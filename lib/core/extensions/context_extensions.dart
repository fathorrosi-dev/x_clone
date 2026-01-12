/// Extension methods for BuildContext
library;

import 'package:flutter/material.dart';

/// Extensions on BuildContext for easy access to common properties and methods
extension BuildContextExtensions on BuildContext {
  /// Get the current theme
  ThemeData get theme => Theme.of(this);

  /// Get the current color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the current text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get MediaQuery data
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get screen size
  Size get screenSize => mediaQuery.size;

  /// Check if the screen is in landscape orientation
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Check if the device is a tablet (screen width >= 600dp)
  bool get isTablet => screenSize.shortestSide >= 600;

  /// Show a snackbar with the given message
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colorScheme.error : null,
      ),
    );
  }

  /// Show a modal bottom sheet
  Future<T?> showAppBottomSheet<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      builder: (_) => child,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  /// Show a loading dialog
  Future<void> showLoadingDialog({String? message}) {
    return showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            if (message != null) ...[
              const SizedBox(width: 16),
              Expanded(child: Text(message)),
            ],
          ],
        ),
      ),
    );
  }
}
