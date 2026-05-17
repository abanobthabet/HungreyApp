import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/api/api_consumer.dart';
import 'package:hungry_app/core/api/endpoint.dart';
import 'package:hungry_app/core/error/exption.dart';
import 'package:hungry_app/models/signup_model.dart';
import 'package:image_picker/image_picker.dart';

class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  //signup
  Future<Either<String, UserModel>> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required XFile image,
  }) async {
    try {
      Map<String, dynamic> response = await api.post<Map<String, dynamic>>(
        Endpoint.register,
        formdata: true,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.phone: phone,
          ApiKey.password: password,
          ApiKey.image: await MultipartFile.fromFile(
            image!.path,
            filename: image!.name,
          ),
        },
      );

      final user = UserModel.fromJson(response);
      return right(user);
    } on ExceptionHandler catch (e) {
      return left(e.error ?? 'An error occurred');
    }
  }

  //login
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> response = await api.post<Map<String, dynamic>>(
        Endpoint.logiIn,
        data: {ApiKey.email: email, ApiKey.password: password},
      );

      final user = UserModel.fromJson(response);
      return right(user);
    } on ExceptionHandler catch (e) {
      return left(e.error ?? 'An error occurred');
    }
  }
}
