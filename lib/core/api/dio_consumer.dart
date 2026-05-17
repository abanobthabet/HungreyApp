import 'package:dio/dio.dart';

import 'package:hungry_app/core/api/api_consumer.dart';
import 'package:hungry_app/core/api/api_interceptors.dart';
import 'package:hungry_app/core/api/endpoint.dart';
import 'package:hungry_app/core/error/exption.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = Endpoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
  @override
  Future<T> delete<T>(
    String path, {
    dynamic data,
    bool formdata = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.delete(
        path,
        data: formdata ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      handelDioException(e);
      rethrow;
    }
  }

  @override
  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data as T;
    } on DioException catch (e) {
      handelDioException(e);
      rethrow;
    }
  }

  @override
  Future<T> patch<T>(
    String path, {
    dynamic data,
    bool formdata = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: formdata ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      handelDioException(e);
      rethrow;
    }
  }

  @override
  Future<T> post<T>(
    String path, {
    dynamic data,
    bool formdata = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.post(
        path,
        data: formdata ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      handelDioException(e);
      rethrow;
    }
  }
}
