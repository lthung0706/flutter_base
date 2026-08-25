import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_base/src/core/constants/key_local_store.dart';
import 'package:flutter_base/src/core/services/flexible_in_app_update_service.dart';
import 'package:flutter_base/src/module/injector.dart';
import 'package:flutter_base/src/presentation/app/bloc/global_app_bloc.dart';
import 'package:flutter_base/src/presentation/app/widgets/app_settings_provider.dart';
import 'package:flutter_base/src/theme/theme.dart';

class GlobalAppPage extends StatefulWidget {
  const GlobalAppPage({super.key});

  @override
  State<GlobalAppPage> createState() => _GlobalAppPageState();
}

class _GlobalAppPageState extends State<GlobalAppPage> {
  String? _initialLanguageCode;
  String _initialThemeMode = 'auto';
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;

    var languageCode = prefs.getString(KeyLocalStore.languageCode);
    if (languageCode == null || languageCode.isEmpty) {
      final systemLang =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      if (systemLang == AppLocale.vi) {
        languageCode = AppLocale.vi;
      } else if (systemLang == AppLocale.ja) {
        languageCode = AppLocale.ja;
      } else {
        languageCode = AppLocale.en;
      }
      await prefs.setString(KeyLocalStore.languageCode, languageCode);

      // Cache currency theo ngôn ngữ (nếu chưa có) để tránh hỏi lại lần đầu
      final hasCurrency =
          prefs.getString(KeyLocalStore.currencyCode) != null;
      if (!hasCurrency) {
        final String defaultCurrency;
        if (languageCode == AppLocale.ja) {
          defaultCurrency = 'JPY';
        } else if (languageCode == AppLocale.vi) {
          defaultCurrency = 'VNĐ';
        } else {
          defaultCurrency = 'USD';
        }
        await prefs.setString(KeyLocalStore.currencyCode, defaultCurrency);
      }
    }

    setState(() {
      _initialLanguageCode = languageCode;
      _initialThemeMode = prefs.getString(KeyLocalStore.themeMode) ?? 'auto';
      _ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: CircularProgressIndicator.adaptive()),
        ),
      );
    }

    return AppSettingsProvider(
      initialLanguageCode: _initialLanguageCode,
      initialThemeMode: _initialThemeMode,
      child: BlocProvider(
        create: (context) => getIt<GlobalAppBloc>()..add(GlobalAppStarted()),
        child: Builder(
          builder: (context) {
            final appSettings = AppSettingsProvider.of(context);

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: appSettings.resolvedLocale,
              routerConfig: getIt<GoRouter>(),
              builder: (context, child) => FlexibleInAppUpdateGate(
                child: child ?? const SizedBox.shrink(),
              ),
              title: 'SStrip',
              themeMode: appSettings.resolvedThemeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
            );
          },
        ),
      ),
    );
  }
}
