// To parse this JSON data, do
//
//     final bookingCreate = bookingCreateFromJson(jsonString);

import 'dart:convert';

class BookingCreate {
  BookingCreate({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory BookingCreate.fromRawJson(String str) => BookingCreate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingCreate.fromJson(Map<String, dynamic> json) => BookingCreate(
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
    this.idCart,
  });

  String idCart;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idCart: json["id_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id_cart": idCart,
  };
}
