import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

class GrpcManager {
  /// Wrap a stream call with error handling
  /// gRPC channel handles reconnection automatically with lazy connect, so we don't enforce a client-side timeout
  Stream<T> wrapStream<T>(Stream<T> Function() streamFactory) async* {
    try {
      final stream = streamFactory();

      await for (final data in stream) {
        yield data;
      }
    } catch (error) {
      debugPrint('catch error:$error');
    }
  }

  /// Map gRPC errors to user-friendly exceptions
  /// Override this method to customize error messages
  Exception mapGrpcError(dynamic error) {
    if (error is GrpcError) {
      switch (error.code) {
        case StatusCode.unavailable:
          return Exception('Server không khả dụng. Vui lòng thử lại sau.');
        case StatusCode.unauthenticated:
          return Exception('Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại.');
        case StatusCode.deadlineExceeded:
          return Exception('Hết thời gian kết nối. Vui lòng kiểm tra mạng.');
        case StatusCode.cancelled:
          return Exception('Kết nối bị hủy.');
        case StatusCode.permissionDenied:
          return Exception('Không có quyền truy cập.');
        case StatusCode.notFound:
          return Exception('Không tìm thấy dữ liệu.');
        case StatusCode.alreadyExists:
          return Exception('Dữ liệu đã tồn tại.');
        case StatusCode.resourceExhausted:
          return Exception('Quá tải. Vui lòng thử lại sau.');
        case StatusCode.failedPrecondition:
          return Exception('Điều kiện không hợp lệ.');
        case StatusCode.aborted:
          return Exception('Yêu cầu bị hủy bỏ.');
        case StatusCode.outOfRange:
          return Exception('Dữ liệu ngoài phạm vi cho phép.');
        case StatusCode.unimplemented:
          return Exception('Chức năng chưa được hỗ trợ.');
        case StatusCode.internal:
          return Exception('Lỗi hệ thống. Vui lòng liên hệ hỗ trợ.');
        case StatusCode.dataLoss:
          return Exception('Mất dữ liệu. Vui lòng thử lại.');
        default:
          return Exception('Lỗi kết nối: ${error.message}');
      }
    }
    return Exception('Lỗi không xác định: $error');
  }

  /// Wrap a unary gRPC call with error handling.
  /// gRPC channel handles reconnection and backoff automatically with lazy connect,
  /// so we don't enforce an additional client-side timeout here.
  ///
  /// Example:
  /// ```dart
  /// final response = await grpcProvider.wrapUnaryCall(
  ///   () => client.sendLocation(request),
  /// );
  /// ```
  Future<T> wrapUnaryCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } catch (error) {
      throw mapGrpcError(error);
    }
  }
}
