import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth_repository.dart';
import 'package:flutter_base/src/core/params/register_body_params.dart';
import 'package:flutter_base/src/data/models/data/data.dart';

import '../../data/models/usecase/usecase.dart';
import '../../domain/entities/auth_register.dart';

@injectable
class RegisterUsecase
    implements UseCase<DataState<AuthenRegister>, RegisterBodyParams> {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);
  @override
  Future<DataState<AuthenRegister>> call({required RegisterBodyParams params}) {
    return _repository.register(params);
  }
}
