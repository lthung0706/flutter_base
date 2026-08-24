// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$splashRoute];

RouteBase get $splashRoute => GoRouteData.$route(
  path: '/',
  name: 'Splash',
  factory: $SplashRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: '/authentication',
      factory: $AuthenticationRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/onboarding',
      factory: $OnBoardingRoute._fromState,
    ),
    GoRouteData.$route(path: '/setting', factory: $SettingRoute._fromState),
    GoRouteData.$route(path: '/home', factory: $HomeRoute._fromState),
    GoRouteData.$route(path: '/login', factory: $LoginRoute._fromState),
    GoRouteData.$route(path: '/register', factory: $RegisterRoute._fromState),
    GoRouteData.$route(path: '/billing', factory: $BillingRoute._fromState),
    GoRouteData.$route(path: '/terms', factory: $TermsRoute._fromState),
    GoRouteData.$route(path: '/privacy', factory: $PrivacyRoute._fromState),
  ],
);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => SplashRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AuthenticationRoute on GoRouteData {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      AuthenticationRoute();

  @override
  String get location => GoRouteData.$location('/authentication');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OnBoardingRoute on GoRouteData {
  static OnBoardingRoute _fromState(GoRouterState state) => OnBoardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingRoute on GoRouteData {
  static SettingRoute _fromState(GoRouterState state) => SettingRoute();

  @override
  String get location => GoRouteData.$location('/setting');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BillingRoute on GoRouteData {
  static BillingRoute _fromState(GoRouterState state) => BillingRoute();

  @override
  String get location => GoRouteData.$location('/billing');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $TermsRoute on GoRouteData {
  static TermsRoute _fromState(GoRouterState state) => TermsRoute();

  @override
  String get location => GoRouteData.$location('/terms');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PrivacyRoute on GoRouteData {
  static PrivacyRoute _fromState(GoRouterState state) => PrivacyRoute();

  @override
  String get location => GoRouteData.$location('/privacy');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
