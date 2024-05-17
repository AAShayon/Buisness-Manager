import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "User updated successfully"
/// user : {"id":51,"company_id":51,"branch_id":58,"type":1,"name":"Ans","business_name":"E-Digital Selling","business_type_id":"4","email":"shayonasif@gmail.com","phone":"01652355529","phone_verified":"0","email_verified":"0","email_verified_at":null,"image":null,"device_token":null,"status":1,"created_by":null,"created_at":"2024-05-16 13:23:43","updated_by":51,"updated_at":"2024-05-17T14:24:43.848326Z","deleted":0,"deleted_by":null,"deleted_at":null,"show_image":null,"business_type_name":"Manufacturer"}

UserProfileUpdateRequestResponseModel userProfileUpdateRequestResponseModelFromJson(String str) => UserProfileUpdateRequestResponseModel.fromJson(json.decode(str));
String userProfileUpdateRequestResponseModelToJson(UserProfileUpdateRequestResponseModel data) => json.encode(data.toJson());
class UserProfileUpdateRequestResponseModel {
  UserProfileUpdateRequestResponseModel({
      num? status, 
      String? msg, 
      String? description, 
      User? user,}){
    _status = status;
    _msg = msg;
    _description = description;
    _user = user;
}

  UserProfileUpdateRequestResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? _status;
  String? _msg;
  String? _description;
  User? _user;
UserProfileUpdateRequestResponseModel copyWith({  num? status,
  String? msg,
  String? description,
  User? user,
}) => UserProfileUpdateRequestResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  user: user ?? _user,
);
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 51
/// company_id : 51
/// branch_id : 58
/// type : 1
/// name : "Ans"
/// business_name : "E-Digital Selling"
/// business_type_id : "4"
/// email : "shayonasif@gmail.com"
/// phone : "01652355529"
/// phone_verified : "0"
/// email_verified : "0"
/// email_verified_at : null
/// image : null
/// device_token : null
/// status : 1
/// created_by : null
/// created_at : "2024-05-16 13:23:43"
/// updated_by : 51
/// updated_at : "2024-05-17T14:24:43.848326Z"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null
/// show_image : null
/// business_type_name : "Manufacturer"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      num? id, 
      num? companyId, 
      num? branchId, 
      num? type, 
      String? name, 
      String? businessName, 
      String? businessTypeId, 
      String? email, 
      String? phone, 
      String? phoneVerified, 
      String? emailVerified, 
      dynamic emailVerifiedAt, 
      dynamic image, 
      dynamic deviceToken, 
      num? status, 
      dynamic createdBy, 
      String? createdAt, 
      num? updatedBy, 
      String? updatedAt, 
      num? deleted, 
      dynamic deletedBy, 
      dynamic deletedAt, 
      dynamic showImage, 
      String? businessTypeName,}){
    _id = id;
    _companyId = companyId;
    _branchId = branchId;
    _type = type;
    _name = name;
    _businessName = businessName;
    _businessTypeId = businessTypeId;
    _email = email;
    _phone = phone;
    _phoneVerified = phoneVerified;
    _emailVerified = emailVerified;
    _emailVerifiedAt = emailVerifiedAt;
    _image = image;
    _deviceToken = deviceToken;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _deleted = deleted;
    _deletedBy = deletedBy;
    _deletedAt = deletedAt;
    _showImage = showImage;
    _businessTypeName = businessTypeName;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _companyId = json['company_id'];
    _branchId = json['branch_id'];
    _type = json['type'];
    _name = json['name'];
    _businessName = json['business_name'];
    _businessTypeId = json['business_type_id'];
    _email = json['email'];
    _phone = json['phone'];
    _phoneVerified = json['phone_verified'];
    _emailVerified = json['email_verified'];
    _emailVerifiedAt = json['email_verified_at'];
    _image = json['image'];
    _deviceToken = json['device_token'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _deleted = json['deleted'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _showImage = json['show_image'];
    _businessTypeName = json['business_type_name'];
  }
  num? _id;
  num? _companyId;
  num? _branchId;
  num? _type;
  String? _name;
  String? _businessName;
  String? _businessTypeId;
  String? _email;
  String? _phone;
  String? _phoneVerified;
  String? _emailVerified;
  dynamic _emailVerifiedAt;
  dynamic _image;
  dynamic _deviceToken;
  num? _status;
  dynamic _createdBy;
  String? _createdAt;
  num? _updatedBy;
  String? _updatedAt;
  num? _deleted;
  dynamic _deletedBy;
  dynamic _deletedAt;
  dynamic _showImage;
  String? _businessTypeName;
User copyWith({  num? id,
  num? companyId,
  num? branchId,
  num? type,
  String? name,
  String? businessName,
  String? businessTypeId,
  String? email,
  String? phone,
  String? phoneVerified,
  String? emailVerified,
  dynamic emailVerifiedAt,
  dynamic image,
  dynamic deviceToken,
  num? status,
  dynamic createdBy,
  String? createdAt,
  num? updatedBy,
  String? updatedAt,
  num? deleted,
  dynamic deletedBy,
  dynamic deletedAt,
  dynamic showImage,
  String? businessTypeName,
}) => User(  id: id ?? _id,
  companyId: companyId ?? _companyId,
  branchId: branchId ?? _branchId,
  type: type ?? _type,
  name: name ?? _name,
  businessName: businessName ?? _businessName,
  businessTypeId: businessTypeId ?? _businessTypeId,
  email: email ?? _email,
  phone: phone ?? _phone,
  phoneVerified: phoneVerified ?? _phoneVerified,
  emailVerified: emailVerified ?? _emailVerified,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  image: image ?? _image,
  deviceToken: deviceToken ?? _deviceToken,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  deleted: deleted ?? _deleted,
  deletedBy: deletedBy ?? _deletedBy,
  deletedAt: deletedAt ?? _deletedAt,
  showImage: showImage ?? _showImage,
  businessTypeName: businessTypeName ?? _businessTypeName,
);
  num? get id => _id;
  num? get companyId => _companyId;
  num? get branchId => _branchId;
  num? get type => _type;
  String? get name => _name;
  String? get businessName => _businessName;
  String? get businessTypeId => _businessTypeId;
  String? get email => _email;
  String? get phone => _phone;
  String? get phoneVerified => _phoneVerified;
  String? get emailVerified => _emailVerified;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get image => _image;
  dynamic get deviceToken => _deviceToken;
  num? get status => _status;
  dynamic get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  num? get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  num? get deleted => _deleted;
  dynamic get deletedBy => _deletedBy;
  dynamic get deletedAt => _deletedAt;
  dynamic get showImage => _showImage;
  String? get businessTypeName => _businessTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_id'] = _companyId;
    map['branch_id'] = _branchId;
    map['type'] = _type;
    map['name'] = _name;
    map['business_name'] = _businessName;
    map['business_type_id'] = _businessTypeId;
    map['email'] = _email;
    map['phone'] = _phone;
    map['phone_verified'] = _phoneVerified;
    map['email_verified'] = _emailVerified;
    map['email_verified_at'] = _emailVerifiedAt;
    map['image'] = _image;
    map['device_token'] = _deviceToken;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['deleted'] = _deleted;
    map['deleted_by'] = _deletedBy;
    map['deleted_at'] = _deletedAt;
    map['show_image'] = _showImage;
    map['business_type_name'] = _businessTypeName;
    return map;
  }

}