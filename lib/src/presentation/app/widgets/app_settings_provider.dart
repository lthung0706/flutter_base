import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../authentication/view/authentication_page.dart';
import '../../../core/constants/key_local_store.dart';
import '../bloc/global_app_bloc.dart';

/// InheritedWidget-based provider for language and theme settings.
///
/// Wraps the entire app tree so that both onboarding, login, and main app
/// can access and update these settings without going through Bloc.
class AppSettingsProvider extends StatefulWidget {
  const AppSettingsProvider({
    super.key,
    required this.child,
    this.initialLanguageCode,
    this.initialThemeMode,
  });

  final Widget child;
  final String? initialLanguageCode;
  final String? initialThemeMode;

  /// Convenience accessor – usage: `AppSettingsProvider.of(context)`
  static AppSettingsScope of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<AppSettingsScope>();
    assert(scope != null, 'No AppSettingsScope found in context');
    return scope!;
  }

  @override
  State<AppSettingsProvider> createState() => _AppSettingsProviderState();
}

class _AppSettingsProviderState extends State<AppSettingsProvider> {
  late String _languageCode;
  late String _themeMode;

  @override
  void initState() {
    super.initState();
    _languageCode = _resolveLanguageCode(widget.initialLanguageCode);
    _themeMode = widget.initialThemeMode ?? 'auto';
  }

  static String _resolveLanguageCode(String? code) {
    if (code != null && code.isNotEmpty) return code;
    final systemLang =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    if (systemLang == AppLocale.vi) return AppLocale.vi;
    if (systemLang == AppLocale.ja) return AppLocale.ja;
    return AppLocale.en;
  }

  void _updateLanguage(String code, [BuildContext? context]) {
    if (code == _languageCode) return;
    setState(() => _languageCode = code);

    final String currencyCode;
    if (code == AppLocale.ja) {
      currencyCode = 'JPY';
    } else if (code == AppLocale.vi) {
      currencyCode = 'VNĐ';
    } else {
      currencyCode = 'USD';
    }

    SharedPreferences.getInstance().then((prefs) async {
      await prefs.setString(KeyLocalStore.languageCode, code);
      await prefs.setString(KeyLocalStore.currencyCode, currencyCode);
      AuthenticationPage.updateCurrency(currencyCode);
    });

    if (context != null && context.mounted) {
      try {
        BlocProvider.of<GlobalAppBloc>(context).add(GlobalAppCurrencyChanged(currencyCode));
      } catch (_) {}
    }
  }

  void _updateTheme(String mode) {
    if (mode == _themeMode) return;
    setState(() => _themeMode = mode);
    SharedPreferences.getInstance().then(
      (prefs) => prefs.setString(KeyLocalStore.themeMode, mode),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppSettingsScope(
      languageCode: _languageCode,
      themeMode: _themeMode,
      updateLanguage: _updateLanguage,
      updateTheme: _updateTheme,
      child: widget.child,
    );
  }
}

/// The [InheritedWidget] that carries the settings data down the tree.
class AppSettingsScope extends InheritedWidget {
  const AppSettingsScope({
    super.key,
    required super.child,
    required this.languageCode,
    required this.themeMode,
    required this.updateLanguage,
    required this.updateTheme,
  });

  final String languageCode;
  final String themeMode;
  final void Function(String code, [BuildContext? context]) updateLanguage;
  final ValueChanged<String> updateTheme;

  /// Resolved [ThemeMode] from the string value.
  ThemeMode get resolvedThemeMode {
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Resolved [Locale] from the language code.
  Locale get resolvedLocale => Locale(languageCode);

  /// Human-readable language name.
  String get languageName =>
      AppLocale.supportedLanguageMap[languageCode] ??
      AppLocale.supportedLanguageMap[AppLocale.vi] ??
      AppLocale.vi;

  /// Human-readable theme name (requires l10n context, so pass from outside).
  String themeDisplayName(BuildContext context) {
    switch (themeMode) {
      case 'light':
        return context.l10n.themeLight;
      case 'dark':
        return context.l10n.themeDark;
      default:
        return context.l10n.themeAuto;
    }
  }

  @override
  bool updateShouldNotify(AppSettingsScope oldWidget) =>
      languageCode != oldWidget.languageCode ||
      themeMode != oldWidget.themeMode;
}
