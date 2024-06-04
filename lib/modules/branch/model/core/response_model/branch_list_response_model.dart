import 'dart:convert';

import 'package:buisness_manager/modules/branch/model/core/response_model/branch_information_response_model.dart';
/// status : 200
/// msg : "OK"
/// description : "Branches"
/// branches : {"per_page":10,"from":1,"to":3,"total":3,"current_page":1,"last_page":1,"prev_page_url":null,"first_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1","next_page_url":null,"last_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1","branches":[{"id":31,"name":"ACI"},{"id":155,"name":"cratat"},{"id":172,"name":"jgigug"}]}

BranchListResponseModel branchListResponseModelFromJson(String str) => BranchListResponseModel.fromJson(json.decode(str));
String branchListResponseModelToJson(BranchListResponseModel data) => json.encode(data.toJson());
class BranchListResponseModel {
  BranchListResponseModel({
    num? status,
    String? msg,
    String? description,
    Branches? branches,}){
    _status = status;
    _msg = msg;
    _description = description;
    _branches = branches;
  }

  BranchListResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _branches = json['branches'] != null ? Branches.fromJson(json['branches']) : null;
  }
  num? _status;
  String? _msg;
  String? _description;
  Branches? _branches;
  BranchListResponseModel copyWith({  num? status,
    String? msg,
    String? description,
    Branches? branches,
  }) => BranchListResponseModel(  status: status ?? _status,
    msg: msg ?? _msg,
    description: description ?? _description,
    branches: branches ?? _branches,
  );
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  Branches? get branches => _branches;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_branches != null) {
      map['branches'] = _branches?.toJson();
    }
    return map;
  }

}

/// per_page : 10
/// from : 1
/// to : 3
/// total : 3
/// current_page : 1
/// last_page : 1
/// prev_page_url : null
/// first_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1"
/// next_page_url : null
/// last_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1"
/// branches : [{"id":31,"name":"ACI"},{"id":155,"name":"cratat"},{"id":172,"name":"jgigug"}]

Branches branchesFromJson(String str) => Branches.fromJson(json.decode(str));
String branchesToJson(Branches data) => json.encode(data.toJson());
class Branches {
  Branches({
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
    List<Branch>? branchList,}){
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
    _branchList = branchList;
  }

  Branches.fromJson(dynamic json) {
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
    if (json['branches'] != null) {
      _branchList = [];
      json['branches'].forEach((v) {
        _branchList?.add(Branch.fromJson(v));
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
  List<Branch>? _branchList;
  Branches copyWith({  num? perPage,
    num? from,
    num? to,
    num? total,
    num? currentPage,
    num? lastPage,
    dynamic prevPageUrl,
    String? firstPageUrl,
    dynamic nextPageUrl,
    String? lastPageUrl,
    List<Branch>? branchList,
  }) => Branches(  perPage: perPage ?? _perPage,
    from: from ?? _from,
    to: to ?? _to,
    total: total ?? _total,
    currentPage: currentPage ?? _currentPage,
    lastPage: lastPage ?? _lastPage,
    prevPageUrl: prevPageUrl ?? _prevPageUrl,
    firstPageUrl: firstPageUrl ?? _firstPageUrl,
    nextPageUrl: nextPageUrl ?? _nextPageUrl,
    lastPageUrl: lastPageUrl ?? _lastPageUrl,
    branchList: branchList ?? _branchList,
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
  List<Branch>? get branchList => _branchList;

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
    if (_branchList != null) {
      map['branches'] = _branchList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

