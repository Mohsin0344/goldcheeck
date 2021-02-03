import 'dart:convert';

class CashOnDelivery {
  CashOnDelivery({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory CashOnDelivery.fromRawJson(String str) => CashOnDelivery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CashOnDelivery.fromJson(Map<String, dynamic> json) => CashOnDelivery(
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
    this.idOrder,
  });

  String idOrder;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idOrder: json["id_order"],
  );

  Map<String, dynamic> toJson() => {
    "id_order": idOrder,
  };
}
