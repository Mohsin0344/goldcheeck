import 'dart:convert';

CreateUserWithMobile createUserWithMobileFromJson(String str) => CreateUserWithMobile.fromJson(json.decode(str));

String createUserWithMobileToJson(CreateUserWithMobile data) => json.encode(data.toJson());

class CreateUserWithMobile {
  CreateUserWithMobile({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory CreateUserWithMobile.fromJson(Map<String, dynamic> json) => CreateUserWithMobile(
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
    this.accessToken,
    this.otp,
  });

  String accessToken;
  String otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "otp": otp,
  };
}