// To parse this JSON data, do
//
//     final removeProduct = removeProductFromJson(jsonString);

import 'dart:convert';

class RemoveProduct {
  RemoveProduct({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory RemoveProduct.fromRawJson(String str) => RemoveProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RemoveProduct.fromJson(Map<String, dynamic> json) => RemoveProduct(
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
  Data();

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}
