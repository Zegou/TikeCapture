// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.phone,
    this.countryId,
  });

  String phone;
  String countryId;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    phone: json["phone"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "country_id": countryId,
  };
}
