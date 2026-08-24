import 'package:injectable/injectable.dart';

import '../../data/models/data/data.dart';
import '../../data/models/usecase/usecase.dart';
import '../auth_repository.dart';

@injectable
class LogoutUsecase implements UseCase<DataState<bool>, void> {
  final AuthRepository _repository;

  LogoutUsecase(this._repository);
  @override
  Future<DataState<bool>> call({void params}) {
    return _repository.logout();
  }
}
