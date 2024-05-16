import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Branches"
/// branches : {"per_page":10,"from":1,"to":2,"total":2,"current_page":1,"last_page":1,"prev_page_url":null,"first_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1","next_page_url":null,"last_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1","branches":[{"id":14,"name":"startup"},{"id":29,"name":"Uttora"}]}

BranchListResponseModel branchListResponseModelFromJson(String str) => BranchListResponseModel.fromJson(json.decode(str));
String branchListResponseModelToJson(BranchListResponseModel data) => json.encode(data.toJson());
class BranchListResponseModel {
  BranchListResponseModel({
     dynamic status, 
      dynamic msg, 
      dynamic description, 
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
 dynamic _status;
  dynamic _msg;
  dynamic _description;
  Branches? _branches;
BranchListResponseModel copyWith({ dynamic status,
  dynamic msg,
  dynamic description,
  Branches? branches,
}) => BranchListResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  branches: branches ?? _branches,
);
 dynamic get status => _status;
  dynamic get msg => _msg;
  dynamic get description => _description;
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
/// to : 2
/// total : 2
/// current_page : 1
/// last_page : 1
/// prev_page_url : null
/// first_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1"
/// next_page_url : null
/// last_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1"
/// branches : [{"id":14,"name":"startup"},{"id":29,"name":"Uttora"}]

Branches branchesFromJson(String str) => Branches.fromJson(json.decode(str));
String branchesToJson(Branches data) => json.encode(data.toJson());
class Branches {
  Branches({
     dynamic perPage, 
     dynamic from, 
     dynamic to, 
     dynamic total, 
     dynamic currentPage, 
     dynamic lastPage, 
      dynamic prevPageUrl, 
      dynamic firstPageUrl, 
      dynamic nextPageUrl, 
      dynamic lastPageUrl, 
      List<Branches>? branches,}){
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
    _branches = branches;
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
      _branches = [];
      json['branches'].forEach((v) {
        _branches?.add(Branches.fromJson(v));
      });
    }
  }
 dynamic _perPage;
 dynamic _from;
 dynamic _to;
 dynamic _total;
 dynamic _currentPage;
 dynamic _lastPage;
  dynamic _prevPageUrl;
  dynamic _firstPageUrl;
  dynamic _nextPageUrl;
  dynamic _lastPageUrl;
  List<Branches>? _branches;
Branches copyWith({ dynamic perPage,
 dynamic from,
 dynamic to,
 dynamic total,
 dynamic currentPage,
 dynamic lastPage,
  dynamic prevPageUrl,
  dynamic firstPageUrl,
  dynamic nextPageUrl,
  dynamic lastPageUrl,
  List<Branches>? branches,
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
  branches: branches ?? _branches,
);
 dynamic get perPage => _perPage;
 dynamic get from => _from;
 dynamic get to => _to;
 dynamic get total => _total;
 dynamic get currentPage => _currentPage;
 dynamic get lastPage => _lastPage;
  dynamic get prevPageUrl => _prevPageUrl;
  dynamic get firstPageUrl => _firstPageUrl;
  dynamic get nextPageUrl => _nextPageUrl;
  dynamic get lastPageUrl => _lastPageUrl;
  List<Branches>? get branches => _branches;

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
    if (_branches != null) {
      map['branches'] = _branches?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
