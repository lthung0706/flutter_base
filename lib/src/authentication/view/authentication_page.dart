import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:report_person/src/authentication/bloc/authentication_bloc.dart';
import 'package:report_person/src/routes/routes.dart';

import '../../data/models/local/user_model.dart';
import '../../module/injector.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});
  static User user = User();
  static String deviceId = 'EMPTY';
  static Uint8List? userIconBytes;
  static ValueNotifier<String?> currency = ValueNotifier(null);
  static ValueNotifier<String?> shortCurrency = ValueNotifier(null);

  static void updateCurrency(String? code) {
    currency.value = code;
    switch (code) {
      case 'VNĐ':
        shortCurrency.value = 'đ';
        break;
      case 'USD':
        shortCurrency.value = '\$';
        break;
      case 'EUR':
        shortCurrency.value = '€';
        break;
      case 'JPY':
        shortCurrency.value = '¥';
        break;
      case 'KRW':
        shortCurrency.value = '₩';
        break;
      default:
        shortCurrency.value = 'đ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthenticationBloc>()..add(CheckIsLoggedIn()),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.isLoggedIn ||
              state.status == AuthenticationStatus.registerSuccess) {
            context.replace(Routes.home);
          } else if (state.status == AuthenticationStatus.isExpired ||
              state.status == AuthenticationStatus.logoutSuccess) {
            context.replace(Routes.login);
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}
