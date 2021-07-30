// To parse this JSON data, do
//
//     final eventListResponse = eventListResponseFromJson(jsonString);

import 'dart:convert';

EventListResponse eventListResponseFromJson(String str) => EventListResponse.fromJson(json.decode(str));

String eventListResponseToJson(EventListResponse data) => json.encode(data.toJson());

class EventListResponse {
  EventListResponse({
    this.id,
    this.isOkay,
    this.message,
    this.result,
  });

  String id;
  bool isOkay;
  String message;
  List<Result> result;

  factory EventListResponse.fromJson(Map<String, dynamic> json) => EventListResponse(
    id: json["\u0024id"],
    isOkay: json["isOkay"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "isOkay": isOkay,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.resultId,
    this.eventName,
    this.subAccountId,
    this.fromDate,
    this.toDate,
    this.totalSeats,
    this.eventTypeId,
    this.locationId,
    this.eventSubCategoryId,
    this.createdAt,
    this.updatedAt,
    this.subCategoryName,
    this.description,
    this.ticketsUrl,
    this.locationName,
    this.datecomparer,
    this.seatRanges,
    this.seatranges,
  });

  String id;
  int resultId;
  String eventName;
  int subAccountId;
  DateTime fromDate;
  DateTime toDate;
  int totalSeats;
  int eventTypeId;
  int locationId;
  int eventSubCategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  String subCategoryName;
  dynamic description;
  dynamic ticketsUrl;
  dynamic locationName;
  int datecomparer;
  List<SeatRange> seatRanges;
  dynamic seatranges;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["\u0024id"],
    resultId: json["id"],
    eventName: json["event_name"],
    subAccountId: json["sub_account_id"],
    fromDate: DateTime.parse(json["from_date"]),
    toDate: DateTime.parse(json["to_date"]),
    totalSeats: json["total_seats"],
    eventTypeId: json["event_type_id"],
    locationId: json["location_id"],
    eventSubCategoryId: json["event_sub_category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    subCategoryName: json["sub_category_name"],
    description: json["description"],
    ticketsUrl: json["tickets_url"],
    locationName: json["location_name"],
    datecomparer: json["datecomparer"],
    seatRanges: List<SeatRange>.from(json["seat_ranges"].map((x) => SeatRange.fromJson(x))),
    seatranges: json["seatranges"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "id": resultId,
    "event_name": eventName,
    "sub_account_id": subAccountId,
    "from_date": fromDate.toIso8601String(),
    "to_date": toDate.toIso8601String(),
    "total_seats": totalSeats,
    "event_type_id": eventTypeId,
    "location_id": locationId,
    "event_sub_category_id": eventSubCategoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "sub_category_name": subCategoryName,
    "description": description,
    "tickets_url": ticketsUrl,
    "location_name": locationName,
    "datecomparer": datecomparer,
    "seat_ranges": List<dynamic>.from(seatRanges.map((x) => x.toJson())),
    "seatranges": seatranges,
  };
}

class SeatRange {
  SeatRange({
    this.id,
    this.seatRangeId,
    this.rangeName,
    this.seatFrom,
    this.seatTo,
    this.eventId,
    this.amount,
  });

  String id;
  int seatRangeId;
  String rangeName;
  int seatFrom;
  int seatTo;
  int eventId;
  int amount;

  factory SeatRange.fromJson(Map<String, dynamic> json) => SeatRange(
    id: json["\u0024id"],
    seatRangeId: json["id"],
    rangeName: json["range_name"],
    seatFrom: json["seat_from"],
    seatTo: json["seat_to"],
    eventId: json["event_id"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "id": seatRangeId,
    "range_name": rangeName,
    "seat_from": seatFrom,
    "seat_to": seatTo,
    "event_id": eventId,
    "amount": amount,
  };
}
