// To parse this JSON data, do
//
//     final resultResult = resultResultFromJson(jsonString);

import 'dart:convert';

ResultResult resultResultFromJson(String str) => ResultResult.fromJson(json.decode(str));

String resultResultToJson(ResultResult data) => json.encode(data.toJson());

class ResultResult {
  ResultResult({
    this.api3G,
  });

  Api3G api3G;

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
    api3G: Api3G.fromJson(json["API3G"]),
  );

  Map<String, dynamic> toJson() => {
    "API3G": api3G.toJson(),
  };
}

class Api3G {
  Api3G({
    this.request,
    this.companyToken,
    this.transactionToken,
  });

  String request;
  String companyToken;
  String transactionToken;

  factory Api3G.fromJson(Map<String, dynamic> json) => Api3G(
    request: json["Request"],
    companyToken: json["CompanyToken"],
    transactionToken: json["TransactionToken"],
  );

  Map<String, dynamic> toJson() => {
    "Request": request,
    "CompanyToken": companyToken,
    "TransactionToken": transactionToken,
  };
}
