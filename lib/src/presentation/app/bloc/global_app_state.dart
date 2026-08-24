part of 'global_app_bloc.dart';

enum GlobalAppStatus {
  init,
  loading,
  isFirstLaunch,
  isNotFirstLaunch,
  typingSuccess,
  userStatusSuccess,
  failure,
}

class GlobalAppState extends Equatable {
  const GlobalAppState(this.status, {this.data, this.currencyCode});
  final dynamic data;
  final GlobalAppStatus status;
  final String? currencyCode;

  GlobalAppState copyWith<T>(
    final GlobalAppStatus status, {
    final dynamic data,
    final String? currencyCode,
  }) {
    return GlobalAppState(
      status,
      data: data ?? this.data,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  @override
  List<Object?> get props => [status, data, currencyCode];
}
