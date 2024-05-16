import 'dart:convert';

UserProfileResponse userProfileResponseFromJson(String str) => UserProfileResponse.fromJson(json.decode(str));
String userProfileResponseToJson(UserProfileResponse data) => json.encode(data.toJson());
class UserProfileResponse {
  UserProfileResponse({
      num? status, 
      String? msg, 
      String? description, 
      ResponseUser? responseUser,}){
    _status = status;
    _msg = msg;
    _description = description;
    _responseUser = responseUser;
}

  UserProfileResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _responseUser = json['response_user'] != null ? ResponseUser.fromJson(json['response_user']) : null;
  }
  num? _status;
  String? _msg;
  String? _description;
  ResponseUser? _responseUser;
UserProfileResponse copyWith({  num? status,
  String? msg,
  String? description,
  ResponseUser? responseUser,
}) => UserProfileResponse(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  responseUser: responseUser ?? _responseUser,
);
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  ResponseUser? get responseUser => _responseUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_responseUser != null) {
      map['response_user'] = _responseUser?.toJson();
    }
    return map;
  }

}

ResponseUser responseUserFromJson(String str) => ResponseUser.fromJson(json.decode(str));
String responseUserToJson(ResponseUser data) => json.encode(data.toJson());
class ResponseUser {
  ResponseUser({
      num? id, 
      String? name, 
      String? email, 
      String? phone, 
      dynamic image, 
      dynamic imageFullPath, 
      String? businessName, 
      String? businessType, 
      num? businessTypeId, 
      String? branch, 
      num? companyId, 
      num? branchId,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _image = image;
    _imageFullPath = imageFullPath;
    _businessName = businessName;
    _businessType = businessType;
    _businessTypeId = businessTypeId;
    _branch = branch;
    _companyId = companyId;
    _branchId = branchId;
}

  ResponseUser.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _imageFullPath = json['image_full_path'];
    _businessName = json['business_name'];
    _businessType = json['business_type'];
    _businessTypeId = json['business_type_id'];
    _branch = json['branch'];
    _companyId = json['company_id'];
    _branchId = json['branch_id'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _phone;
  dynamic _image;
  dynamic _imageFullPath;
  String? _businessName;
  String? _businessType;
  num? _businessTypeId;
  String? _branch;
  num? _companyId;
  num? _branchId;
ResponseUser copyWith({  num? id,
  String? name,
  String? email,
  String? phone,
  dynamic image,
  dynamic imageFullPath,
  String? businessName,
  String? businessType,
  num? businessTypeId,
  String? branch,
  num? companyId,
  num? branchId,
}) => ResponseUser(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  image: image ?? _image,
  imageFullPath: imageFullPath ?? _imageFullPath,
  businessName: businessName ?? _businessName,
  businessType: businessType ?? _businessType,
  businessTypeId: businessTypeId ?? _businessTypeId,
  branch: branch ?? _branch,
  companyId: companyId ?? _companyId,
  branchId: branchId ?? _branchId,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get image => _image;
  dynamic get imageFullPath => _imageFullPath;
  String? get businessName => _businessName;
  String? get businessType => _businessType;
  num? get businessTypeId => _businessTypeId;
  String? get branch => _branch;
  num? get companyId => _companyId;
  num? get branchId => _branchId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['image'] = _image;
    map['image_full_path'] = _imageFullPath;
    map['business_name'] = _businessName;
    map['business_type'] = _businessType;
    map['business_type_id'] = _businessTypeId;
    map['branch'] = _branch;
    map['company_id'] = _companyId;
    map['branch_id'] = _branchId;
    return map;
  }

}