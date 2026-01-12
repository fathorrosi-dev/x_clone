import 'package:flutter/material.dart';

/// A service that manages navigation state and provides a global navigator key.
///
/// This service enables navigation from anywhere in the app without requiring
/// a BuildContext. It maintains a global navigator key that can be used
/// throughout the application.
class NavigationService {
  const NavigationService._();

  /// Global navigator key for the application.
  ///
  /// This key can be used to perform navigation operations from anywhere
  /// in the application without requiring a BuildContext.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
