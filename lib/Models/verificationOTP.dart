import 'dart:convert';

VerificationOtp verificationOtpFromJson(String str) => VerificationOtp.fromJson(json.decode(str));

String verificationOtpToJson(VerificationOtp data) => json.encode(data.toJson());

class VerificationOtp {
  VerificationOtp({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory VerificationOtp.fromJson(Map<String, dynamic> json) => VerificationOtp(
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
    this.mobileNumber,
  });

  String mobileNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mobileNumber: json["mobileNumber"],
  );

  Map<String, dynamic> toJson() => {
    "mobileNumber": mobileNumber,
  };
}