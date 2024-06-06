import 'dart:convert';

import 'package:buisness_manager/modules/customer/model/core/response_model/customer_information_response_model.dart';
/// status : 200
/// msg : "OK"
/// description : "Customers"
/// customers : {"per_page":10,"from":1,"to":1,"total":1,"current_page":1,"last_page":1,"prev_page_url":null,"first_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/31/0/customers?page=1","next_page_url":null,"last_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/31/0/customers?page=1","customers":[{"id":45,"name":"asd","phone":"01000005556","balance":"0.00"}]}

CustomerListResponseModel customerListResponseModelFromJson(String str) => CustomerListResponseModel.fromJson(json.decode(str));
String customerListResponseModelToJson(CustomerListResponseModel data) => json.encode(data.toJson());
class CustomerListResponseModel {
  CustomerListResponseModel({
    num? status,
    String? msg,
    String? description,
    Customers? customers,}){
    _status = status;
    _msg = msg;
    _description = description;
    _customers = customers;
  }

  CustomerListResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _customers = json['customers'] != null ? Customers.fromJson(json['customers']) : null;
  }
  num? _status;
  String? _msg;
  String? _description;
  Customers? _customers;
  CustomerListResponseModel copyWith({  num? status,
    String? msg,
    String? description,
    Customers? customers,
  }) => CustomerListResponseModel(  status: status ?? _status,
    msg: msg ?? _msg,
    description: description ?? _description,
    customers: customers ?? _customers,
  );
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  Customers? get customers => _customers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_customers != null) {
      map['customers'] = _customers?.toJson();
    }
    return map;
  }

}

/// per_page : 10
/// from : 1
/// to : 1
/// total : 1
/// current_page : 1
/// last_page : 1
/// prev_page_url : null
/// first_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/31/0/customers?page=1"
/// next_page_url : null
/// last_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/31/0/customers?page=1"
/// customers : [{"id":45,"name":"asd","phone":"01000005556","balance":"0.00"}]

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));
String customersToJson(Customers data) => json.encode(data.toJson());
class Customers {
  Customers({
    num? perPage,
    num? from,
    num? to,
    num? total,
    num? currentPage,
    num? lastPage,
    dynamic prevPageUrl,
    String? firstPageUrl,
    dynamic nextPageUrl,
    String? lastPageUrl,
    List<Customer>? customerList,}){
    _perPage = perPage;
    _from = from;
    _to = to;
    _total = total;
    _currentPage = currentPage;
    _lastPage = lastPage;
    _prevPageUrl = prevPageUrl;
    _firstPageUrl = firstPageUrl;
    _nextPageUrl = nextPageUrl;
    _lastPageUrl = lastPageUrl;
    _customerList = _customerList;
  }

  Customers.fromJson(dynamic json) {
    _perPage = json['per_page'];
    _from = json['from'];
    _to = json['to'];
    _total = json['total'];
    _currentPage = json['current_page'];
    _lastPage = json['last_page'];
    _prevPageUrl = json['prev_page_url'];
    _firstPageUrl = json['first_page_url'];
    _nextPageUrl = json['next_page_url'];
    _lastPageUrl = json['last_page_url'];
    if (json['customers'] != null) {
      _customerList = [];
      json['customers'].forEach((v) {
        _customerList?.add(Customer.fromJson(v));
      });
    }
  }
  num? _perPage;
  num? _from;
  num? _to;
  num? _total;
  num? _currentPage;
  num? _lastPage;
  dynamic _prevPageUrl;
  String? _firstPageUrl;
  dynamic _nextPageUrl;
  String? _lastPageUrl;
  List<Customer>? _customerList;
  Customers copyWith({  num? perPage,
    num? from,
    num? to,
    num? total,
    num? currentPage,
    num? lastPage,
    dynamic prevPageUrl,
    String? firstPageUrl,
    dynamic nextPageUrl,
    String? lastPageUrl,
    List<Customer>? customerList,
  }) => Customers(  perPage: perPage ?? _perPage,
    from: from ?? _from,
    to: to ?? _to,
    total: total ?? _total,
    currentPage: currentPage ?? _currentPage,
    lastPage: lastPage ?? _lastPage,
    prevPageUrl: prevPageUrl ?? _prevPageUrl,
    firstPageUrl: firstPageUrl ?? _firstPageUrl,
    nextPageUrl: nextPageUrl ?? _nextPageUrl,
    lastPageUrl: lastPageUrl ?? _lastPageUrl,
    customerList: customerList ?? _customerList,
  );
  num? get perPage => _perPage;
  num? get from => _from;
  num? get to => _to;
  num? get total => _total;
  num? get currentPage => _currentPage;
  num? get lastPage => _lastPage;
  dynamic get prevPageUrl => _prevPageUrl;
  String? get firstPageUrl => _firstPageUrl;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get lastPageUrl => _lastPageUrl;
  List<Customer>? get customerList => _customerList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['per_page'] = _perPage;
    map['from'] = _from;
    map['to'] = _to;
    map['total'] = _total;
    map['current_page'] = _currentPage;
    map['last_page'] = _lastPage;
    map['prev_page_url'] = _prevPageUrl;
    map['first_page_url'] = _firstPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['last_page_url'] = _lastPageUrl;
    if (_customerList != null) {
      map['customers'] = _customerList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 45
/// name : "asd"
/// phone : "01000005556"
/// balance : "0.00"

