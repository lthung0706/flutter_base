// Package imports:
import 'package:app_config/src/network/endpoints/end_points.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

// Project imports:

final Map<String, String> mapMockApiForGetRequest = <String, String>{
  EndPoints.getSupliers: 'suplier_list',
};

final Map<String, String> mapMockApiForPostRequest = <String, String>{};

String? getJsonNameForGetRequest(
  final String endpoint, {
  final Map<String, dynamic>? queryParameters,
}) {
  if (endpoint.contains('/news') && queryParameters != null) {
    return 'news_services';
  }

  if (endpoint.contains('/branch/provinces') &&
      queryParameters?.containsKey('version') == true) {
    return 'province_v2';
  }

  for (final String key in mapMockApiForGetRequest.keys) {
    if (hasMatch(endpoint, key)) {
      return mapMockApiForGetRequest[key];
    }
  }

  return endpoint.replaceAll('/', '').replaceAll('-', '_');
}

String? getJsonNameForPostRequest(
  final String endpoint, {
  final dynamic data,
  final Map<String, dynamic>? queryParameters,
}) {
  for (final String key in mapMockApiForPostRequest.keys) {
    if (hasMatch(endpoint, key)) {
      return mapMockApiForPostRequest[key];
    }
  }

  return endpoint.replaceAll('/', '').replaceAll('-', '_');
}

bool hasMatch(final String path, final String endPoints) {
  final String endPoint = endPoints.replaceAll('{', ':').replaceAll('}', '');
  final RegExp regExp = pathToRegExp(endPoint);

  return regExp.hasMatch(path);
}
