import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth.dart';
import 'package:flutter_base/src/authentication/auth_repository.dart';
import 'package:flutter_base/src/core/params/login_request_body.dart';
import 'package:flutter_base/src/data/models/data/data.dart';

import '../../data/models/usecase/usecase.dart';

@injectable
class LoginGoogleUsecase
    implements UseCase<DataState<AuthData>, GoogleLoginRequestBody> {
  final AuthRepository _repository;

  LoginGoogleUsecase(this._repository);
  @override
  Future<DataState<AuthData>> call({required GoogleLoginRequestBody params}) {
    return _repository.googleLogin(params);
  }
}
