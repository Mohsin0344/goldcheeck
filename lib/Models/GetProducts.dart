import 'dart:convert';

GetProducts getProductsFromJson(String str) => GetProducts.fromJson(json.decode(str));

String getProductsToJson(GetProducts data) => json.encode(data.toJson());

class GetProducts {
  GetProducts({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
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
    this.totalProducts,
    this.list,
  });

  String totalProducts;
  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalProducts: json["totalProducts"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalProducts": totalProducts,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.idProduct,
    this.name,
    this.descriptionShort,
    this.price,
    this.active,
    this.photoId,
    this.idCategoryDefault,
    this.photoUrl,
  });

  int idProduct;
  String name;
  String descriptionShort;
  int price;
  int active;
  String photoId;
  String idCategoryDefault;
  String photoUrl;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    idProduct: json["id_product"],
    name: json["name"],
    descriptionShort: json["description_short"],
    price: json["price"],
    active: json["active"],
    photoId: json["photo_id"],
    idCategoryDefault: json["id_category_default"],
    photoUrl: json["photoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id_product": idProduct,
    "name": name,
    "description_short": descriptionShort,
    "price": price,
    "active": active,
    "photo_id": photoId,
    "id_category_default": idCategoryDefault,
    "photoUrl": photoUrl,
  };
}