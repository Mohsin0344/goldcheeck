import 'dart:convert';

class GetCartDetails {
  GetCartDetails({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory GetCartDetails.fromRawJson(String str) => GetCartDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCartDetails.fromJson(Map<String, dynamic> json) => GetCartDetails(
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
    this.idCart,
    this.dateAdd,
    this.cartProducts,
  });

  String idCart;
  DateTime dateAdd;
  List<CartProduct> cartProducts;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idCart: json["id_cart"],
    dateAdd: DateTime.parse(json["date_add"]),
    cartProducts: List<CartProduct>.from(json["cartProducts"].map((x) => CartProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_cart": idCart,
    "date_add": dateAdd.toIso8601String(),
    "cartProducts": List<dynamic>.from(cartProducts.map((x) => x.toJson())),
  };
}

class CartProduct {
  CartProduct({
    this.idProduct,
    this.name,
    this.price,
    this.descriptionShort,
    this.quantity,
    this.photoId,
    this.photoUrl,
  });

  String idProduct;
  String name;
  double price;
  String descriptionShort;
  int quantity;
  String photoId;
  String photoUrl;

  factory CartProduct.fromRawJson(String str) => CartProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    idProduct: json["id_product"],
    name: json["name"],
    price: json["price"].toDouble(),
    descriptionShort: json["description_short"],
    quantity: json["quantity"],
    photoId: json["photo_id"],
    photoUrl: json["photoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id_product": idProduct,
    "name": name,
    "price": price,
    "description_short": descriptionShort,
    "quantity": quantity,
    "photo_id": photoId,
    "photoUrl": photoUrl,
  };
}
