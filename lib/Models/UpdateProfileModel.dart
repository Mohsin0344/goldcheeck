// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

class UpdateProfile {
  UpdateProfile({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory UpdateProfile.fromRawJson(String str) => UpdateProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
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
    this.profilePhoto,
    this.id,
  });

  String profilePhoto;
  String id;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profilePhoto: json["profilePhoto"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "profilePhoto": profilePhoto,
    "id": id,
  };
}
