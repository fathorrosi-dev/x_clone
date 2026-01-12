import 'package:flutter/material.dart';
import 'responsive_layout_manager.dart';
import 'responsive_widgets.dart';
import 'app_scaffold.dart';

class ResponsiveScaffold extends StatelessWidget {
  final String title;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;
  final Widget body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final bool centerTitle;
  final double? maxWidth;
  final EdgeInsets? padding;

  const ResponsiveScaffold({
    super.key,
    required this.title,
    required this.body,
    this.appBar,
    this.actions,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    this.centerTitle = true,
    this.maxWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, deviceType) {
        final isDesktop =
            deviceType == DeviceType.desktop ||
            deviceType == DeviceType.largeDesktop;
        final isTablet = deviceType == DeviceType.tablet;

        final showDrawerAsNavRail = (isDesktop || isTablet) && drawer != null;

        // Use ResponsiveContainer for the body
        Widget content = ResponsiveContainer(
          padding:
              padding ?? ResponsiveLayoutManager.getContentPadding(context),
          child: body,
        );

        // Convert drawer to navigation rail for larger screens
        if (showDrawerAsNavRail) {
          content = Row(
            children: [
              SizedBox(
                width: ResponsiveLayoutManager.getDrawerWidth(context),
                child: drawer!,
              ),
              Expanded(child: content),
              if (endDrawer != null)
                SizedBox(
                  width: ResponsiveLayoutManager.getDrawerWidth(context),
                  child: endDrawer!,
                ),
            ],
          );
        }

        // Use AppScaffold as the base
        return AppScaffold(
          appBar: appBar,
          body: content,
          drawer: showDrawerAsNavRail ? null : drawer,
          endDrawer: showDrawerAsNavRail ? null : endDrawer,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          backgroundColor: backgroundColor,
          maxWidth: maxWidth,
          padding: null, // Padding is handled by ResponsiveContainer
        );
      },
    );
  }
}

class ResponsiveListView extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const ResponsiveListView({
    super.key,
    required this.children,
    this.padding,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, deviceType) {
        final effectivePadding =
            padding ?? ResponsiveLayoutManager.getContentPadding(context);

        return ResponsiveContainer(
          child: ListView(
            controller: controller,
            shrinkWrap: shrinkWrap,
            physics: physics,
            padding: effectivePadding,
            children: children,
          ),
        );
      },
    );
  }
}

class ResponsiveCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;

  const ResponsiveCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.elevation,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, deviceType) {
        final effectivePadding =
            padding ??
            EdgeInsets.all(switch (deviceType) {
              DeviceType.mobile => 16.0,
              DeviceType.tablet => 20.0,
              DeviceType.desktop => 24.0,
              DeviceType.largeDesktop => 32.0,
            });

        return Card(
          color: color,
          elevation: elevation,
          shape: shape,
          child: Padding(padding: effectivePadding, child: child),
        );
      },
    );
  }
}
