import 'dart:convert';

class MyCredit {
  MyCredit({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory MyCredit.fromRawJson(String str) => MyCredit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyCredit.fromJson(Map<String, dynamic> json) => MyCredit(
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
    this.idTrans,
    this.idCustomer,
    this.txnDate,
    this.credit,
    this.debit,
    this.comments,
  });

  String idTrans;
  String idCustomer;
  DateTime txnDate;
  String credit;
  String debit;
  String comments;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idTrans: json["id_trans"],
    idCustomer: json["id_customer"],
    txnDate: DateTime.parse(json["txn_date"]),
    credit: json["credit"],
    debit: json["debit"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "id_trans": idTrans,
    "id_customer": idCustomer,
    "txn_date": txnDate.toIso8601String(),
    "credit": credit,
    "debit": debit,
    "comments": comments,
  };
}
