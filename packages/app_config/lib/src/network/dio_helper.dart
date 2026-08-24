// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';

Future<FormData?> convertToFormData(final List<String> paths) async {
  try {
    final Map<String, MultipartFile> mapFiles = <String, MultipartFile>{};
    for (int i = 0; i < paths.length; i++) {
      // api contrains with format file1 file2
      final String fileName = 'file${i + 1}';
      mapFiles[fileName] = await MultipartFile.fromFile(
        paths[i],
        filename: '$fileName.jpg',
      );
    }

    return FormData.fromMap(mapFiles);
  } catch (_) {
    return null;
  }
}

Future<FormData?>? collaboratorConvertToFormData(
  final List<String> paths,
) async {
  final mapFiles = <String, MultipartFile>{};
  if (kIsWeb) {
    for (var i = 0; i < paths.length; i++) {
      final extension = paths[i].substring(paths[i].lastIndexOf('.'));

      //remove file extension on web platform
      final path = paths[i].substring(0, paths[i].lastIndexOf('.'));

      final fileBytes = convertStringToUint8List(path);

      final fileName = i == 0 ? 'file1' : 'file${i + 1}';

      mapFiles[fileName] = MultipartFile.fromBytes(
        fileBytes,
        filename: '$fileName$extension',
      );
    }
  } else {
    for (var i = 0; i < paths.length; i++) {
      // api contrains with format file1 file2
      final fileName = i == 0 ? 'file1' : 'file${i + 1}';
      mapFiles[fileName] = await MultipartFile.fromFile(
        paths[i],
        //  filename: '$fileName${extension(paths[i])}',
      );
    }
  }

  return FormData.fromMap(mapFiles);
}

Uint8List convertStringToUint8List(final String str) {
  final List<int> codeUnits = str.codeUnits;
  final Uint8List unit8List = Uint8List.fromList(codeUnits);

  return unit8List;
}
