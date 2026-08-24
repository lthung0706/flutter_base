import 'package:injectable/injectable.dart';

import '../../core/params/refresh_token_body.dart';
import '../../data/models/data/api_state/data_state.dart';
import '../../data/models/usecase/usecase.dart';
import '../auth.dart';
import '../auth_repository.dart';

@injectable
class RefreshTokenUsecase
    implements UseCase<DataState<AuthData>, RefreshTokenRequestBody> {
  final AuthRepository _repository;

  RefreshTokenUsecase(this._repository);
  @override
  Future<DataState<AuthData>> call({required RefreshTokenRequestBody params}) {
    return _repository.refreshToken(params);
  }
}
