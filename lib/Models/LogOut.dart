// To parse this JSON data, do
//
//     final logOut = logOutFromJson(jsonString);

import 'dart:convert';

class LogOut {
  LogOut({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory LogOut.fromRawJson(String str) => LogOut.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LogOut.fromJson(Map<String, dynamic> json) => LogOut(
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
