import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthEvent.emailAndPasswordSignIn(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
              ),
            );
          },
          authenticated: (_) {
            context.go('/navbar');
          },
          orElse: () {},
        );
      },
      child: ResponsiveScaffold(
        title: "Login Page",
        body: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.lock_open_rounded, size: 77),
                      SizedBox(height: context.space56),
                      Text(
                        'Welcome back, you\'ve been missed!',
                        style: context.responsiveTextTheme.titleMedium!
                            .copyWith(
                              color: context.colorScheme.secondaryTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      SizedBox(height: context.space24),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: "Email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: context.space16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // TODO: Implement forgot password functionality
                          },
                          child: Text(
                            'Forgot Password?',
                            style: context.responsiveTextTheme.titleMedium!
                                .copyWith(
                                  color: context.colorScheme.secondaryTextColor,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.space24),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return SizedBox(
                            width: context.responsiveWidth(100),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.colorScheme.primary,
                                foregroundColor: context.colorScheme.onPrimary,
                                fixedSize: const Size.fromHeight(60),
                              ),
                              onPressed: state is Loading ? null : _handleLogin,
                              child: state is Loading
                                  ? LoadingAnimationWidget.staggeredDotsWave(
                                      color: context.colorScheme.primary,
                                      size: 24,
                                    )
                                  : const Text('Login'),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: context.space16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: context.responsiveTextTheme.titleSmall!
                                .copyWith(
                                  color: context.colorScheme.secondaryTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/register'),
                            child: Text(
                              'Register',
                              style: context.responsiveTextTheme.titleSmall!
                                  .copyWith(
                                    color: context.colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
