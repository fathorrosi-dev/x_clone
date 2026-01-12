import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/core/core.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go('/navbar');
        } else if (state is Unauthenticated) {
          context.go('/login');
        } else if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
        // state.maybeMap(
        //   authenticated: (_) => context.go('/home'),
        //   unauthenticated: (_) => context.go('/login'),
        //   orElse: () {},
        // );
      },
      child: ResponsiveScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flutter_dash_rounded,
                size: 100,
                color: context.colorScheme.primary,
              ),
              SizedBox(height: context.space24),
              LoadingAnimationWidget.staggeredDotsWave(
                color: context.colorScheme.primary,
                size: 24,
              ),
            ],
          ),
        ),
        title: 'Splash',
      ),
    );
  }
}
