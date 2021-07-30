// To parse this JSON data, do
//
//     final verificationCodeResponse = verificationCodeResponseFromJson(jsonString);

import 'dart:convert';

VerificationCodeResponse verificationCodeResponseFromJson(String str) => VerificationCodeResponse.fromJson(json.decode(str));

String verificationCodeResponseToJson(VerificationCodeResponse data) => json.encode(data.toJson());

class VerificationCodeResponse {
  VerificationCodeResponse({
    this.id,
    this.isOkay,
    this.message,
    this.result,
  });

  String id;
  bool isOkay;
  String message;
  dynamic result;

  factory VerificationCodeResponse.fromJson(Map<String, dynamic> json) => VerificationCodeResponse(
    id: json["\u0024id"],
    isOkay: json["isOkay"],
    message: json["message"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "isOkay": isOkay,
    "message": message,
    "result": result,
  };
}
