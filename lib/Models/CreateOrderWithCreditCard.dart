import 'dart:convert';

class CreateOrderWithCreditCard {
  CreateOrderWithCreditCard({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory CreateOrderWithCreditCard.fromRawJson(String str) => CreateOrderWithCreditCard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateOrderWithCreditCard.fromJson(Map<String, dynamic> json) => CreateOrderWithCreditCard(
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
