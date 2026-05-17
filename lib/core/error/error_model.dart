import 'package:hungry_app/core/api/endpoint.dart';

class ErrorModel {
  final int? statusCode;
  final String message;

  ErrorModel({this.statusCode, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json[ApiKey.statusCode],
      message: json[ApiKey.errormessage],
    );
  }
}
