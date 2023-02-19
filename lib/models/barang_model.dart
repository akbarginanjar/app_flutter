class Barang {
  String? stockopnamedOid;
  String? stockopnamedStockopnameOid;
  int? stockopnamedPtId;
  String? designName;
  String? colorCode;
  String? umCode;
  String? stockopnamedBarcode;
  int? stockopnamedQty;
  int? stockopnamedQtyOpname;
  String? stockopnamedInvStatus;
  String? stockopnamedStatus;
  String? stockopnamedUpdBy;

  Barang(
      {this.stockopnamedOid,
      this.stockopnamedStockopnameOid,
      this.stockopnamedPtId,
      this.designName,
      this.colorCode,
      this.umCode,
      this.stockopnamedBarcode,
      this.stockopnamedQty,
      this.stockopnamedQtyOpname,
      this.stockopnamedInvStatus,
      this.stockopnamedStatus,
      this.stockopnamedUpdBy});

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      stockopnamedOid: json['stockopnamed_oid'] ?? '',
      stockopnamedStockopnameOid: json['stockopnamed_stockopname_oid'] ?? '',
      stockopnamedPtId: json['stockopnamed_pt_id'] ?? 0,
      designName: json['design_name'] ?? '',
      colorCode: json['color_code'] ?? '',
      umCode: json['um_code'] ?? '',
      stockopnamedBarcode: json['stockopnamed_barcode'] ?? '',
      stockopnamedQty: json['stockopnamed_qty'] ?? 0,
      stockopnamedQtyOpname: json['stockopnamed_qty_opname'] ?? 0,
      stockopnamedInvStatus: json['stockopnamed_inv_status'] ?? '',
      stockopnamedStatus: json['stockopnamed_status'] ?? '',
      stockopnamedUpdBy: json['stockopnamed_upd_by'] ?? '',
    );
  }
}
