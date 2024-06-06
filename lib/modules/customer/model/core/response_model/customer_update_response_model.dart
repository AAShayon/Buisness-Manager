import 'dart:convert';

import 'package:buisness_manager/modules/customer/model/core/response_model/customer_information_response_model.dart';
/// status : 200
/// msg : "OK"
/// description : "Customer updated successfully"
/// customer : {"id":38,"company_id":66,"branch_id":126,"user_id":66,"name":"test customer1 udpate","phone":"01000000006","email":"testcust@gmail.com","type":0,"balance":"0.00","reminder_date":null,"image":null,"address":"dhaka update","area":"dhaka udpate","post_code":"16122","city":"dhaka update","state":"dhaka","status":1,"created_by":66,"created_at":"2024-05-18 13:38:43","updated_by":66,"updated_at":"2024-05-18 14:02:42","deleted":0,"deleted_by":null,"deleted_at":null,"show_image":null}
/// customer_bank_accounts : [{"id":32,"customer_id":38,"bank_name":null,"account_name":"oalid","account_number":"23423423","routing_number":"dhanmondi","swift_code":"231","status":1,"created_by":66,"created_at":"2024-05-18 13:38:43","updated_by":66,"updated_at":"2024-05-18 13:38:43","deleted":0,"deleted_by":null,"deleted_at":null},{"id":35,"customer_id":38,"bank_name":null,"account_name":"oalid udate","account_number":"2342342322","routing_number":"dhanmondi udpate","swift_code":"2311","status":1,"created_by":null,"created_at":"2024-05-18 14:02:42","updated_by":66,"updated_at":"2024-05-18 14:02:42","deleted":0,"deleted_by":null,"deleted_at":null},{"id":36,"customer_id":38,"bank_name":null,"account_name":"oalid","account_number":"2342342322","routing_number":"mohammadpur","swift_code":"2310","status":1,"created_by":null,"created_at":"2024-05-18 14:02:42","updated_by":66,"updated_at":"2024-05-18 14:02:42","deleted":0,"deleted_by":null,"deleted_at":null}]

CustomerUpdateResponseModel customerUpdateResponseModelFromJson(String str) => CustomerUpdateResponseModel.fromJson(json.decode(str));
String customerUpdateResponseModelToJson(CustomerUpdateResponseModel data) => json.encode(data.toJson());
class CustomerUpdateResponseModel {
  CustomerUpdateResponseModel({
    dynamic status,
    dynamic msg,
    dynamic description,
    Customer? customer,
    List<CustomerBankAccounts>? customerBankAccounts,}){
    _status = status;
    _msg = msg;
    _description = description;
    _customer = customer;
    _customerBankAccounts = customerBankAccounts;
  }

  CustomerUpdateResponseModel.fromJson(dynamic json) {
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
  dynamic _status;
  dynamic _msg;
  dynamic _description;
  Customer? _customer;
  List<CustomerBankAccounts>? _customerBankAccounts;
  CustomerUpdateResponseModel copyWith({  dynamic status,
    dynamic msg,
    dynamic description,
    Customer? customer,
    List<CustomerBankAccounts>? customerBankAccounts,
  }) => CustomerUpdateResponseModel(  status: status ?? _status,
    msg: msg ?? _msg,
    description: description ?? _description,
    customer: customer ?? _customer,
    customerBankAccounts: customerBankAccounts ?? _customerBankAccounts,
  );
  dynamic get status => _status;
  dynamic get msg => _msg;
  dynamic get description => _description;
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

/// id : 32
/// customer_id : 38
/// bank_name : null
/// account_name : "oalid"
/// account_number : "23423423"
/// routing_number : "dhanmondi"
/// swift_code : "231"
/// status : 1
/// created_by : 66
/// created_at : "2024-05-18 13:38:43"
/// updated_by : 66
/// updated_at : "2024-05-18 13:38:43"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null



/// id : 38
/// company_id : 66
/// branch_id : 126
/// user_id : 66
/// name : "test customer1 udpate"
/// phone : "01000000006"
/// email : "testcust@gmail.com"
/// type : 0
/// balance : "0.00"
/// reminder_date : null
/// image : null
/// address : "dhaka update"
/// area : "dhaka udpate"
/// post_code : "16122"
/// city : "dhaka update"
/// state : "dhaka"
/// status : 1
/// created_by : 66
/// created_at : "2024-05-18 13:38:43"
/// updated_by : 66
/// updated_at : "2024-05-18 14:02:42"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null
/// show_image : null

