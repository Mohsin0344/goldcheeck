import 'dart:convert';

class GetAddressList {
  GetAddressList({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory GetAddressList.fromRawJson(String str) => GetAddressList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAddressList.fromJson(Map<String, dynamic> json) => GetAddressList(
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
    this.idAddress,
    this.idCountry,
    this.idState,
    this.idCustomer,
    this.idManufacturer,
    this.idSupplier,
    this.idWarehouse,
    this.alias,
    this.company,
    this.lastname,
    this.firstname,
    this.address1,
    this.address2,
    this.postcode,
    this.city,
    this.other,
    this.phone,
    this.phoneMobile,
    this.vatNumber,
    this.dni,
    this.dateAdd,
    this.dateUpd,
    this.active,
    this.deleted,
  });

  String idAddress;
  String idCountry;
  dynamic idState;
  String idCustomer;
  String idManufacturer;
  String idSupplier;
  String idWarehouse;
  String alias;
  dynamic company;
  String lastname;
  String firstname;
  String address1;
  dynamic address2;
  String postcode;
  String city;
  dynamic other;
  dynamic phone;
  dynamic phoneMobile;
  dynamic vatNumber;
  dynamic dni;
  DateTime dateAdd;
  String dateUpd;
  String active;
  String deleted;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idAddress: json["id_address"],
    idCountry: json["id_country"],
    idState: json["id_state"],
    idCustomer: json["id_customer"],
    idManufacturer: json["id_manufacturer"],
    idSupplier: json["id_supplier"],
    idWarehouse: json["id_warehouse"],
    alias: json["alias"],
    company: json["company"],
    lastname: json["lastname"],
    firstname: json["firstname"],
    address1: json["address1"],
    address2: json["address2"],
    postcode: json["postcode"],
    city: json["city"],
    other: json["other"],
    phone: json["phone"],
    phoneMobile: json["phone_mobile"],
    vatNumber: json["vat_number"],
    dni: json["dni"],
    dateAdd: DateTime.parse(json["date_add"]),
    dateUpd: json["date_upd"],
    active: json["active"],
    deleted: json["deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id_address": idAddress,
    "id_country": idCountry,
    "id_state": idState,
    "id_customer": idCustomer,
    "id_manufacturer": idManufacturer,
    "id_supplier": idSupplier,
    "id_warehouse": idWarehouse,
    "alias": alias,
    "company": company,
    "lastname": lastname,
    "firstname": firstname,
    "address1": address1,
    "address2": address2,
    "postcode": postcode,
    "city": city,
    "other": other,
    "phone": phone,
    "phone_mobile": phoneMobile,
    "vat_number": vatNumber,
    "dni": dni,
    "date_add": dateAdd.toIso8601String(),
    "date_upd": dateUpd,
    "active": active,
    "deleted": deleted,
  };
}
