import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sstrip/src/authentication/bloc/authentication_bloc.dart';
import 'package:sstrip/src/core/params/register_body_params.dart';
import 'package:sstrip/src/module/injector.dart';
import 'package:sstrip/src/presentation/app/widgets/app_language_popup_button.dart';
import 'package:sstrip/src/routes/routes.dart';

import '../../components/app_snackbar.dart';
import '../../core/params/user_request_body.dart';
import '../../domain/entities/auth_register.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import 'authentication_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBodyParams registerBodyParams = RegisterBodyParams();
  final ValueNotifier<String> confirmPassword = ValueNotifier('');
  final ValueNotifier<String> password = ValueNotifier('');

  // Controllers và FocusNodes để tránh keyboard flicker
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    confirmPassword.dispose();
    password.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocProvider.value(
      value: getIt<AuthenticationBloc>(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: colorScheme.onSurface,
              ),
            ),
            onPressed: () => context.pop(),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Center(child: AppLanguagePopupButton()),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header
                    AuthHeader(
                      title: context.l10n.createAccount,
                      subtitle: context.l10n.registerToStartManagingStore,
                      icon: Icons.person_add_rounded,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      controller: _nameController,
                      label: context.l10n.userName,
                      hint: context.l10n.enterName,
                      icon: Icons.person_outline,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        registerBodyParams = registerBodyParams.copyWith(
                          name: val,
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Email field
                    AuthTextField(
                      controller: _emailController,
                      label: context.l10n.email,
                      hint: context.l10n.enterEmail,
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        registerBodyParams = registerBodyParams.copyWith(
                          email: val,
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
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        password.value = val;
                        registerBodyParams = registerBodyParams.copyWith(
                          password: val,
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Confirm password field
                    AuthTextField(
                      controller: _confirmPasswordController,
                      label: context.l10n.confirmPassword,
                      hint: context.l10n.enterConfirmPassword,
                      icon: Icons.lock_outline,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onChanged: (val) {
                        confirmPassword.value = val;
                      },
                    ),

                    const SizedBox(height: 8),

                    // Password match indicator
                    ValueListenableBuilder<String>(
                      valueListenable: confirmPassword,
                      builder: (context, confirm, _) {
                        return ValueListenableBuilder<String>(
                          valueListenable: password,
                          builder: (context, pass, _) {
                            if (confirm.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            final isMatch =
                                confirm == pass && confirm.isNotEmpty;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Icon(
                                    isMatch
                                        ? Icons.check_circle_rounded
                                        : Icons.cancel_rounded,
                                    size: 16,
                                    color: isMatch
                                        ? colorScheme.primary
                                        : colorScheme.error,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    isMatch
                                        ? context.l10n.passwordsMatch
                                        : context.l10n.passwordsDoNotMatch,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: isMatch
                                          ? colorScheme.primary
                                          : colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Register button
                    BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        if (state.status == AuthenticationStatus.failure) {
                          AppSnackBar.showError(
                            context,
                            message: context.l10n.registerFailed,
                          );
                        }
                        if (state.status ==
                            AuthenticationStatus.registerSuccess) {
                          final AuthenRegister? data = state.data;
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
                          context.replace(Routes.home);
                        }
                      },
                      builder: (context, state) {
                        final isLoading =
                            state.status == AuthenticationStatus.loading;
                        return ValueListenableBuilder<String>(
                          valueListenable: confirmPassword,
                          builder: (context, confirm, _) {
                            return ValueListenableBuilder<String>(
                              valueListenable: password,
                              builder: (context, pass, _) {
                                final isMatch =
                                    confirm == pass && confirm.isNotEmpty;
                                return AuthPrimaryButton(
                                  label: context.l10n.register,
                                  isLoading: isLoading,
                                  isEnabled: isMatch,
                                  onPressed: () {
                                    BlocProvider.of<AuthenticationBloc>(
                                      context,
                                    ).add(Register(registerBodyParams));
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Login link
                    AuthTextButton(
                      label: context.l10n.alreadyHaveAccountLogin,
                      onPressed: () => context.pop(),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
