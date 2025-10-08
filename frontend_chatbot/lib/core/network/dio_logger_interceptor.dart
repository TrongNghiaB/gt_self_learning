import 'package:dio/dio.dart';
import 'package:frontend_chatbot/core/utils/logger.dart';

class DioLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d(
      'REQUEST[${options.method}] => uri: ${options.uri}\n'
      'header: ${options.headers}\n'
      'request: ${options.data}',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'RESPONSE[${response.statusCode}] => uri: ${response.realUri}\n'
      'header: ${response.headers}\n'
      'response: ${response.data}\n',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\nerr: $err',
    );
    return super.onError(err, handler);
  }
}
