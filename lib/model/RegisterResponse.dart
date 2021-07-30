// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.id,
    this.isOkay,
    this.message,
    this.result,
  });

  String id;
  bool isOkay;
  String message;
  Result result;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    id: json["\u0024id"],
    isOkay: json["isOkay"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "isOkay": isOkay,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.id,
    this.resultId,
    this.memberNo,
    this.firstName,
    this.lastName,
    this.otherNames,
    this.email,
    this.regDate,
    this.dob,
    this.phone,
    this.genderTypeId,
    this.natId,
    this.membershipTypeId,
    this.approvalStatus,
    this.countryId,
    this.cityId,
    this.datecomparer,
    this.subAccountId,
    this.status,
    this.syncDatetime,
    this.profileImagePath,
    this.systemUserId,
    this.country,
    this.gender,
    this.memberCards,
    this.subAccounts,
    this.membershipTypes,
    this.user,
    this.tickets,
  });

  String id;
  int resultId;
  dynamic memberNo;
  dynamic firstName;
  dynamic lastName;
  dynamic otherNames;
  dynamic email;
  DateTime regDate;
  dynamic dob;
  String phone;
  dynamic genderTypeId;
  dynamic natId;
  dynamic membershipTypeId;
  bool approvalStatus;
  int countryId;
  dynamic cityId;
  double datecomparer;
  dynamic subAccountId;
  bool status;
  DateTime syncDatetime;
  dynamic profileImagePath;
  dynamic systemUserId;
  dynamic country;
  dynamic gender;
  List<dynamic> memberCards;
  dynamic subAccounts;
  dynamic membershipTypes;
  dynamic user;
  List<dynamic> tickets;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["\u0024id"],
    resultId: json["id"],
    memberNo: json["member_no"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    otherNames: json["other_names"],
    email: json["email"],
    regDate: DateTime.parse(json["reg_date"]),
    dob: json["dob"],
    phone: json["phone"],
    genderTypeId: json["gender_type_id"],
    natId: json["nat_id"],
    membershipTypeId: json["membership_type_id"],
    approvalStatus: json["approval_status"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    datecomparer: json["datecomparer"].toDouble(),
    subAccountId: json["sub_account_id"],
    status: json["status"],
    syncDatetime: DateTime.parse(json["sync_datetime"]),
    profileImagePath: json["profile_image_path"],
    systemUserId: json["system_user_id"],
    country: json["country"],
    gender: json["gender"],
    memberCards: List<dynamic>.from(json["member_cards"].map((x) => x)),
    subAccounts: json["sub_accounts"],
    membershipTypes: json["membership_types"],
    user: json["user"],
    tickets: List<dynamic>.from(json["tickets"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "id": resultId,
    "member_no": memberNo,
    "first_name": firstName,
    "last_name": lastName,
    "other_names": otherNames,
    "email": email,
    "reg_date": regDate.toIso8601String(),
    "dob": dob,
    "phone": phone,
    "gender_type_id": genderTypeId,
    "nat_id": natId,
    "membership_type_id": membershipTypeId,
    "approval_status": approvalStatus,
    "country_id": countryId,
    "city_id": cityId,
    "datecomparer": datecomparer,
    "sub_account_id": subAccountId,
    "status": status,
    "sync_datetime": syncDatetime.toIso8601String(),
    "profile_image_path": profileImagePath,
    "system_user_id": systemUserId,
    "country": country,
    "gender": gender,
    "member_cards": List<dynamic>.from(memberCards.map((x) => x)),
    "sub_accounts": subAccounts,
    "membership_types": membershipTypes,
    "user": user,
    "tickets": List<dynamic>.from(tickets.map((x) => x)),
  };
}
