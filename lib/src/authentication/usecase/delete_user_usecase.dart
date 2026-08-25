import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth_repository.dart';
import 'package:flutter_base/src/data/models/data/data.dart';

import '../../data/models/usecase/usecase.dart';

@injectable
class DeleteUserUseCase implements UseCase<DataState<bool>, String> {
  final AuthRepository _repository;

  DeleteUserUseCase(this._repository);
  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteUser(params);
  }
}
