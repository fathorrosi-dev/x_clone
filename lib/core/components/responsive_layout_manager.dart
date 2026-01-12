import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop, largeDesktop }

class ResponsiveLayoutManager {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  static const double largeDesktopBreakpoint = 1800;

  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= largeDesktopBreakpoint) return DeviceType.largeDesktop;
    if (width >= desktopBreakpoint) return DeviceType.desktop;
    if (width >= tabletBreakpoint) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  static double getContentMaxWidth(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return double.infinity;
      case DeviceType.tablet:
        return 680;
      case DeviceType.desktop:
        return 920;
      case DeviceType.largeDesktop:
        return 1200;
    }
  }

  static EdgeInsets getContentPadding(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return const EdgeInsets.all(16);
      case DeviceType.tablet:
        return const EdgeInsets.all(24);
      case DeviceType.desktop:
        return const EdgeInsets.all(32);
      case DeviceType.largeDesktop:
        return const EdgeInsets.all(40);
    }
  }

  static double getDrawerWidth(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return MediaQuery.of(context).size.width * 0.85;
      case DeviceType.tablet:
        return 320;
      case DeviceType.desktop:
        return 280;
      case DeviceType.largeDesktop:
        return 320;
    }
  }

  static double getTextScaleFactor(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return 1.0;
      case DeviceType.tablet:
        return 1.1;
      case DeviceType.desktop:
        return 1.2;
      case DeviceType.largeDesktop:
        return 1.3;
    }
  }

  static TextStyle getResponsiveTextStyle(
    BuildContext context,
    TextStyle baseStyle,
  ) {
    final deviceType = getDeviceType(context);
    final scaleFactor = getTextScaleFactor(context);

    return baseStyle.copyWith(
      fontSize: (baseStyle.fontSize ?? 14) * scaleFactor,
      height: switch (deviceType) {
        DeviceType.mobile => 1.2,
        DeviceType.tablet => 1.3,
        DeviceType.desktop => 1.4,
        DeviceType.largeDesktop => 1.5,
      },
      letterSpacing: switch (deviceType) {
        DeviceType.mobile => 0.2,
        DeviceType.tablet => 0.3,
        DeviceType.desktop => 0.4,
        DeviceType.largeDesktop => 0.5,
      },
    );
  }
}
