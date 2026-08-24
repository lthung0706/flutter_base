import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:report_person/src/core/constants/key_local_store.dart';
import 'package:report_person/src/routes/routes.dart';

abstract class RouteGuard {
  FutureOr<String?> redirect(BuildContext context, GoRouterState state);
}

class AuthGuard extends RouteGuard {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final loggedIn = await SharedPreferences.getInstance();
    final bool isLogin = loggedIn.getBool(KeyLocalStore.isLogined) ?? false;
    if (isLogin) {
      return null;
    } else {
      return Routes.login;
    }
    // if (!isLogin && state.path != Routes.login) return Routes.login;
    // return null;
  }
}
