// To parse this JSON data, do
//
//     final addCreditFromCreditCard = addCreditFromCreditCardFromJson(jsonString);

import 'dart:convert';

class AddCreditFromCreditCard {
  AddCreditFromCreditCard({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory AddCreditFromCreditCard.fromRawJson(String str) => AddCreditFromCreditCard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddCreditFromCreditCard.fromJson(Map<String, dynamic> json) => AddCreditFromCreditCard(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.transactionId,
  });

  String transactionId;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    transactionId: json["transactionId"],
  );

  Map<String, dynamic> toJson() => {
    "transactionId": transactionId,
  };
}
