import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

/// A utility class that provides platform-adaptive widgets
class AdaptiveWidgets {
  static bool get isIOS => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isWeb =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  /// Returns a platform-adaptive progress indicator
  static Widget progressIndicator({Color? color}) {
    return isIOS
        ? CupertinoActivityIndicator(color: color)
        : CircularProgressIndicator(color: color);
  }

  /// Returns a platform-adaptive button
  static Widget button({
    required String text,
    required VoidCallback onPressed,
    bool isPrimary = true,
    bool isDestructive = false,
    Widget? icon,
  }) {
    if (isIOS) {
      return CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: isDestructive
            ? CupertinoColors.destructiveRed
            : (isPrimary ? null : CupertinoColors.systemGrey5),
        onPressed: onPressed,
        child: Text(text),
      );
    }

    return icon != null
        ? FilledButton.icon(
            onPressed: onPressed,
            icon: icon,
            label: Text(text),
            style: isDestructive
                ? FilledButton.styleFrom(backgroundColor: Colors.red)
                : null,
          )
        : FilledButton(
            onPressed: onPressed,
            style: isDestructive
                ? FilledButton.styleFrom(backgroundColor: Colors.red)
                : null,
            child: Text(text),
          );
  }

  /// Returns a platform-adaptive dialog
  static Future<T?> showAdaptiveDialog<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? cancelText,
    String? confirmText,
    bool barrierDismissible = true,
  }) {
    if (isIOS) {
      return showCupertinoDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            if (cancelText != null)
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelText),
              ),
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(confirmText ?? 'OK'),
            ),
          ],
        ),
      );
    }

    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelText),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText ?? 'OK'),
          ),
        ],
      ),
    );
  }

  /// Returns a platform-adaptive text field
  static Widget textField({
    required TextEditingController controller,
    String? placeholder,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    if (isIOS) {
      return CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        padding: const EdgeInsets.all(12),
      );
    }

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
