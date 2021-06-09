// To parse this JSON data, do
//
//     final discountServices = discountServicesFromJson(jsonString);

import 'dart:convert';

class DiscountServices {
  DiscountServices({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory DiscountServices.fromRawJson(String str) => DiscountServices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscountServices.fromJson(Map<String, dynamic> json) => DiscountServices(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idServices,
    this.charges,
    this.timeConsuming,
    this.title,
    this.shortDescription,
    this.fullDescription,
    this.discountPercentage,
  });

  String idServices;
  String charges;
  String timeConsuming;
  String title;
  String shortDescription;
  String fullDescription;
  String discountPercentage;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idServices: json["id_services"],
    charges: json["charges"],
    timeConsuming: json["timeConsuming"],
    title: json["title"],
    shortDescription: json["shortDescription"],
    fullDescription: json["fullDescription"],
    discountPercentage: json["discountPercentage"],
  );

  Map<String, dynamic> toJson() => {
    "id_services": idServices,
    "charges": charges,
    "timeConsuming": timeConsuming,
    "title": title,
    "shortDescription": shortDescription,
    "fullDescription": fullDescription,
    "discountPercentage": discountPercentage,
  };
}
