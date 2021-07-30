// To parse this JSON data, do
//
//     final paymentTransaction = paymentTransactionFromJson(jsonString);

import 'dart:convert';

PaymentTransaction paymentTransactionFromJson(String str) => PaymentTransaction.fromJson(json.decode(str));

String paymentTransactionToJson(PaymentTransaction data) => json.encode(data.toJson());

class PaymentTransaction {
  PaymentTransaction({
    this.api3GTransaction,
  });

  apiGTransaction api3GTransaction;

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) => PaymentTransaction(
    api3GTransaction: apiGTransaction.fromJson(json["API3G"]),
  );

  Map<String, dynamic> toJson() => {
    "API3G": api3GTransaction.toJson(),
  };
}

class apiGTransaction {
  apiGTransaction({
    this.companyToken,
    this.request,
    this.transaction,
    this.services,
  });

  String companyToken;
  String request;
  Transaction transaction;
  Services services;

  factory apiGTransaction.fromJson(Map<String, dynamic> json) => apiGTransaction(
    companyToken: json["CompanyToken"],
    request: json["Request"],
    transaction: Transaction.fromJson(json["Transaction"]),
    services: Services.fromJson(json["Services"]),
  );

  Map<String, dynamic> toJson() => {
    "CompanyToken": companyToken,
    "Request": request,
    "Transaction": transaction.toJson(),
    "Services": services.toJson(),
  };
}

class Services {
  Services({
    this.service,
  });

  Service service;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    service: Service.fromJson(json["Service"]),
  );

  Map<String, dynamic> toJson() => {
    "Service": service.toJson(),
  };
}

class Service {
  Service({
    this.serviceType,
    this.serviceDescription,
    this.serviceDate,
  });

  int serviceType;
  String serviceDescription;
  String serviceDate;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceType: json["ServiceType"],
    serviceDescription: json["ServiceDescription"],
    serviceDate: json["ServiceDate"],
  );

  Map<String, dynamic> toJson() => {
    "ServiceType": serviceType,
    "ServiceDescription": serviceDescription,
    "ServiceDate": serviceDate,
  };
}

class Transaction {
  Transaction({
    this.paymentAmount,
    this.paymentCurrency,
    this.companyRef,
    this.redirectUrl,
    this.backUrl,
    this.companyRefUnique,
    this.ptl,
  });

  int paymentAmount;
  String paymentCurrency;
  String companyRef;
  String redirectUrl;
  String backUrl;
  int companyRefUnique;
  int ptl;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    paymentAmount: json["PaymentAmount"],
    paymentCurrency: json["PaymentCurrency"],
    companyRef: json["CompanyRef"],
    redirectUrl: json["RedirectURL"],
    backUrl: json["BackURL"],
    companyRefUnique: json["CompanyRefUnique"],
    ptl: json["PTL"],
  );

  Map<String, dynamic> toJson() => {
    "PaymentAmount": paymentAmount,
    "PaymentCurrency": paymentCurrency,
    "CompanyRef": companyRef,
    "RedirectURL": redirectUrl,
    "BackURL": backUrl,
    "CompanyRefUnique": companyRefUnique,
    "PTL": ptl,
  };
}
