import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Transaction Created Successfully"
/// transaction : {"id":12,"transaction_no":1012,"type":"1","amount":"1500","transaction_date":"2024-04-29 17:06:08"}

TransactionCreateResponseModel transactionCreateResponseModelFromJson(String str) => TransactionCreateResponseModel.fromJson(json.decode(str));
String transactionCreateResponseModelToJson(TransactionCreateResponseModel data) => json.encode(data.toJson());
class TransactionCreateResponseModel {
  TransactionCreateResponseModel({
      dynamic status, 
      dynamic msg, 
      dynamic description, 
      Transaction? transaction,}){
    _status = status;
    _msg = msg;
    _description = description;
    _transaction = transaction;
}

  TransactionCreateResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _transaction = json['transaction'] != null ? Transaction.fromJson(json['transaction']) : null;
  }
  dynamic _status;
  dynamic _msg;
  dynamic _description;
  Transaction? _transaction;
TransactionCreateResponseModel copyWith({  dynamic status,
  dynamic msg,
  dynamic description,
  Transaction? transaction,
}) => TransactionCreateResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  transaction: transaction ?? _transaction,
);
  dynamic get status => _status;
  dynamic get msg => _msg;
  dynamic get description => _description;
  Transaction? get transaction => _transaction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_transaction != null) {
      map['transaction'] = _transaction?.toJson();
    }
    return map;
  }

}

/// id : 12
/// transaction_no : 1012
/// type : "1"
/// amount : "1500"
/// transaction_date : "2024-04-29 17:06:08"

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));
String transactionToJson(Transaction data) => json.encode(data.toJson());
class Transaction {
  Transaction({
      dynamic id, 
      dynamic transactionNo, 
      dynamic type, 
      dynamic amount, 
      dynamic transactionDate,}){
    _id = id;
    _transactionNo = transactionNo;
    _type = type;
    _amount = amount;
    _transactionDate = transactionDate;
}

  Transaction.fromJson(dynamic json) {
    _id = json['id'];
    _transactionNo = json['transaction_no'];
    _type = json['type'];
    _amount = json['amount'];
    _transactionDate = json['transaction_date'];
  }
  dynamic _id;
  dynamic _transactionNo;
  dynamic _type;
  dynamic _amount;
  dynamic _transactionDate;
Transaction copyWith({  dynamic id,
  dynamic transactionNo,
  dynamic type,
  dynamic amount,
  dynamic transactionDate,
}) => Transaction(  id: id ?? _id,
  transactionNo: transactionNo ?? _transactionNo,
  type: type ?? _type,
  amount: amount ?? _amount,
  transactionDate: transactionDate ?? _transactionDate,
);
  dynamic get id => _id;
  dynamic get transactionNo => _transactionNo;
  dynamic get type => _type;
  dynamic get amount => _amount;
  dynamic get transactionDate => _transactionDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['transaction_no'] = _transactionNo;
    map['type'] = _type;
    map['amount'] = _amount;
    map['transaction_date'] = _transactionDate;
    return map;
  }

}