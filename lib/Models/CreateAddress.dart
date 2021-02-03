import 'dart:convert';

class CreateAddress {
  CreateAddress({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory CreateAddress.fromRawJson(String str) => CreateAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateAddress.fromJson(Map<String, dynamic> json) => CreateAddress(
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
    this.idAddress,
  });

  String idAddress;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idAddress: json["id_address"],
  );

  Map<String, dynamic> toJson() => {
    "id_address": idAddress,
  };
}
