// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {

  LoginModel({
    this.isRenewalPasswordRequest,
    this.currentUser,
  });

  String isRenewalPasswordRequest;
  CurrentUser currentUser;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    isRenewalPasswordRequest: json["IsRenewalPasswordRequest"],
    currentUser: CurrentUser.fromJson(json["CurrentUser"]),
  );

  Map<String, dynamic> toJson() => {
    "IsRenewalPasswordRequest": isRenewalPasswordRequest,
    "CurrentUser": currentUser.toJson(),
  };
}

class CurrentUser {
  CurrentUser({
    this.passWord,
    this.userName,
    this.accountName,
  });

  String passWord;
  String userName;
  String accountName;

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
    passWord: json["PassWord"],
    userName: json["UserName"],
    accountName: json["AccountName"],
  );

  Map<String, dynamic> toJson() => {
    "PassWord": passWord,
    "UserName": userName,
    "AccountName": accountName,
  };
}
