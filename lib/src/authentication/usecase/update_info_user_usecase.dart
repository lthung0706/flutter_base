import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth_repository.dart';
import 'package:flutter_base/src/core/params/user_request_body.dart';
import 'package:flutter_base/src/data/models/data/data.dart';

import '../../data/models/usecase/usecase.dart';
import '../../domain/entities/user_updated.dart';

@injectable
class UpdateInfoUserUsecase
    implements UseCase<DataState<List<UserUpdated>>, UserRequestBody> {
  final AuthRepository _repository;

  UpdateInfoUserUsecase(this._repository);
  @override
  Future<DataState<List<UserUpdated>>> call({required UserRequestBody params}) {
    return _repository.updateInfoUser(params);
  }
}
