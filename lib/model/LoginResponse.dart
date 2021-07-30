// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    this.id,
    this.result,
    this.moduleName,
  });

  String id;
  ResponseLoginResult result;
  String moduleName;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
    id: json["\u0024id"],
    result: ResponseLoginResult.fromJson(json["result"]),
    moduleName: json["moduleName"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "result": result.toJson(),
    "moduleName": moduleName,
  };
}

class ResponseLoginResult {


  ResponseLoginResult({
    this.id,
    this.isOkay,
    this.message,
    this.result,
  });

  String id;
  bool isOkay;
  String message;
  ResultResult result;

  factory ResponseLoginResult.fromJson(Map<String, dynamic> json) => ResponseLoginResult(
    id: json["\u0024id"],
    isOkay: json["isOkay"],
    message: json["message"],
    result: ResultResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "isOkay": isOkay,
    "message": message,
    "result": result.toJson(),
  };
}

class ResultResult {
  ResultResult({
    this.id,
    this.currentUser,
    this.isRenewalPasswordRequest,
  });

  String id;
  dynamic currentUser;
  bool isRenewalPasswordRequest;

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
    id: json["\u0024id"],
    currentUser: json["currentUser"],
    isRenewalPasswordRequest: json["isRenewalPasswordRequest"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "currentUser": currentUser,
    "isRenewalPasswordRequest": isRenewalPasswordRequest,
  };
}
