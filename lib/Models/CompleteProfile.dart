import 'dart:convert';

CompleteProfile completeProfileFromJson(String str) => CompleteProfile.fromJson(json.decode(str));

String completeProfileToJson(CompleteProfile data) => json.encode(data.toJson());

class CompleteProfile {
  CompleteProfile({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory CompleteProfile.fromJson(Map<String, dynamic> json) => CompleteProfile(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}