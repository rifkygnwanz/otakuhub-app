import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/api_constants.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'X-MAL-CLIENT-ID': ApiConstants.clientId,
          'Content-Type': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(_MalInterceptor());
  }

  Dio get dio => _dio;
}

class _MalInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-MAL-CLIENT-ID'] = ApiConstants.clientId;
    super.onRequest(options, handler);
  }

}
