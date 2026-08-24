import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Server rejects images larger than 5MB, so we "drop" (resize) the image
/// down to a safe size using extended_image's [ExtendedResizeImage] before
/// uploading. Only the resize/compression part of extended_image is used here.
class ImageCompressor {
  const ImageCompressor._();

  /// Tối đa kích thước file cho phép upload (5MB).
  static const int maxFileBytes = 5 * 1024 * 1024;

  /// Kích thước cạnh dài nhất sau khi resize (đủ cho thumbnail sản phẩm/kho).
  static const int maxEdge = 1280;

  /// Giảm kích thước file ảnh về dưới [maxFileBytes] (dùng [ExtendedResizeImage]
  /// của extended_image để drop độ phân giải) rồi encode lại thành JPEG.
  ///
  /// Trả về đường dẫn file ảnh đã nén. Nếu file gốc đã nhỏ hơn giới hạn thì
  /// giữ nguyên.
  static Future<String> compressToPath(String sourcePath) async {
    if (!kIsWeb) {
      final originalSize = await File(sourcePath).length();
      if (originalSize <= maxFileBytes) {
        return sourcePath;
      }
    }

    final image = await _resolveResized(sourcePath);

    final byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    final jpg = img.encodeJpg(
      img.Image.fromBytes(
        width: image.width,
        height: image.height,
        bytes: byteData!.buffer,
        order: img.ChannelOrder.rgba,
      ),
      quality: 85,
    );

    final dir = await getTemporaryDirectory();
    final baseName = p.basenameWithoutExtension(sourcePath);
    final target = File(p.join(dir.path, '${baseName}_compressed.jpg'));
    await target.writeAsBytes(jpg);
    return target.path;
  }

  /// Dùng [ExtendedResizeImage] (phần drop image của extended_image) để resize
  /// ảnh về cạnh dài nhất [maxEdge], trả về [ui.Image] đã resize.
  static Future<ui.Image> _resolveResized(String sourcePath) {
    final provider = ExtendedResizeImage(
      FileImage(File(sourcePath)),
      maxBytes: maxFileBytes,
      width: maxEdge,
      height: maxEdge,
    );

    final completer = Completer<ui.Image>();
    final stream = provider.resolve(const ImageConfiguration());
    final listener = ImageStreamListener(
      (info, _) => completer.complete(info.image),
      onError: (e, s) => completer.completeError(e, s),
    );
    stream.addListener(listener);
    return completer.future;
  }
}
