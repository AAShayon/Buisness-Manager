import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Success"
/// branch : {"id":16,"company_id":11,"name":"Branch 2","status":1,"created_by":11,"created_at":"2024-05-14 16:15:00","updated_by":null,"updated_at":"2024-05-14 16:15:00","deleted":0,"deleted_by":null,"deleted_at":null}

BranchCreateResponseModel branchCreateResponseModelFromJson(String str) => BranchCreateResponseModel.fromJson(json.decode(str));
String branchCreateResponseModelToJson(BranchCreateResponseModel data) => json.encode(data.toJson());
class BranchCreateResponseModel {
  BranchCreateResponseModel({
      num? status, 
      String? msg, 
      String? description, 
      Branch? branch,}){
    _status = status;
    _msg = msg;
    _description = description;
    _branch = branch;
}

  BranchCreateResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
  }
  num? _status;
  String? _msg;
  String? _description;
  Branch? _branch;
BranchCreateResponseModel copyWith({  num? status,
  String? msg,
  String? description,
  Branch? branch,
}) => BranchCreateResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  branch: branch ?? _branch,
);
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  Branch? get branch => _branch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_branch != null) {
      map['branch'] = _branch?.toJson();
    }
    return map;
  }

}

/// id : 16
/// company_id : 11
/// name : "Branch 2"
/// status : 1
/// created_by : 11
/// created_at : "2024-05-14 16:15:00"
/// updated_by : null
/// updated_at : "2024-05-14 16:15:00"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null

Branch branchFromJson(String str) => Branch.fromJson(json.decode(str));
String branchToJson(Branch data) => json.encode(data.toJson());
class Branch {
  Branch({
      num? id, 
      num? companyId, 
      String? name, 
      num? status, 
      num? createdBy, 
      String? createdAt, 
      dynamic updatedBy, 
      String? updatedAt, 
      num? deleted, 
      dynamic deletedBy, 
      dynamic deletedAt,}){
    _id = id;
    _companyId = companyId;
    _name = name;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _deleted = deleted;
    _deletedBy = deletedBy;
    _deletedAt = deletedAt;
}

  Branch.fromJson(dynamic json) {
    _id = json['id'];
    _companyId = json['company_id'];
    _name = json['name'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _deleted = json['deleted'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  num? _companyId;
  String? _name;
  num? _status;
  num? _createdBy;
  String? _createdAt;
  dynamic _updatedBy;
  String? _updatedAt;
  num? _deleted;
  dynamic _deletedBy;
  dynamic _deletedAt;
Branch copyWith({  num? id,
  num? companyId,
  String? name,
  num? status,
  num? createdBy,
  String? createdAt,
  dynamic updatedBy,
  String? updatedAt,
  num? deleted,
  dynamic deletedBy,
  dynamic deletedAt,
}) => Branch(  id: id ?? _id,
  companyId: companyId ?? _companyId,
  name: name ?? _name,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  deleted: deleted ?? _deleted,
  deletedBy: deletedBy ?? _deletedBy,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  num? get companyId => _companyId;
  String? get name => _name;
  num? get status => _status;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  num? get deleted => _deleted;
  dynamic get deletedBy => _deletedBy;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_id'] = _companyId;
    map['name'] = _name;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['deleted'] = _deleted;
    map['deleted_by'] = _deletedBy;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}