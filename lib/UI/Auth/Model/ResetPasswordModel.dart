// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  bool success;
  String message;
  int statusCode;
  Data data;

  ResetPasswordModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    success: json["success"],
    message: json["message"],
    statusCode: json["statusCode"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "statusCode": statusCode,
    "data": data.toJson(),
  };
}

class Data {
  dynamic password;
  dynamic confirmPassword;
  String token;
  dynamic email;

  Data({
    required this.password,
    required this.confirmPassword,
    required this.token,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    password: json["password"],
    confirmPassword: json["confirmPassword"],
    token: json["token"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "confirmPassword": confirmPassword,
    "token": token,
    "email": email,
  };
}
