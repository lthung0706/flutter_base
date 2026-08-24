import 'package:injectable/injectable.dart';
import 'package:report_person/src/authentication/auth_repository.dart';
import 'package:report_person/src/data/models/local/user_model.dart';
import 'package:report_person/src/data/models/usecase/usecase.dart';

@injectable
class SaveUserUsecase implements UseCase<void, User?> {
  final AuthRepository _authRepository;

  SaveUserUsecase(this._authRepository);

  @override
  Future<void> call({final User? params}) {
    return _authRepository.saveUser(params);
  }
}
