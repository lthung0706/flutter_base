import 'package:injectable/injectable.dart';
import 'package:sstrip/src/authentication/auth.dart';
import 'package:sstrip/src/authentication/auth_repository.dart';
import 'package:sstrip/src/core/params/login_request_body.dart';
import 'package:sstrip/src/data/models/data/data.dart';

import '../../data/models/usecase/usecase.dart';

@injectable
class LoginAppleUsecase
    implements UseCase<DataState<AuthData>, AppleLoginRequestBody> {
  final AuthRepository _repository;

  LoginAppleUsecase(this._repository);
  @override
  Future<DataState<AuthData>> call({required AppleLoginRequestBody params}) {
    return _repository.appleLogin(params);
  }
}
