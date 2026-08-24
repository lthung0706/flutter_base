abstract class UseCase<T, P> {
  Future<T> call({required final P params});
}

abstract class StreamUseCase<T, P> {
  Stream<T> call({required final P params});
}

abstract class StreamGRPCService<T, P> {
  Stream<T> call(P params);
}
