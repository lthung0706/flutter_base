import 'dart:io';

import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:report_person/src/authentication/bloc/authentication_bloc.dart';
import 'package:report_person/src/core/firebase_analytics_helper.dart';
import 'package:report_person/src/core/firebase_performance_helper.dart';
import 'package:report_person/src/core/params/login_request_body.dart';
import 'package:report_person/src/module/injector.dart';
import 'package:report_person/src/routes/routes.dart';

import '../../core/params/user_request_body.dart';
import '../../presentation/app/widgets/app_language_popup_button.dart';
import '../auth.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import 'authentication_page.dart';
import '../../components/app_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginRequestBody loginRequestBody = LoginRequestBody();

  // Controllers and FocusNodes to avoid keyboard flicker
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId:
            '515037032433-g6qastv2583p0bpgmrtlfgua5og793p2.apps.googleusercontent.com', // Phải dùng Web Client ID để lấy idToken.
      );
      final account = await googleSignIn.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null || !context.mounted) return;
      BlocProvider.of<AuthenticationBloc>(context).add(
        GoogleLogin(
          GoogleLoginRequestBody(
            token: idToken,
            deviceId: AuthenticationPage.deviceId,
          ),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      debugPrint('Google Sign-In error: $e');
      AppSnackBar.showError(
        context,
        message: context.l10n.loginFailed,
      );
    }
  }

  Future<void> _handleAppleSignIn(BuildContext context) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final identityToken = credential.identityToken;
      if (identityToken == null || !context.mounted) return;
      BlocProvider.of<AuthenticationBloc>(context).add(
        AppleLogin(
          AppleLoginRequestBody(
            token: identityToken,
            deviceId: AuthenticationPage.deviceId,
          ),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      debugPrint('Apple Sign-In error: $e');
      AppSnackBar.showError(
        context,
        message: context.l10n.loginFailed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (isPop, result) async {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          SystemNavigator.pop(animated: true);
        });
      },
      canPop: true,
      child: BlocProvider(
        create: (context) => getIt<AuthenticationBloc>(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: AppLanguagePopupButton(),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        context.l10n.login,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 24),

                      // Email field
                      AuthTextField(
                        controller: _emailController,
                        label: context.l10n.email,
                        hint: context.l10n.enterEmail,
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (valueText) {
                          loginRequestBody = loginRequestBody.copyWith(
                            email: valueText,
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Password field
                      AuthTextField(
                        controller: _passwordController,
                        label: context.l10n.password,
                        hint: context.l10n.enterPassword,
                        icon: Icons.lock_outline,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          loginRequestBody = loginRequestBody.copyWith(
                            password: value,
                          );
                        },
                      ),

                      const SizedBox(height: 32),
                      BlocListener<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          if (state.status == AuthenticationStatus.failure) {
                            AppSnackBar.showError(
                              context,
                              message: context.l10n.loginFailed,
                            );
                          }
                          if (state.status ==
                              AuthenticationStatus.loginSocialSuccess) {
                            final AuthData? data = state.data;
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              UpdateInfoUser(
                                UserRequestBody(
                                  id: data?.user?.id,
                                  deviceId: AuthenticationPage.deviceId,
                                ),
                              ),
                            );
                          }
                        },
                        child: Builder(
                          builder: (innerContext) {
                            return Row(
                              spacing: 12,
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () =>
                                        _handleGoogleSignIn(innerContext),
                                    icon: const Icon(Icons.g_mobiledata),
                                    label: const Text('Google'),
                                  ),
                                ),
                                if (Platform.isIOS)
                                  Expanded(
                                    child: OutlinedButton.icon(
                                      onPressed: Platform.isIOS
                                          ? () =>
                                                _handleAppleSignIn(innerContext)
                                          : null,
                                      icon: const Icon(Icons.apple),
                                      label: const Text('Apple'),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Login button
                      BlocConsumer<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          if (state.status == AuthenticationStatus.failure) {
                            FirebasePerformanceHelper.stopTrace(
                              'login_process',
                            );
                            FirebaseAnalyticsHelper.logEvent(
                              name: 'login_failed',
                              parameters: {
                                'reason': state.data?.toString() ?? 'unknown',
                              },
                            );
                            AppSnackBar.showError(
                              context,
                              message: context.l10n.loginFailed,
                            );
                          }
                          if (state.status ==
                              AuthenticationStatus.loginSuccess) {
                            FirebasePerformanceHelper.stopTrace(
                              'login_process',
                            );
                            final AuthData? data = state.data;
                            FirebaseAnalyticsHelper.logEvent(
                              name: 'login_success',
                              parameters: {
                                'user_id': data?.user?.id ?? '',
                              },
                            );
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              UpdateInfoUser(
                                UserRequestBody(
                                  id: data?.user?.id,
                                  deviceId: AuthenticationPage.deviceId,
                                ),
                              ),
                            );
                          }
                          if (state.status ==
                              AuthenticationStatus.updateInfoUserSuccess) {
                            context.go(Routes.home);
                          }
                        },
                        builder: (context, state) {
                          final isLoading =
                              state.status == AuthenticationStatus.loading;
                          return AuthPrimaryButton(
                            label: context.l10n.login,
                            isLoading: isLoading,
                            onPressed: () {
                              FirebaseAnalyticsHelper.logEvent(
                                name: 'login_started',
                              );
                              FirebasePerformanceHelper.startTrace(
                                'login_process',
                              );

                              BlocProvider.of<AuthenticationBloc>(
                                context,
                              ).add(
                                Login(
                                  loginRequestBody.copyWith(
                                    deviceId: AuthenticationPage.deviceId,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Register link
                      AuthTextButton(
                        label: context.l10n.dontHaveAccountRegisterNow,
                        onPressed: () {
                          context.push(Routes.register);
                        },
                      ),

                      const SizedBox(height: 40),
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
