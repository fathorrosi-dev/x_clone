import 'package:flutter/material.dart';
import '../utils/animation_utils.dart';

/// Custom page transitions for the app
class AppPageTransitions extends Page {
  final Widget child;

  const AppPageTransitions({required this.child, super.name, super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: AnimationUtils.normal,
      reverseTransitionDuration: AnimationUtils.normal,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimationUtils.fadeScaleTransition(
          animation: animation,
          child: child,
        );
      },
    );
  }
}
