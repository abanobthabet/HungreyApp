import 'package:dio/dio.dart';
import 'package:hungry_app/core/utils/pref_helpler.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //options.headers['Accept-Language'] = 'ar';

    final String? token = await PrefHelpler().getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }
}
