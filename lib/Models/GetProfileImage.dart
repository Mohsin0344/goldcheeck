import 'dart:convert';

class GetProfileImage {
  GetProfileImage({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  String data;

  factory GetProfileImage.fromRawJson(String str) => GetProfileImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetProfileImage.fromJson(Map<String, dynamic> json) => GetProfileImage(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}