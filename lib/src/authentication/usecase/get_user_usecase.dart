import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth_repository.dart';
import 'package:flutter_base/src/data/models/local/user_model.dart';
import 'package:flutter_base/src/data/models/usecase/usecase.dart';

@injectable
class GetUserUsecase implements UseCase<User?, void> {
  final AuthRepository _authRepository;

  GetUserUsecase(this._authRepository);

  @override
  Future<User?> call({void params}) {
    return _authRepository.getUser();
  }
}
