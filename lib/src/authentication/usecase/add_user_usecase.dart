import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth_repository.dart';
import 'package:flutter_base/src/core/params/add_user_request_body.dart';
import 'package:flutter_base/src/data/models/data/data.dart';

import '../../data/models/usecase/usecase.dart';

@injectable
class AddUserUsecase implements UseCase<DataState<bool>, AddUserRequestBody> {
  final AuthRepository _repository;

  AddUserUsecase(this._repository);
  @override
  Future<DataState<bool>> call({required AddUserRequestBody params}) {
    return _repository.addUser(params);
  }
}
