class OpnameCode {
  String? stockopnameOid;
  String? stockopnameCode;
  String? stockopnameDate;
  String? stockopnameStatus;

  OpnameCode(
      {this.stockopnameOid,
      this.stockopnameCode,
      this.stockopnameDate,
      this.stockopnameStatus});

  factory OpnameCode.fromJson(Map<String, dynamic> json) {
    return OpnameCode(
      stockopnameOid: json['stockopname_oid'] ?? '',
      stockopnameCode: json['stockopname_code'] ?? '',
      stockopnameDate: json['stockopname_date'] ?? '',
      stockopnameStatus: json['stockopname_status'] ?? '',
    );
  }

  get length => null;
}
