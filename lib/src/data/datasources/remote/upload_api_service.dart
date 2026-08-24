import 'package:app_config/app_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/generic_respone_model.dart';
import '../../models/upload_model.dart';

part 'upload_api_service.g.dart';

@RestApi()
abstract class UploadApiService {
  factory UploadApiService(final Dio dio, {final String baseUrl}) =
      _UploadApiService;

  @POST('${EndPoints.upload}/{user_id}')
  @MultiPart()
  Future<HttpResponse<GenericResponseModel<UploadModel>?>> multipartUpload(
    @Path('user_id') final String userId,
    @Part(name: 'image') final MultipartFile file, {
    @SendProgress() final ProgressCallback? onSendProgress,
    @CancelRequest() final CancelToken? onCancelRequest,
    @Header('isMockUp') final bool? isMockUp,
  });
}
