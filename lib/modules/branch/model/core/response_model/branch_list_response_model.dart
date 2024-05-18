import 'dart:convert';

/// status : 200
/// msg : "OK"
/// description : "Branches"
/// branches : {"per_page":10,"from":1,"to":4,"total":4,"current_page":1,"last_page":1,"prev_page_url":null,"first_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1","next_page_url":null,"last_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1","branches":[{"id":58,"name":"E-Digital Selling"},{"id":59,"name":"Altratect"},{"id":61,"name":"SuperTech"},{"id":62,"name":"Walton Aftabnagar"}]}

class BranchListResponseModel {
  dynamic status;
  dynamic msg;
  dynamic description;
  Branches? branches;

  BranchListResponseModel({
    this.status,
    this.msg,
    this.description,
    this.branches,
  });

  factory BranchListResponseModel.fromJson(Map<String, dynamic> json) =>
      BranchListResponseModel(
        status: json['status'],
        msg: json['msg'],
        description: json['description'],
        branches: json['branches'] != null
            ? Branches.fromJson(json['branches'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'msg': msg,
        'description': description,
        'branches': branches?.toJson(),
      };
}

/// per_page : 10
/// from : 1
/// to : 4
/// total : 4
/// current_page : 1
/// last_page : 1
/// prev_page_url : null
/// first_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1"
/// next_page_url : null
/// last_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/branches?page=1"
/// branches : [{"id":58,"name":"E-Digital Selling"},{"id":59,"name":"Altratect"},{"id":61,"name":"SuperTech"},{"id":62,"name":"Walton Aftabnagar"}]

class Branches {
  dynamic perPage;
  dynamic from;
  dynamic to;
  dynamic total;
  dynamic currentPage;
  dynamic lastPage;
  dynamic prevPageUrl;
  dynamic firstPageUrl;
  dynamic nextPageUrl;
  dynamic lastPageUrl;
  List<Branch> branches;

  Branches({
    this.perPage,
    this.from,
    this.to,
    this.total,
    this.currentPage,
    this.lastPage,
    this.prevPageUrl,
    this.firstPageUrl,
    this.nextPageUrl,
    this.lastPageUrl,
    required this.branches,
  });

  factory Branches.fromJson(Map<String, dynamic> json) => Branches(
        perPage: json['per_page'],
        from: json['from'],
        to: json['to'],
        total: json['total'],
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        prevPageUrl: json['prev_page_url'],
        firstPageUrl: json['first_page_url'],
        nextPageUrl: json['next_page_url'],
        lastPageUrl: json['last_page_url'],
        branches:
            List<Branch>.from(json['branches'].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'per_page': perPage,
        'from': from,
        'to': to,
        'total': total,
        'current_page': currentPage,
        'last_page': lastPage,
        'prev_page_url': prevPageUrl,
        'first_page_url': firstPageUrl,
        'next_page_url': nextPageUrl,
        'last_page_url': lastPageUrl,
        'branches': List<dynamic>.from(branches.map((x) => x.toJson())),
      };
}

/// id : 58
/// name : "E-Digital Selling"

class Branch {
  dynamic id;
  dynamic name;

  Branch({
    this.id,
    this.name,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
