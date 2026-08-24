import 'dart:async';
import 'package:grpc/grpc.dart';

import '../log/log.dart';

class AuthInterceptor extends ClientInterceptor {
  final Future<Map<String, dynamic>> Function() getToken;

  AuthInterceptor({required this.getToken});

  // Metadata provider that injects the auth token asynchronously
  // Kiểm tra thời hạn token, nếu hết hạn thì refresh trước khi inject
  Future<void> _tokenProvider(Map<String, String> metadata, String uri) async {
    // Kiểm tra xem token có hết hạn không
    final tokenData = await getToken();
    metadata['authorization'] = 'Bearer ${tokenData['Authorization']}';
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    Log.info(options.metadata);
    return invoker(
      method,
      requests,
      options.mergedWith(
        CallOptions(
          metadata: {'authorization': 'Bearer tesssttttt'},
          providers: [_tokenProvider],
        ),
      ),
    );
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    // Use metadata providers for async token injection
    return invoker(
      method,
      request,
      options.mergedWith(CallOptions(providers: [_tokenProvider])),
    );
  }
}
