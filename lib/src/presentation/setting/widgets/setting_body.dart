import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/src/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_base/src/authentication/view/authentication_page.dart';
import 'package:flutter_base/src/module/injector.dart';
import 'package:flutter_base/src/presentation/app/widgets/app_settings_provider.dart';
import 'package:flutter_base/src/routes/routes.dart';

class SettingBody extends StatelessWidget {
  final VoidCallback onOpenBilling;

  const SettingBody({super.key, required this.onOpenBilling});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appSettings = AppSettingsProvider.of(context);
    final user = AuthenticationPage.user;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      children: [
        // User Profile Card
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.person, color: colorScheme.primary, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name?.isNotEmpty == true ? user.name! : 'Tài khoản',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.email?.isNotEmpty == true ? user.email! : 'Chưa có email',
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Billing / Subscription Section
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber.withValues(alpha: 0.15),
              child: const Icon(Icons.payments_outlined, color: Colors.amber),
            ),
            title: const Text(
              'Gói Dịch Vụ & Thanh Toán',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text('Quản lý In-App Purchase & gia hạn'),
            trailing: const Icon(Icons.chevron_right),
            onTap: onOpenBilling,
          ),
        ),
        const SizedBox(height: 20),

        // Preferences Section Header
        Text(
          context.l10n.appSettings,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.hintColor,
          ),
        ),
        const SizedBox(height: 10),

        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
          ),
          child: Column(
            children: [
              // Theme Mode Selector
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo.withValues(alpha: 0.15),
                  child: const Icon(Icons.dark_mode_outlined, color: Colors.indigo),
                ),
                title: Text(context.l10n.themeTitle),
                trailing: DropdownButton<String>(
                  value: appSettings.themeMode,
                  underline: const SizedBox(),
                  items: [
                    DropdownMenuItem(value: 'auto', child: Text(context.l10n.themeAuto)),
                    DropdownMenuItem(value: 'light', child: Text(context.l10n.themeLight)),
                    DropdownMenuItem(value: 'dark', child: Text(context.l10n.themeDark)),
                  ],
                  onChanged: (val) {
                    if (val != null) appSettings.updateTheme(val);
                  },
                ),
              ),
              const Divider(height: 1),

              // Language Selector
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.withValues(alpha: 0.15),
                  child: const Icon(Icons.language_outlined, color: Colors.teal),
                ),
                title: Text(context.l10n.language),
                trailing: DropdownButton<String>(
                  value: appSettings.languageCode,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'vi', child: Text('Tiếng Việt')),
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'ja', child: Text('日本語')),
                  ],
                  onChanged: (val) {
                    if (val != null) appSettings.updateLanguage(val);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Legal & Support Section
        Text(
          'Thông tin & Pháp lý',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.hintColor,
          ),
        ),
        const SizedBox(height: 10),

        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.description_outlined),
                title: Text(context.l10n.termsConditions),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(Routes.terms),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: Text(context.l10n.privacyPolicy),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(Routes.privacy),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Logout Button
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.redAccent,
            side: const BorderSide(color: Colors.redAccent),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(Icons.logout),
          label: Text(
            context.l10n.logout,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            getIt<AuthenticationBloc>().add(Logout());
            context.go(Routes.login);
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
