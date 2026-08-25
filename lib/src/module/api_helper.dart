import 'dart:async';

import 'package:flutter_base/src/authentication/usecase/get_user_usecase.dart';
import 'package:flutter_base/src/module/injector.dart';

Future<Map<String, dynamic>> getCollaboratorHeaders() async {
  final user = await getIt<GetUserUsecase>().call();
  return <String, dynamic>{
    'Authorization': '${user?.accessToken}',
  };
}

Future<Map<String, dynamic>> getCollaboratorGeoGoogleMapHeaders() async {
  return <String, String>{
    'Authorization': 'prj_test_pk_86d407435a284ad9f4575a70e62b8a9b1879c360',
  };
}

Map<String, StreamController<Map<String, dynamic>?>> getMapStream() {
  return <String, StreamController<Map<String, dynamic>?>>{};
}
