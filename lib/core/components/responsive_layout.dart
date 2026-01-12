import 'package:flutter/material.dart';
import 'package:x_clone/core/extensions/responsive_extensions.dart';
import '../utils/responsive_utils.dart';

/// A widget that provides different layouts based on screen size
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final bool maintainBottomViewPadding;
  final bool respectDeviceOrientation;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.maintainBottomViewPadding = true,
    this.respectDeviceOrientation = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Consider both width and orientation if enabled
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final isLandscape =
            screenWidth > screenHeight && respectDeviceOrientation;

        // Determine the effective width considering orientation
        final effectiveWidth = isLandscape ? screenHeight : screenWidth;

        Widget child;

        if (effectiveWidth >= ResponsiveBreakpoints.desktop &&
            desktop != null) {
          child = desktop!;
        } else if (effectiveWidth >= ResponsiveBreakpoints.tablet &&
            tablet != null) {
          child = tablet!;
        } else {
          child = mobile;
        }

        return SafeArea(
          maintainBottomViewPadding: maintainBottomViewPadding,
          child: child,
        );
      },
    );
  }
}

/// A widget that constrains its child's width based on screen size
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool centerContent;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.centerContent = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding ?? context.responsivePadding,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}

/// A widget that provides a responsive grid layout
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final double minChildWidth;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing = 16,
    this.runSpacing = 16,
    this.minChildWidth = 300,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = (width / minChildWidth).floor();

        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          alignment: WrapAlignment.start,
          children: children.map((child) {
            final childWidth =
                (width - (spacing * (crossAxisCount - 1))) / crossAxisCount;
            return SizedBox(width: childWidth, child: child);
          }).toList(),
        );
      },
    );
  }
}
