// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

// Project imports:
import 'map_mock_api.dart';

class MockApi {
  static Future<Map<String, dynamic>?> get(
    final String endpoint, {
    final Map<String, dynamic>? queryParameters,
  }) async {
    return mock(
      getJsonNameForGetRequest(endpoint, queryParameters: queryParameters),
    );
  }

  static Future<Map<String, dynamic>?> post(
    final String endpoint, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
  }) async {
    return mock(
      getJsonNameForPostRequest(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  static Future<Map<String, dynamic>?> mock(final String? endpoint) async {
    // the way how to load assets in packages
    final String responseStr = await rootBundle.loadString(
      'assets/mockup/$endpoint.json',
    );
    final Map<String, dynamic>? responseJson =
        json.decode(responseStr) as Map<String, dynamic>?;

    return responseJson;
  }
}
