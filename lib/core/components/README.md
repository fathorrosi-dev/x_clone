# Components Directory Documentation

## Overview

The `components` directory contains reusable Flutter widgets and base components that form the foundation of the application's UI. These components are designed to be responsive, platform-adaptive, and follow Material Design 3 guidelines.

## Directory Structure

```
components/
├── adaptive_widgets.dart
├── app_scaffold.dart
├── app_scroll_behavior.dart
├── base_component.dart
├── responsive_layout.dart
├── responsive_layout_manager.dart
├── responsive_scaffold.dart
└── responsive_widgets.dart
```

## Core Components

### 1. Base Component (`base_component.dart`)

Abstract base class for all app components providing common functionality.

```dart
class MyComponent extends BaseComponent {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: getContentConstraints(context),
      padding: getContentPadding(context),
      child: YourContent(),
    );
  }
}
```

Key Features:
- Responsive width management
- Standard padding calculations
- Screen size adaptations

### 2. Scaffolds

#### App Scaffold (`app_scaffold.dart`)

Base scaffold implementation with Material 3 theming.

```dart
AppScaffold(
  body: YourContent(),
  maxWidth: 1200,
  padding: EdgeInsets.all(16),
  backgroundColor: Colors.white,
)
```

#### Responsive Scaffold (`responsive_scaffold.dart`)

Enhanced scaffold with responsive behavior.

```dart
ResponsiveScaffold(
  title: 'My App',
  body: YourContent(),
  drawer: MyDrawer(),  // Converts to navigation rail on desktop
  actions: [ActionButtons()],
)
```

### 3. Adaptive Widgets (`adaptive_widgets.dart`)

Platform-specific widget implementations.

```dart
// Automatically uses correct platform style
AdaptiveWidgets.button(
  text: 'Click Me',
  onPressed: () => handlePress(),
  isPrimary: true,
);

AdaptiveWidgets.progressIndicator(
  color: Colors.blue,
);
```

### 4. Responsive Components

#### Responsive Layout (`responsive_layout.dart`)

Layout component that adapts to screen size.

```dart
ResponsiveLayout(
  mobile: MobileView(),
  tablet: TabletView(),
  desktop: DesktopView(),
);
```

#### Responsive Widgets (`responsive_widgets.dart`)

Collection of responsive widget implementations.

```dart
ResponsiveContainer(
  maxWidth: 1200,
  padding: EdgeInsets.all(16),
  child: YourContent(),
);

ResponsiveGrid(
  columns: context.responsive(
    mobile: 1,
    tablet: 2,
    desktop: 4,
  ),
  children: [...],
);
```

## Usage Guidelines

### 1. Component Selection

Choose the appropriate component based on needs:

```dart
// For basic pages with standard layout
AppScaffold(...)

// For pages needing responsive behavior
ResponsiveScaffold(...)

// For platform-specific widgets
AdaptiveWidgets.button(...)
```

### 2. Responsive Implementation

Implement responsive layouts properly:

```dart
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      body: ResponsiveLayout(
        mobile: MobileLayout(),
        tablet: TabletLayout(),
        desktop: DesktopLayout(),
      ),
    );
  }
}
```

### 3. Base Component Extension

Extend BaseComponent for new reusable widgets:

```dart
class CustomCard extends BaseComponent {
  final Widget child;
  
  const CustomCard({required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: getContentConstraints(context),
      padding: getContentPadding(context),
      child: Card(child: child),
    );
  }
}
```

## Best Practices

1. **Component Hierarchy**
   - Extend BaseComponent for new components
   - Use ResponsiveScaffold for main pages
   - Implement AdaptiveWidgets for platform-specific UI

2. **Responsive Design**
   - Always consider different screen sizes
   - Use responsive breakpoints consistently
   - Test layouts on various devices

3. **Platform Adaptation**
   - Use AdaptiveWidgets for platform-specific components
   - Consider platform conventions
   - Test on multiple platforms

4. **Performance**
   - Minimize rebuilds
   - Use const constructors
   - Implement efficient layouts

## Integration Examples

### 1. Complete Page Layout

```dart
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: 'My Page',
      body: ResponsiveContainer(
        child: ResponsiveGrid(
          columns: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 3,
          ),
          children: [
            AdaptiveWidgets.card(
              child: YourContent(),
            ),
            // More grid items...
          ],
        ),
      ),
    );
  }
}
```

### 2. Custom Component

```dart
class ResponsiveCard extends BaseComponent {
  final Widget child;
  final double? maxWidth;

  const ResponsiveCard({
    required this.child,
    this.maxWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? getMaxWidth(context),
      ),
      padding: getContentPadding(context),
      child: Card(
        child: child,
      ),
    );
  }
}
```

## Contributing

When adding new components:

1. **Component Design**
   - Follow Material Design 3 guidelines
   - Ensure responsive behavior
   - Consider platform differences

2. **Documentation**
   - Document all public APIs
   - Include usage examples
   - Explain responsive behavior

3. **Testing**
   - Test on different screen sizes
   - Verify platform adaptations
   - Check performance impact
