// To parse this JSON data, do
//
//     final verificationCodeModel = verificationCodeModelFromJson(jsonString);

import 'dart:convert';

VerificationCodeModel verificationCodeModelFromJson(String str) => VerificationCodeModel.fromJson(json.decode(str));

String verificationCodeModelToJson(VerificationCodeModel data) => json.encode(data.toJson());

class VerificationCodeModel {
  VerificationCodeModel({
    this.userId,
    this.code,
  });

  int userId;
  String code;

  factory VerificationCodeModel.fromJson(Map<String, dynamic> json) => VerificationCodeModel(
    userId: json["user_id"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "code": code,
  };
}
