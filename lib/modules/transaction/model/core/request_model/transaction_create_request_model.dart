import 'dart:convert';
/// customer_id : "39"
/// amount : "1500"
/// type : "1"
/// transaction_date : "2024-04-29 17:06:08"
/// details : "getting this amount"
/// bill_no : "12312"

TransactionCreateRequestModel transactionCreateRequestModelFromJson(String str) => TransactionCreateRequestModel.fromJson(json.decode(str));
String transactionCreateRequestModelToJson(TransactionCreateRequestModel data) => json.encode(data.toJson());
class TransactionCreateRequestModel {
  TransactionCreateRequestModel({
      dynamic customerId, 
      dynamic amount, 
      dynamic type, 
      dynamic transactionDate, 
      dynamic details, 
      dynamic billNo,}){
    _customerId = customerId;
    _amount = amount;
    _type = type;
    _transactionDate = transactionDate;
    _details = details;
    _billNo = billNo;
}

  TransactionCreateRequestModel.fromJson(dynamic json) {
    _customerId = json['customer_id'];
    _amount = json['amount'];
    _type = json['type'];
    _transactionDate = json['transaction_date'];
    _details = json['details'];
    _billNo = json['bill_no'];
  }
  dynamic _customerId;
  dynamic _amount;
  dynamic _type;
  dynamic _transactionDate;
  dynamic _details;
  dynamic _billNo;
TransactionCreateRequestModel copyWith({  dynamic customerId,
  dynamic amount,
  dynamic type,
  dynamic transactionDate,
  dynamic details,
  dynamic billNo,
}) => TransactionCreateRequestModel(  customerId: customerId ?? _customerId,
  amount: amount ?? _amount,
  type: type ?? _type,
  transactionDate: transactionDate ?? _transactionDate,
  details: details ?? _details,
  billNo: billNo ?? _billNo,
);
  dynamic get customerId => _customerId;
  dynamic get amount => _amount;
  dynamic get type => _type;
  dynamic get transactionDate => _transactionDate;
  dynamic get details => _details;
  dynamic get billNo => _billNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = _customerId;
    map['amount'] = _amount;
    map['type'] = _type;
    map['transaction_date'] = _transactionDate;
    map['details'] = _details;
    map['bill_no'] = _billNo;
    return map;
  }

}