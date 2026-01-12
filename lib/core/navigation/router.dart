/// Application routing configuration using go_router
///
/// This file defines all the routes and navigation logic for the application.
/// It uses go_router for declarative routing with the following features:
/// - Type-safe route parameters
/// - Deep linking support
/// - Nested navigation
/// - Path and query parameters
///
/// Routes are organized in a hierarchical structure that matches the app's
/// navigation flow and information architecture.
library;

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/core/components/navbar.dart';
import 'package:x_clone/core/dependency_injection.dart';
import 'package:x_clone/ui/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/ui/login/login_page.dart';
import 'package:x_clone/ui/profile/profile_page.dart';
import 'package:x_clone/ui/register/register_page.dart';
import 'package:x_clone/ui/splash/splash_page.dart';
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/ui/tweet/add_tweet_page.dart';

/// Global router configuration
final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (BuildContext context, GoRouterState state) {
    final authBloc = context.read<AuthBloc>();
    final authState = authBloc.state;
    final isAuthenticated = authState is Authenticated;
    final isAuthenticating = authState is Loading;
    final isSplashPage = state.matchedLocation == '/';
    final isLoginPage = state.matchedLocation == '/login';
    final isRegisterPage = state.matchedLocation == '/register';

    if (isAuthenticating) return null;

    if (isAuthenticated && (isSplashPage || isLoginPage || isRegisterPage)) {
      return '/navbar';
    }

    if (!isAuthenticated && !isLoginPage && !isRegisterPage) return '/';

    return null;
  },
  refreshListenable: GoRouterRefreshStream(getIt<AuthBloc>().stream),
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(path: '/navbar', builder: (context, state) => const Navbar()),
    GoRoute(
      path: '/add-tweet',
      builder: (context, state) => const AddTweetPage(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);

final rootNavigatorKey = GlobalKey<NavigatorState>();

/// Custom RefreshListenable that listens to a Stream
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// Page shown when a route is not found
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The requested page was not found.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
