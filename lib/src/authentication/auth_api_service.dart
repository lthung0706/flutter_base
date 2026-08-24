import 'package:app_config/app_config.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sstrip/src/core/params/login_request_body.dart';
import 'package:sstrip/src/core/params/register_body_params.dart';
import 'package:sstrip/src/data/models/auth_model.dart';
import 'package:sstrip/src/data/models/generic_respone_model.dart';

import '../core/params/add_user_request_body.dart';
import '../core/params/refresh_token_body.dart';
import '../core/params/user_request_body.dart';
import '../data/models/auth_register_model.dart';
import '../data/models/user_updated_model.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(final Dio dio, {final String baseUrl}) =
      _AuthApiService;

  @POST(EndPoints.register)
  Future<HttpResponse<GenericResponseModel<AuthenRegisterModel>?>> register(
    @Body() final RegisterBodyParams body, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.login)
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> login(
    @Body() final LoginRequestBody body, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.googleLogin)
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> googleLogin(
    @Body() final GoogleLoginRequestBody body, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.appleLogin)
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> appleLogin(
    @Body() final AppleLoginRequestBody body, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.addUser)
  Future<HttpResponse<GenericResponseModel<bool>?>> addUser(
    @Body() final AddUserRequestBody body, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.updateInfoUser)
  Future<HttpResponse<GenericResponseModel<List<UserUpdatedModel>>?>>
  updateInfoUser(
    @Body() final UserRequestBody body, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.refeshToken)
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> refreshToken(
    @Body() final RefreshTokenRequestBody body, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.logout)
  Future<HttpResponse<GenericResponseModel<bool>?>> logout({
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.otp)
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> getOtp({
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST(EndPoints.resetPassword)
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> resetPassword({
    @Header('isMockUp') final bool? isMockUp,
  });

  @DELETE('${EndPoints.deleteUser}/{userId}')
  Future<HttpResponse<GenericResponseModel<bool>?>> deleteUser({
    @Path('userId') required final String userId,
    @Header('isMockUp') final bool? isMockUp,
  });
}
