import 'dart:convert';

import 'package:buisness_manager/modules/customer/model/core/response_model/customer_information_response_model.dart';
/// status : 200
/// msg : "OK"
/// description : "Customer created successfully"
/// customer : {"id":39,"company_id":66,"branch_id":126,"user_id":66,"name":"asd","phone":"01000005556","email":"testc@gmail.com","type":0,"balance":"0.00","reminder_date":null,"image":null,"address":"dhaka","area":"dhaka","post_code":"1612","city":"dhaka","state":"dhaka","status":1,"created_by":66,"created_at":"2024-05-18 13:45:56","updated_by":66,"updated_at":"2024-05-18 13:45:56","deleted":0,"deleted_by":null,"deleted_at":null,"show_image":null}
/// customer_bank_accounts : [{"id":33,"customer_id":39,"bank_name":null,"account_name":"oalid","account_number":"23423423","routing_number":"dhanmondi","swift_code":"231","status":1,"created_by":66,"created_at":"2024-05-18 13:45:56","updated_by":66,"updated_at":"2024-05-18 13:45:56","deleted":0,"deleted_by":null,"deleted_at":null}]

CustomerCreateResponseModel customerCreateResponseModelFromJson(String str) => CustomerCreateResponseModel.fromJson(json.decode(str));
String customerCreateResponseModelToJson(CustomerCreateResponseModel data) => json.encode(data.toJson());
class CustomerCreateResponseModel {
  CustomerCreateResponseModel({
    num? status,
    String? msg,
    String? description,
    Customer? customer,
    List<CustomerBankAccounts>? customerBankAccounts,}){
    _status = status;
    _msg = msg;
    _description = description;
    _customer = customer;
    _customerBankAccounts = customerBankAccounts;
  }

  CustomerCreateResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['customer_bank_accounts'] != null) {
      _customerBankAccounts = [];
      json['customer_bank_accounts'].forEach((v) {
        _customerBankAccounts?.add(CustomerBankAccounts.fromJson(v));
      });
    }
  }
  num? _status;
  String? _msg;
  String? _description;
  Customer? _customer;
  List<CustomerBankAccounts>? _customerBankAccounts;
  CustomerCreateResponseModel copyWith({  num? status,
    String? msg,
    String? description,
    Customer? customer,
    List<CustomerBankAccounts>? customerBankAccounts,
  }) => CustomerCreateResponseModel(  status: status ?? _status,
    msg: msg ?? _msg,
    description: description ?? _description,
    customer: customer ?? _customer,
    customerBankAccounts: customerBankAccounts ?? _customerBankAccounts,
  );
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  Customer? get customer => _customer;
  List<CustomerBankAccounts>? get customerBankAccounts => _customerBankAccounts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    if (_customerBankAccounts != null) {
      map['customer_bank_accounts'] = _customerBankAccounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 33
/// customer_id : 39
/// bank_name : null
/// account_name : "oalid"
/// account_number : "23423423"
/// routing_number : "dhanmondi"
/// swift_code : "231"
/// status : 1
/// created_by : 66
/// created_at : "2024-05-18 13:45:56"
/// updated_by : 66
/// updated_at : "2024-05-18 13:45:56"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null
