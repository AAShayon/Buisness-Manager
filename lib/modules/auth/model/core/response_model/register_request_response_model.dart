import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "OTP Send Success"
/// phone : "01900000020"
/// email : "testaccount@gmail.com"
/// identifier_id : 15

RegisterRequestResponseModel registerRequestResponseModelFromJson(String str) => RegisterRequestResponseModel.fromJson(json.decode(str));
String registerRequestResponseModelToJson(RegisterRequestResponseModel data) => json.encode(data.toJson());
class RegisterRequestResponseModel {
  RegisterRequestResponseModel({
      dynamic status, 
      String? msg, 
      String? description, 
      String? phone, 
      String? email, 
      dynamic identifierId,}){
    _status = status;
    _msg = msg;
    _description = description;
    _phone = phone;
    _email = email;
    _identifierId = identifierId;
}

  RegisterRequestResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _phone = json['phone'];
    _email = json['email'];
    _identifierId = json['identifier_id'];
  }
  dynamic _status;
  String? _msg;
  String? _description;
  String? _phone;
  String? _email;
  dynamic _identifierId;
RegisterRequestResponseModel copyWith({  dynamic status,
  String? msg,
  String? description,
  String? phone,
  String? email,
  dynamic identifierId,
}) => RegisterRequestResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  phone: phone ?? _phone,
  email: email ?? _email,
  identifierId: identifierId ?? _identifierId,
);
  dynamic get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  String? get phone => _phone;
  String? get email => _email;
  dynamic get identifierId => _identifierId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    map['phone'] = _phone;
    map['email'] = _email;
    map['identifier_id'] = _identifierId;
    return map;
  }

}