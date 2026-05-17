import 'package:dio/dio.dart';

import 'package:hungry_app/core/error/error_model.dart';

class ExceptionHandler implements Exception {
  final ErrorModel? errorModel;
  final String? error;

  ExceptionHandler({this.errorModel, this.error});
}

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ExceptionHandler(
        error: 'Connection timeout',
        errorModel: e.response?.data != null
            ? ErrorModel.fromJson(e.response!.data)
            : null,
      );
    case DioExceptionType.sendTimeout:
      throw ExceptionHandler(
        error: 'Failed to send data',
        errorModel: e.response?.data != null
            ? ErrorModel.fromJson(e.response!.data)
            : null,
      );

    case DioExceptionType.receiveTimeout:
      throw ExceptionHandler(
        error: 'Server took too long to respond',
        errorModel: e.response?.data != null
            ? ErrorModel.fromJson(e.response!.data)
            : null,
      );

    case DioExceptionType.badCertificate:
      throw ExceptionHandler(
        error: 'Security certificate error',
        errorModel: e.response?.data != null
            ? ErrorModel.fromJson(e.response!.data)
            : null,
      );

    case DioExceptionType.cancel:
      throw ExceptionHandler(
        error: 'Request was cancelled',
        errorModel: e.response?.data != null
            ? ErrorModel.fromJson(e.response!.data)
            : null,
      );

    case DioExceptionType.connectionError:
      throw ExceptionHandler(
        error: 'No internet connection',
        errorModel: e.response?.data != null
            ? ErrorModel.fromJson(e.response!.data)
            : null,
      );

    case DioExceptionType.unknown:
      throw ExceptionHandler(
        error: 'An unexpected error occurred',
        errorModel: e.response?.data != null
            ? ErrorModel.fromJson(e.response!.data)
            : null,
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 401:
          throw ExceptionHandler(
            error: 'Unauthorized',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
        case 403:
          throw ExceptionHandler(
            error: 'Access denied',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
        case 404:
          throw ExceptionHandler(
            error: 'Not found',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
        case 409:
          throw ExceptionHandler(
            error: 'Conflict',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
        case 422:
          throw ExceptionHandler(
            error: 'Invalid data',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
        case 500:
          throw ExceptionHandler(
            error: 'Server error',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
        case 504:
          throw ExceptionHandler(
            error: 'Server not responding',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
        default:
          throw ExceptionHandler(
            error: 'Ops, there was an error',
            errorModel: e.response?.data != null
                ? ErrorModel.fromJson(e.response!.data)
                : null,
          );
      }
    default:
      throw ExceptionHandler(
        error: 'Ops, there was an error',
      );
  }
}
