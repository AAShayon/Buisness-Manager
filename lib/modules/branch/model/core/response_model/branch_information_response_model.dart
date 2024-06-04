import 'dart:convert';

Branch branchFromJson(String str) => Branch.fromJson(json.decode(str));
String branchToJson(Branch data) => json.encode(data.toJson());
class Branch {
  Branch({
    dynamic id,
    dynamic companyId,
    dynamic name,
    dynamic status,
    dynamic createdBy,
    dynamic createdAt,
    dynamic updatedBy,
    dynamic updatedAt,
    dynamic deleted,
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
  dynamic _id;
  dynamic _companyId;
  dynamic _name;
  dynamic _status;
  dynamic _createdBy;
  dynamic _createdAt;
  dynamic _updatedBy;
  dynamic _updatedAt;
  dynamic _deleted;
  dynamic _deletedBy;
  dynamic _deletedAt;
  Branch copyWith({  dynamic id,
    dynamic companyId,
    dynamic name,
    dynamic status,
    dynamic createdBy,
    dynamic createdAt,
    dynamic updatedBy,
    dynamic updatedAt,
    dynamic deleted,
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
  dynamic get id => _id;
  dynamic get companyId => _companyId;
  dynamic get name => _name;
  dynamic get status => _status;
  dynamic get createdBy => _createdBy;
  dynamic get createdAt => _createdAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get deleted => _deleted;
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