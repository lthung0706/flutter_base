import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth_repository.dart';
import 'package:flutter_base/src/data/models/usecase/usecase.dart';

@injectable
class CheckLoginedUsecase implements UseCase<bool, void> {
  final AuthRepository _authRepository;

  CheckLoginedUsecase(this._authRepository);

  @override
  Future<bool> call({void params}) {
    return _authRepository.isLoggedIn();
  }
}
