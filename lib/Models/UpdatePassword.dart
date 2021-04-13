import 'dart:convert';

class UpdatePassword {
  UpdatePassword({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory UpdatePassword.fromRawJson(String str) => UpdatePassword.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdatePassword.fromJson(Map<String, dynamic> json) => UpdatePassword(
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
