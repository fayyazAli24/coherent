// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String accessToken;
  String mrNo;

  LoginModel({
    required this.accessToken,
    required this.mrNo,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["accessToken"] ?? "",
        mrNo: json["mrNo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "mrNo": mrNo,
      };
}
