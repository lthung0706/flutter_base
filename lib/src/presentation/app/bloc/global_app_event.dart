part of 'global_app_bloc.dart';

abstract class GlobalAppEvent extends Equatable {
  const GlobalAppEvent();

  @override
  List<Object> get props => [];
}

class GlobalAppStarted extends GlobalAppEvent {}

class GlobalAppContinueOnBoarding extends GlobalAppEvent {}

class GlobalAppCurrencyChanged extends GlobalAppEvent {
  const GlobalAppCurrencyChanged(this.currencyCode);
  final String currencyCode;

  @override
  List<Object> get props => [currencyCode];
}
