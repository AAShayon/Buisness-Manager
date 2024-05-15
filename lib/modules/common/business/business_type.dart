import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Business Types"
/// business_types : [{"id":1,"name":"Retailer/Shop","slug":"retailer_or_shop"},{"id":2,"name":"Wholesaler","slug":"wholesaler"},{"id":3,"name":"Distributor","slug":"distributor"},{"id":4,"name":"Manufacturer","slug":"manufacturer"},{"id":6,"name":"Services","slug":"services"},{"id":7,"name":"Others","slug":"others"}]

BusinessType businessTypeFromJson(String str) => BusinessType.fromJson(json.decode(str));
String businessTypeToJson(BusinessType data) => json.encode(data.toJson());
class BusinessType {
  BusinessType({
      num? status, 
      String? msg, 
      String? description, 
      List<BusinessTypes>? businessTypes,}){
    _status = status;
    _msg = msg;
    _description = description;
    _businessTypes = businessTypes;
}

  BusinessType.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    if (json['business_types'] != null) {
      _businessTypes = [];
      json['business_types'].forEach((v) {
        _businessTypes?.add(BusinessTypes.fromJson(v));
      });
    }
  }
  num? _status;
  String? _msg;
  String? _description;
  List<BusinessTypes>? _businessTypes;
BusinessType copyWith({  num? status,
  String? msg,
  String? description,
  List<BusinessTypes>? businessTypes,
}) => BusinessType(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  businessTypes: businessTypes ?? _businessTypes,
);
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  List<BusinessTypes>? get businessTypes => _businessTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_businessTypes != null) {
      map['business_types'] = _businessTypes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Retailer/Shop"
/// slug : "retailer_or_shop"

BusinessTypes businessTypesFromJson(String str) => BusinessTypes.fromJson(json.decode(str));
String businessTypesToJson(BusinessTypes data) => json.encode(data.toJson());
class BusinessTypes {
  BusinessTypes({
      num? id, 
      String? name, 
      String? slug,}){
    _id = id;
    _name = name;
    _slug = slug;
}

  BusinessTypes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
  }
  num? _id;
  String? _name;
  String? _slug;
BusinessTypes copyWith({  num? id,
  String? name,
  String? slug,
}) => BusinessTypes(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
);
  num? get id => _id;
  String? get name => _name;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }

}