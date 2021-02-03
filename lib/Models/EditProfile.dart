import 'dart:convert';

class EditProfile {
  EditProfile({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory EditProfile.fromRawJson(String str) => EditProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
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
