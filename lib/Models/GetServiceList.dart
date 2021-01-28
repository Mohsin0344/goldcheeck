import 'dart:convert';

GetServiceList getServiceListFromJson(String str) => GetServiceList.fromJson(json.decode(str));

String getServiceListToJson(GetServiceList data) => json.encode(data.toJson());

class GetServiceList {
  GetServiceList({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory GetServiceList.fromJson(Map<String, dynamic> json) => GetServiceList(
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
  });

  String idServices;
  String charges;
  String timeConsuming;
  String title;
  String shortDescription;
  String fullDescription;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idServices: json["id_services"],
    charges: json["charges"],
    timeConsuming: json["timeConsuming"],
    title: json["title"],
    shortDescription: json["shortDescription"],
    fullDescription: json["fullDescription"],
  );

  Map<String, dynamic> toJson() => {
    "id_services": idServices,
    "charges": charges,
    "timeConsuming": timeConsuming,
    "title": title,
    "shortDescription": shortDescription,
    "fullDescription": fullDescription,
  };
}