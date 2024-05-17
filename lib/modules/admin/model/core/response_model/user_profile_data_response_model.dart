import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "User Profile"
/// response_user : {"id":51,"name":"Ans","email":"shayonasif@gmail.com","phone":"01652355529","image":null,"image_full_path":null,"business_name":"E-Digital Selling","business_type":"Manufacturer","business_type_id":4,"branch":"E-Digital Selling","company_id":51,"branch_id":58}

UserProfileDataResponseModel userProfileDataResponseModelFromJson(String str) => UserProfileDataResponseModel.fromJson(json.decode(str));
String userProfileDataResponseModelToJson(UserProfileDataResponseModel data) => json.encode(data.toJson());
class UserProfileDataResponseModel {
  UserProfileDataResponseModel({
      dynamic status, 
      dynamic msg, 
      dynamic description, 
      ResponseUser? responseUser,}){
    _status = status;
    _msg = msg;
    _description = description;
    _responseUser = responseUser;
}

  UserProfileDataResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _responseUser = json['response_user'] != null ? ResponseUser.fromJson(json['response_user']) : null;
  }
  dynamic _status;
  dynamic _msg;
  dynamic _description;
  ResponseUser? _responseUser;
UserProfileDataResponseModel copyWith({  dynamic status,
  dynamic msg,
  dynamic description,
  ResponseUser? responseUser,
}) => UserProfileDataResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  responseUser: responseUser ?? _responseUser,
);
  dynamic get status => _status;
  dynamic get msg => _msg;
  dynamic get description => _description;
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

/// id : 51
/// name : "Ans"
/// email : "shayonasif@gmail.com"
/// phone : "01652355529"
/// image : null
/// image_full_path : null
/// business_name : "E-Digital Selling"
/// business_type : "Manufacturer"
/// business_type_id : 4
/// branch : "E-Digital Selling"
/// company_id : 51
/// branch_id : 58

ResponseUser responseUserFromJson(String str) => ResponseUser.fromJson(json.decode(str));
String responseUserToJson(ResponseUser data) => json.encode(data.toJson());
class ResponseUser {
  ResponseUser({
      dynamic id, 
      dynamic name, 
      dynamic email, 
      dynamic phone, 
      dynamic image, 
      dynamic imageFullPath, 
      dynamic businessName, 
      dynamic businessType, 
      dynamic businessTypeId, 
      dynamic branch, 
      dynamic companyId, 
      dynamic branchId,}){
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
  dynamic _id;
  dynamic _name;
  dynamic _email;
  dynamic _phone;
  dynamic _image;
  dynamic _imageFullPath;
  dynamic _businessName;
  dynamic _businessType;
  dynamic _businessTypeId;
  dynamic _branch;
  dynamic _companyId;
  dynamic _branchId;
ResponseUser copyWith({  dynamic id,
  dynamic name,
  dynamic email,
  dynamic phone,
  dynamic image,
  dynamic imageFullPath,
  dynamic businessName,
  dynamic businessType,
  dynamic businessTypeId,
  dynamic branch,
  dynamic companyId,
  dynamic branchId,
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
  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get email => _email;
  dynamic get phone => _phone;
  dynamic get image => _image;
  dynamic get imageFullPath => _imageFullPath;
  dynamic get businessName => _businessName;
  dynamic get businessType => _businessType;
  dynamic get businessTypeId => _businessTypeId;
  dynamic get branch => _branch;
  dynamic get companyId => _companyId;
  dynamic get branchId => _branchId;

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