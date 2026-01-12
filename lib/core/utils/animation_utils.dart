import 'package:flutter/material.dart';

/// Utility class for common animations used across the app
class AnimationUtils {
  const AnimationUtils._();

  /// Standard durations for animations
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  /// Standard curves for animations
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve emphasizedCurve = Curves.easeOutCubic;
  static const Curve bouncyCurve = Curves.elasticOut;

  /// Slide transition from direction
  static Widget slideTransition({
    required Widget child,
    required Animation<double> animation,
    AxisDirection direction = AxisDirection.right,
  }) {
    Offset startOffset;
    switch (direction) {
      case AxisDirection.up:
        startOffset = const Offset(0, 1);
      case AxisDirection.right:
        startOffset = const Offset(-1, 0);
      case AxisDirection.down:
        startOffset = const Offset(0, -1);
      case AxisDirection.left:
        startOffset = const Offset(1, 0);
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: startOffset,
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: defaultCurve)),
      child: child,
    );
  }

  /// Fade and scale transition
  static Widget fadeScaleTransition({
    required Widget child,
    required Animation<double> animation,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: const Interval(0.0, 0.75, curve: defaultCurve),
      ),
      child: ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: bouncyCurve),
        child: child,
      ),
    );
  }

  /// Stagger animation builder
  static Widget staggeredList({
    required List<Widget> children,
    required Animation<double> animation,
    Axis direction = Axis.vertical,
    double spacing = 16.0,
  }) {
    // Calculate the duration for each item to ensure total animation stays within 0.0-1.0
    const itemDuration = 0.4;
    final staggerDuration = (1.0 - itemDuration) / (children.length);

    final items = List.generate(children.length, (index) {
      final child = AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          final double start = index * staggerDuration;
          final double end = start + itemDuration;

          final double animationValue = Interval(
            start,
            end.clamp(0.0, 1.0),
            curve: defaultCurve,
          ).transform(animation.value);

          return Transform.translate(
            offset: direction == Axis.vertical
                ? Offset(0, 32 * (1 - animationValue))
                : Offset(32 * (1 - animationValue), 0),
            child: Opacity(opacity: animationValue, child: children[index]),
          );
        },
      );

      if (index == children.length - 1) return child;

      return Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            SizedBox(
              width: direction == Axis.horizontal ? spacing : 0,
              height: direction == Axis.vertical ? spacing : 0,
            ),
          ],
        ),
      );
    });

    return direction == Axis.vertical
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items,
          );
  }
}
