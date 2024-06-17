import 'package:dio/dio.dart';

///
///异常
///
class ApiException extends CustomDioError {
  final int code;
  final dynamic cause;
  final String? _message;

  ApiException({
    required this.code,
    String? message,
    this.cause,
  }) : _message = message;

  @override
  String get message => _message ?? cause?.toString() ?? '';

  @override
  String toString() {
    var str = 'ApiException{code: $code, message: $message, cause: $cause}';
    if (cause is Error) {
      str += '\n${(cause as Error).stackTrace}';
    }
    return str;
  }

  @override
  DioException copyWith({RequestOptions? requestOptions, Response? response, DioExceptionType? type, Object? error, StackTrace? stackTrace, String? message}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement stackTrace
  StackTrace get stackTrace => throw UnimplementedError();

  @override
  // TODO: implement type
  DioExceptionType get type => throw UnimplementedError();
}

abstract class CustomDioError implements DioException {
  static final defaultErrorRequestOptions = RequestOptions(path: '');

  @override
  String get message;

  @override
  dynamic error;

  RequestOptions _requestOptions = defaultErrorRequestOptions;

  @override
  RequestOptions get requestOptions => _requestOptions;

  @override
  set requestOptions(RequestOptions value) {
    _requestOptions = value;
  }

  @override
  Response? response;

  @override
  DioExceptionType type = DioExceptionType.unknown;

  @override
  late StackTrace stackTrace;
}
