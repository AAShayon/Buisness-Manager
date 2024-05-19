import 'dart:convert';
/// amount : "2000"
/// transaction_date : "2024-04-30 17:06:08"
/// details : "update"
/// bill_no : "update"

TransactionUpdateRequestModel transactionUpdateRequestModelFromJson(String str) => TransactionUpdateRequestModel.fromJson(json.decode(str));
String transactionUpdateRequestModelToJson(TransactionUpdateRequestModel data) => json.encode(data.toJson());
class TransactionUpdateRequestModel {
  TransactionUpdateRequestModel({
      String? amount, 
      String? transactionDate, 
      String? details, 
      String? billNo,}){
    _amount = amount;
    _transactionDate = transactionDate;
    _details = details;
    _billNo = billNo;
}

  TransactionUpdateRequestModel.fromJson(dynamic json) {
    _amount = json['amount'];
    _transactionDate = json['transaction_date'];
    _details = json['details'];
    _billNo = json['bill_no'];
  }
  String? _amount;
  String? _transactionDate;
  String? _details;
  String? _billNo;
TransactionUpdateRequestModel copyWith({  String? amount,
  String? transactionDate,
  String? details,
  String? billNo,
}) => TransactionUpdateRequestModel(  amount: amount ?? _amount,
  transactionDate: transactionDate ?? _transactionDate,
  details: details ?? _details,
  billNo: billNo ?? _billNo,
);
  String? get amount => _amount;
  String? get transactionDate => _transactionDate;
  String? get details => _details;
  String? get billNo => _billNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['transaction_date'] = _transactionDate;
    map['details'] = _details;
    map['bill_no'] = _billNo;
    return map;
  }

}