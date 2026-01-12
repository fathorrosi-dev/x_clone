/// Core components library
/// Contains reusable widgets and UI components used throughout the application
library;

export 'app_scaffold.dart';
export 'app_scroll_behavior.dart';
export 'responsive_layout.dart';
export 'responsive_layout_manager.dart';
export 'responsive_scaffold.dart';

// Documentation for major components:

/// [AppScaffold] - A customized scaffold that provides consistent app structure
/// Usage:
/// ```dart
/// AppScaffold(
///   title: 'Home',
///   body: YourWidget(),
/// )
/// ```

/// [ResponsiveLayout] - A widget that adapts to different screen sizes
/// Usage:
/// ```dart
/// ResponsiveLayout(
///   mobile: MobileLayout(),
///   tablet: TabletLayout(),
///   desktop: DesktopLayout(),
/// )
/// ```
