abstract class Failure {
  final String message;
  final String? code;
  final int? statusCode;

  const Failure({required this.message, this.code, this.statusCode});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code, super.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code = 'NETWORK_ERROR'});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({required super.message, super.code = 'TIMEOUT'});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code = 'CACHE_ERROR'});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    required super.message,
    super.code = 'UNEXPECTED_ERROR',
  });
}
