// To parse this JSON data, do
//
//     final getStylists = getStylistsFromJson(jsonString);

import 'dart:convert';

class GetStylists {
  GetStylists({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory GetStylists.fromRawJson(String str) => GetStylists.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetStylists.fromJson(Map<String, dynamic> json) => GetStylists(
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
    this.stylistData,
  });

  List<StylistDatum> stylistData;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    stylistData: List<StylistDatum>.from(json["stylistData"].map((x) => StylistDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stylistData": List<dynamic>.from(stylistData.map((x) => x.toJson())),
  };
}

class StylistDatum {
  StylistDatum({
    this.idStylist,
    this.fullName,
    this.shortName,
    this.profileImage,
    this.speciality,
    this.joiningDate,
    this.mobileNumber,
    this.status,
    this.dateAdd,
  });

  String idStylist;
  String fullName;
  String shortName;
  String profileImage;
  String speciality;
  DateTime joiningDate;
  String mobileNumber;
  String status;
  DateTime dateAdd;

  factory StylistDatum.fromRawJson(String str) => StylistDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StylistDatum.fromJson(Map<String, dynamic> json) => StylistDatum(
    idStylist: json["id_stylist"],
    fullName: json["fullName"],
    shortName: json["shortName"],
    profileImage: json["profile_image"],
    speciality: json["speciality"],
    joiningDate: DateTime.parse(json["joining_date"]),
    mobileNumber: json["mobileNumber"],
    status: json["status"],
    dateAdd: DateTime.parse(json["date_add"]),
  );

  Map<String, dynamic> toJson() => {
    "id_stylist": idStylist,
    "fullName": fullName,
    "shortName": shortName,
    "profile_image": profileImage,
    "speciality": speciality,
    "joining_date": "${joiningDate.year.toString().padLeft(4, '0')}-${joiningDate.month.toString().padLeft(2, '0')}-${joiningDate.day.toString().padLeft(2, '0')}",
    "mobileNumber": mobileNumber,
    "status": status,
    "date_add": dateAdd.toIso8601String(),
  };
}
