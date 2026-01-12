/// A reusable drawer component that provides navigation across the app
///
/// This drawer follows Material 3 design guidelines and provides:
/// - Consistent styling with the app's theme
/// - Responsive width handling
/// - Accessibility support
/// - Clear visual hierarchy
library;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/core/core.dart';

/// App drawer component that provides primary navigation
class AppDrawer extends StatelessWidget {
  /// Creates an app drawer
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.go('/login');
        }
      },
      child: Drawer(
        width: context.navigationDrawerWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer header with app branding
            SizedBox(
              width: context.navigationDrawerWidth,
              child: _buildHeader(context),
            ),

            // Navigation items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildNavItem(
                    context: context,
                    icon: Icons.person_rounded,
                    label: 'Profile',
                    route: '/profile',
                  ),
                  _buildNavItem(
                    context: context,
                    icon: Icons.bookmark_rounded,
                    label: 'Bookmark',
                    route: '/bookmark',
                  ),
                  Padding(
                    padding: context.listTileInsets,
                    child: const Divider(),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      color: context.colorScheme.onSurface,
                    ),
                    title: Text(
                      'Logout',
                      style: context.textTheme.titleMedium
                          ?.responsive(context)
                          .copyWith(color: context.colorScheme.onSurface),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content: const Text(
                            'Are you sure you want to logout?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => context.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                context.pop(context);
                                context.read<AuthBloc>().add(
                                  const AuthEvent.signedOut(),
                                );
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  _buildNavItem(
                    context: context,
                    icon: Icons.settings_rounded,
                    label: 'Settings',
                    route: '/settings', // Disable if route not implemented
                  ),
                ],
              ),
            ),

            // Bottom section for user-related actions
            _buildBottomSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return DrawerHeader(
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Avatar
              CircleAvatar(
                radius: 30,
                backgroundColor: context.colorScheme.primary,
                child: Text(
                  state is Authenticated
                      ? (state.user.displayName?[0].toUpperCase() ??
                            state.user.email[0].toUpperCase())
                      : '?',
                  style: context.responsiveTextTheme.headlineMedium?.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // User Name
              if (state is Authenticated && state.user.displayName != null)
                Text(
                  state.user.displayName!,
                  style: context.responsiveTextTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

              // User Email
              if (state is Authenticated)
                Text(
                  state.user.email,
                  style: context.responsiveTextTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon, color: context.colorScheme.onSurface),
      title: Text(
        label,
        style: context.textTheme.titleMedium
            ?.responsive(context)
            .copyWith(color: context.colorScheme.onSurface),
      ),
      onTap: () => _onNavItemTap(context, route),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Container(
      padding: context.listTileInsets,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () => _showThemeBottomSheet(context, state.themeMode),
            icon: Icon(
              state.themeMode == ThemeMode.system
                  ? Icons.brightness_auto
                  : state.themeMode == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
              size: context.responsive(
                mobile: 24.0,
                tablet: 28.0,
                desktop: 32.0,
              ),
              color: context.colorScheme.primary,
            ),
          );
        },
      ),
    );
  }

  void _showThemeBottomSheet(BuildContext context, ThemeMode currentMode) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      constraints: BoxConstraints(maxWidth: context.maxModalWidth),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.listTileInsets,
              child: Text(
                'Dark Theme',
                style: context.textTheme.titleLarge?.responsive(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.space16),
              child: Divider(thickness: 1, color: context.colorScheme.outline),
            ),
            _buildThemeOption(
              context: context,
              label: 'Enabled',
              mode: ThemeMode.dark,
              currentMode: currentMode,
            ),
            _buildThemeOption(
              context: context,
              label: 'Disabled',
              mode: ThemeMode.light,
              currentMode: currentMode,
            ),
            _buildThemeOption(
              context: context,
              label: 'Use device settings',
              mode: ThemeMode.system,
              currentMode: currentMode,
            ),
            SizedBox(height: context.space16),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required String label,
    required ThemeMode mode,
    required ThemeMode currentMode,
  }) {
    final theme = Theme.of(context);

    return RadioGroup<ThemeMode>(
      groupValue: currentMode,
      onChanged: (ThemeMode? value) {
        if (value == null) return;

        context.read<ThemeCubit>().setThemeMode(value);
        context.pop();
      },
      child: RadioListTile<ThemeMode>(
        value: mode,
        title: Text(
          label,
          style: theme.textTheme.titleMedium
              ?.responsive(context)
              .copyWith(color: theme.colorScheme.onSurface),
        ),
        activeColor: theme.colorScheme.primary,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }

  void _onNavItemTap(BuildContext context, String route) {
    // Close drawer before navigation
    context.pop();
    // Navigate to the selected route
    context.push(route);
  }
}
