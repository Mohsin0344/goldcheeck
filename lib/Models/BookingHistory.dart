// To parse this JSON data, do
//
//     final bookingHistory = bookingHistoryFromJson(jsonString);

import 'dart:convert';

class BookingHistory {
  BookingHistory({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory BookingHistory.fromRawJson(String str) => BookingHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
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
