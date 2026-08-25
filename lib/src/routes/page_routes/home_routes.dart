import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/src/authentication/view/authentication_page.dart';
import 'package:flutter_base/src/authentication/view/login_page.dart';
import 'package:flutter_base/src/authentication/view/register_page.dart';
import 'package:flutter_base/src/billing/view/billing_page.dart';
import 'package:flutter_base/src/presentation/account/view/privacy_page.dart';
import 'package:flutter_base/src/presentation/account/view/terms_page.dart';
import 'package:flutter_base/src/presentation/home/view/home_page.dart';
import 'package:flutter_base/src/presentation/onboarding/on_boarding_page.dart';
import 'package:flutter_base/src/presentation/setting/view/setting_page.dart';
import 'package:flutter_base/src/presentation/splash/splash_page.dart';
import 'package:flutter_base/src/routes/routes.dart';

part 'home_routes.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/',
  name: 'Splash',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<AuthenticationRoute>(path: Routes.authentication),
    TypedGoRoute<OnBoardingRoute>(path: Routes.onBoarding),
    TypedGoRoute<SettingRoute>(path: Routes.setting),
    TypedGoRoute<HomeRoute>(path: Routes.home),
    TypedGoRoute<LoginRoute>(path: Routes.login),
    TypedGoRoute<RegisterRoute>(path: Routes.register),
    TypedGoRoute<BillingRoute>(path: Routes.billing),
    TypedGoRoute<TermsRoute>(path: Routes.terms),
    TypedGoRoute<PrivacyRoute>(path: Routes.privacy),
  ],
)
class SplashRoute extends GoRouteData with $SplashRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

class OnBoardingRoute extends GoRouteData with $OnBoardingRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingScreen();
  }
}

class AuthenticationRoute extends GoRouteData with $AuthenticationRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthenticationPage();
  }
}

class LoginRoute extends GoRouteData with $LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage();
  }
}

class RegisterRoute extends GoRouteData with $RegisterRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterPage();
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class SettingRoute extends GoRouteData with $SettingRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
  }
}

class BillingRoute extends GoRouteData with $BillingRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BillingPage();
  }
}

class TermsRoute extends GoRouteData with $TermsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TermsPage();
  }
}

class PrivacyRoute extends GoRouteData with $PrivacyRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PrivacyPage();
  }
}
