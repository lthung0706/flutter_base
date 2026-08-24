import 'package:injectable/injectable.dart';
import 'package:sstrip/src/authentication/auth.dart';
import 'package:sstrip/src/authentication/auth_repository.dart';
import 'package:sstrip/src/core/params/login_request_body.dart';
import 'package:sstrip/src/data/models/data/data.dart';

import '../../data/models/usecase/usecase.dart';

@injectable
class LoginUsecase implements UseCase<DataState<AuthData>, LoginRequestBody> {
  final AuthRepository _repository;

  LoginUsecase(this._repository);
  @override
  Future<DataState<AuthData>> call({required LoginRequestBody params}) {
    return _repository.login(params);
  }
}
