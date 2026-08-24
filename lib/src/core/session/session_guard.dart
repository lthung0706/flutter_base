import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../authentication/usecase/save_user_usecase.dart';
import '../../authentication/view/authentication_page.dart';
import '../../data/models/local/user_model.dart';
import '../../module/injector.dart';
import '../../routes/routes.dart';
import '../constants/key_local_store.dart';

/// Global navigator key used to show app-wide dialogs (e.g. session expired)
/// and to navigate when there is no widget [BuildContext] available.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// Handles authentication/session failures (HTTP 401) globally.
///
/// When the access token is invalid or expired, it shows a blocking dialog,
/// clears the related session data and sends the user back to the login page.
class SessionGuard {
  SessionGuard._();

  static bool _isHandling = false;

  /// Triggered when a request fails with 401 while a token was attached.
  static Future<void> handleUnauthorized() async {
    if (_isHandling) return;
    final context = rootNavigatorKey.currentContext;
    if (context == null) return;
    _isHandling = true;

    try {
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          final colorScheme = Theme.of(dialogContext).colorScheme;
          return PopScope(
            canPop: false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              icon: Icon(
                Icons.lock_clock_outlined,
                size: 40,
                color: colorScheme.error,
              ),
              title: Text(
                dialogContext.l10n.sessionExpiredTitle,
                textAlign: TextAlign.center,
              ),
              content: Text(
                dialogContext.l10n.sessionExpiredMessage,
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text(dialogContext.l10n.confirm),
                  ),
                ),
              ],
            ),
          );
        },
      );

      await _clearSession();

      rootNavigatorKey.currentState?.popUntil((route) => route.isFirst);
      getIt<GoRouter>().go(Routes.login);
    } finally {
      _isHandling = false;
    }
  }

  /// Clears the persisted token, in-memory user state and login flag.
  static Future<void> _clearSession() async {
    try {
      await getIt<SaveUserUsecase>().call(params: User());
      AuthenticationPage.user = User();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(KeyLocalStore.isLogined, false);
    } catch (_) {}
  }
}
