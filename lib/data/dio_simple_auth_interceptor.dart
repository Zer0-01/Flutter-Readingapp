import 'package:dio/dio.dart';
import 'package:readingapps/configuration/app_local_storage.dart';

class DioSimpleAuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await AppLocalStorage().read(StorageKeys.jwtToken.name);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
