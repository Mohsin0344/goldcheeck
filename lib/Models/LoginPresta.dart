import 'dart:convert';

LoginPresta loginPrestaFromJson(String str) => LoginPresta.fromJson(json.decode(str));

String loginPrestaToJson(LoginPresta data) => json.encode(data.toJson());

class LoginPresta {
  LoginPresta({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

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
  });

  String accessToken;
  int mobileVerified;
  int walletCredit;
  int isVip;
  String fullName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    mobileVerified: json["mobileVerified"],
    walletCredit: json["wallet_credit"],
    isVip: json["is_vip"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "mobileVerified": mobileVerified,
    "wallet_credit": walletCredit,
    "is_vip": isVip,
    "fullName": fullName,
  };
}
