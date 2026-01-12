/// Navigation library
/// Provides routing and navigation utilities
library;

export 'router.dart';
export 'page_transitions.dart';

/// Navigation Components:
///
/// 1. Router (`router.dart`)
/// - App route definitions
/// - Navigation helpers
/// ```dart
/// // Define routes
/// @MaterialAutoRouter(
///   routes: [
///     AutoRoute(page: HomePage, initial: true),
///     AutoRoute(page: SettingsPage),
///   ],
/// )
///
/// // Navigate using type-safe routes
/// context.router.push(const HomeRoute());
/// ```
///
/// 2. Page Transitions (`page_transitions.dart`)
/// - Custom transition animations
/// - Platform-specific transitions
/// ```dart
/// // Custom page transition
/// PageRouteBuilder(
///   pageBuilder: (context, animation, secondaryAnimation) => YourPage(),
///   transitionsBuilder: fadeTransition,
/// )
///
/// // Platform-aware transition
/// platformPageTransition(
///   context: context,
///   child: YourPage(),
/// )
/// ```
///
/// Best Practices:
/// - Always use typed routes instead of string-based navigation
/// - Consider platform-specific transitions for better UX
/// - Use nested navigation when appropriate
/// - Handle deep links properly
