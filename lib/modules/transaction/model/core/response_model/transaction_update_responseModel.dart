import 'dart:convert';

import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_information_response_model.dart';
/// status : 200
/// msg : "OK"
/// description : "Transaction Updated Successfully"
/// transaction : {"id":3,"transaction_no":"1003","type":1,"amount":"2000","transaction_date":"2024-04-30 17:06:08"}

TransactionUpdateResponseModel transactionUpdateResponseModelFromJson(String str) => TransactionUpdateResponseModel.fromJson(json.decode(str));
String transactionUpdateResponseModelToJson(TransactionUpdateResponseModel data) => json.encode(data.toJson());
class TransactionUpdateResponseModel {
  TransactionUpdateResponseModel({
     dynamic status, 
      dynamic msg, 
      dynamic description, 
      Transaction? transaction,}){
    _status = status;
    _msg = msg;
    _description = description;
    _transaction = transaction;
}

  TransactionUpdateResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _transaction = json['transaction'] != null ? Transaction.fromJson(json['transaction']) : null;
  }
 dynamic _status;
  dynamic _msg;
  dynamic _description;
  Transaction? _transaction;
TransactionUpdateResponseModel copyWith({ dynamic status,
  dynamic msg,
  dynamic description,
  Transaction? transaction,
}) => TransactionUpdateResponseModel(  status: status ?? _status,
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

/// id : 3
/// transaction_no : "1003"
/// type : 1
/// amount : "2000"
/// transaction_date : "2024-04-30 17:06:08"
