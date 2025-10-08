import 'package:dio/dio.dart';
import 'package:frontend_chatbot/core/constants/constants.dart';
import 'package:frontend_chatbot/core/network/dio_logger_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioLoggerInterceptorProvider = Provider.autoDispose(
  (ref) => DioLoggerInterceptor(),
);

final dioProvider = Provider.autoDispose<Dio>((ref) {
  const timeOut = Duration(seconds: 90);
  return Dio(
    BaseOptions(
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      sendTimeout: timeOut,
      baseUrl: AppString.baseUrl,
    ),
  )..interceptors.add(ref.watch(dioLoggerInterceptorProvider));
});
