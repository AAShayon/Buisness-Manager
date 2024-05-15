import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Register Success"
/// response_user : {"id":11,"api_token":"hh8r1715681629Eqla11","name":"Test","email":"testaccount@gmail.com","phone":"01900000020","image":null,"image_full_path":null,"business_name":"Test Account","business_type":"Others","business_type_id":7,"branch":"Test Account","company_id":11,"branch_id":15}

RegisterVerifyOtpResponseModel registerVerifyOtpResponseModelFromJson(String str) => RegisterVerifyOtpResponseModel.fromJson(json.decode(str));
String registerVerifyOtpResponseModelToJson(RegisterVerifyOtpResponseModel data) => json.encode(data.toJson());
class RegisterVerifyOtpResponseModel {
  RegisterVerifyOtpResponseModel({
      num? status, 
      String? msg, 
      String? description, 
      ResponseUser? responseUser,}){
    _status = status;
    _msg = msg;
    _description = description;
    _responseUser = responseUser;
}

  RegisterVerifyOtpResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _responseUser = json['response_user'] != null ? ResponseUser.fromJson(json['response_user']) : null;
  }
  num? _status;
  String? _msg;
  String? _description;
  ResponseUser? _responseUser;
RegisterVerifyOtpResponseModel copyWith({  num? status,
  String? msg,
  String? description,
  ResponseUser? responseUser,
}) => RegisterVerifyOtpResponseModel(  status: status ?? _status,
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

/// id : 11
/// api_token : "hh8r1715681629Eqla11"
/// name : "Test"
/// email : "testaccount@gmail.com"
/// phone : "01900000020"
/// image : null
/// image_full_path : null
/// business_name : "Test Account"
/// business_type : "Others"
/// business_type_id : 7
/// branch : "Test Account"
/// company_id : 11
/// branch_id : 15

ResponseUser responseUserFromJson(String str) => ResponseUser.fromJson(json.decode(str));
String responseUserToJson(ResponseUser data) => json.encode(data.toJson());
class ResponseUser {
  ResponseUser({
      num? id, 
      String? apiToken, 
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
    _apiToken = apiToken;
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
    _apiToken = json['api_token'];
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
  String? _apiToken;
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
  String? apiToken,
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
  apiToken: apiToken ?? _apiToken,
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
  String? get apiToken => _apiToken;
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
    map['api_token'] = _apiToken;
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