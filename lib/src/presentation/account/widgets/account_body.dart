import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../authentication/bloc/authentication_bloc.dart';
import '../../../authentication/view/authentication_page.dart';
import '../../../module/injector.dart';
import '../../../routes/routes.dart';
import '../../app/bloc/global_app_bloc.dart';
import '../../app/widgets/app_settings_provider.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthenticationPage.user;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appSettings = AppSettingsProvider.of(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          // Profile Card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: colorScheme.primary.withValues(alpha: 0.15),
                    child: Text(
                      (user.name?.isNotEmpty ?? false)
                          ? user.name![0].toUpperCase()
                          : 'U',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (user.name?.isNotEmpty ?? false)
                              ? user.name!
                              : 'Người dùng',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          (user.email?.isNotEmpty ?? false)
                              ? user.email!
                              : 'Chưa có email',
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
          const SizedBox(height: 24),

          // Menu Options
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language_outlined),
                  title: Text(context.l10n.language),
                  trailing: Text(
                    appSettings.languageCode == 'vi'
                        ? 'Tiếng Việt'
                        : appSettings.languageCode == 'en'
                            ? 'English'
                            : '日本語',
                    style: TextStyle(color: theme.hintColor),
                  ),
                  onTap: () => _showLanguagePicker(context, appSettings.languageCode),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.palette_outlined),
                  title: Text(context.l10n.themeTitle),
                  trailing: Text(
                    appSettings.themeMode == 'dark'
                        ? context.l10n.themeDark
                        : appSettings.themeMode == 'light'
                            ? context.l10n.themeLight
                            : context.l10n.themeAuto,
                    style: TextStyle(color: theme.hintColor),
                  ),
                  onTap: () => _showThemePicker(context, appSettings.themeMode),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.attach_money_outlined),
                  title: Text(context.l10n.currencyTitle),
                  trailing: ValueListenableBuilder<String?>(
                    valueListenable: AuthenticationPage.currency,
                    builder: (context, val, _) => Text(
                      val ?? 'VNĐ',
                      style: TextStyle(color: theme.hintColor),
                    ),
                  ),
                  onTap: () => _showCurrencyPicker(context, AuthenticationPage.currency.value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Legal
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
          const SizedBox(height: 32),

          // Logout
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.withValues(alpha: 0.1),
                foregroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              icon: const Icon(Icons.logout, size: 18),
              label: Text(
                context.l10n.logout,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                getIt<AuthenticationBloc>().add(Logout());
                context.go(Routes.login);
              },
            ),
          ),
          const SizedBox(height: 20),

          // Version info
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              return Center(
                child: Text(
                  'v${snapshot.data!.version}+${snapshot.data!.buildNumber}',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.hintColor.withValues(alpha: 0.6),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showLanguagePicker(BuildContext context, String currentLang) {
    final settings = AppSettingsProvider.of(context);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                context.l10n.language,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Tiếng Việt'),
                trailing: currentLang == 'vi' ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () {
                  settings.updateLanguage('vi');
                  Navigator.pop(sheetContext);
                },
              ),
              ListTile(
                title: const Text('English'),
                trailing: currentLang == 'en' ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () {
                  settings.updateLanguage('en');
                  Navigator.pop(sheetContext);
                },
              ),
              ListTile(
                title: const Text('日本語'),
                trailing: currentLang == 'ja' ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () {
                  settings.updateLanguage('ja');
                  Navigator.pop(sheetContext);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showThemePicker(BuildContext context, String currentTheme) {
    final settings = AppSettingsProvider.of(context);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                context.l10n.themeTitle,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(context.l10n.themeAuto),
                trailing: currentTheme == 'auto' ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () {
                  settings.updateTheme('auto');
                  Navigator.pop(sheetContext);
                },
              ),
              ListTile(
                title: Text(context.l10n.themeLight),
                trailing: currentTheme == 'light' ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () {
                  settings.updateTheme('light');
                  Navigator.pop(sheetContext);
                },
              ),
              ListTile(
                title: Text(context.l10n.themeDark),
                trailing: currentTheme == 'dark' ? const Icon(Icons.check, color: Colors.blue) : null,
                onTap: () {
                  settings.updateTheme('dark');
                  Navigator.pop(sheetContext);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showCurrencyPicker(BuildContext context, String? currentCurrency) {
    final List<String> currencies = ['VNĐ', 'USD', 'EUR', 'JPY', 'GBP', 'KRW', 'CNY'];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                context.l10n.currencyTitle,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...currencies.map(
                (currency) => ListTile(
                  title: Text(currency),
                  trailing: currentCurrency == currency ? const Icon(Icons.check, color: Colors.blue) : null,
                  onTap: () {
                    BlocProvider.of<GlobalAppBloc>(context).add(GlobalAppCurrencyChanged(currency));
                    Navigator.pop(sheetContext);
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
