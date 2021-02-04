// To parse this JSON data, do
//
//     final bookingHistory = bookingHistoryFromJson(jsonString);

import 'dart:convert';

class BookingHistory {
  BookingHistory({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory BookingHistory.fromRawJson(String str) => BookingHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
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
    this.bookings,
  });

  List<Booking> bookings;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class Booking {
  Booking({
    this.idBookings,
    this.bookingDate,
    this.bookingTime,
    this.note,
    this.status,
    this.services,
  });

  String idBookings;
  DateTime bookingDate;
  String bookingTime;
  String note;
  String status;
  List<Service> services;

  factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    idBookings: json["id_bookings"],
    bookingDate: DateTime.parse(json["bookingDate"]),
    bookingTime: json["bookingTime"],
    note: json["note"],
    status: json["status"],
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_bookings": idBookings,
    "bookingDate": "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
    "bookingTime": bookingTime,
    "note": note,
    "status": status,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  Service({
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

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
