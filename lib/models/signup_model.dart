import 'package:hungry_app/core/api/endpoint.dart';

class UserModel {
  final String message;
  final Data data;
  UserModel({required this.data, required this.message});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json[ApiKey.message] ?? "",
      data: Data.fromJson(json[ApiKey.data] ?? {}),
    );
  }
}

class Data {
  final String? token;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;

  Data({this.token, this.name, this.email, this.phone, this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json[ApiKey.token],
      name: json[ApiKey.name],
      email: json[ApiKey.email],
      phone: json[ApiKey.phone],
      image: json[ApiKey.image],
    );
  }
}
