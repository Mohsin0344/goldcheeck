import 'dart:convert';

class LoginPresta {
  LoginPresta({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory LoginPresta.fromRawJson(String str) => LoginPresta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginPresta.fromJson(Map<String, dynamic> json) => LoginPresta(
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
    this.accessToken,
    this.mobileVerified,
    this.walletCredit,
    this.isVip,
    this.fullName,
    this.firstname,
    this.lastname,
    this.email,
    this.mobileNumber,
  });

  String accessToken;
  int mobileVerified;
  int walletCredit;
  int isVip;
  String fullName;
  String firstname;
  String lastname;
  String email;
  String mobileNumber;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    mobileVerified: json["mobileVerified"],
    walletCredit: json["wallet_credit"],
    isVip: json["is_vip"],
    fullName: json["fullName"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "mobileVerified": mobileVerified,
    "wallet_credit": walletCredit,
    "is_vip": isVip,
    "fullName": fullName,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "mobileNumber": mobileNumber,
  };
}
