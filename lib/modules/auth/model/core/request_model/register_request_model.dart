import 'dart:convert';
/// phone : "01900000020"
/// email : "testaccount@gmail.com"
/// name : "Test"
/// business_name : "Test Account"
/// business_type_id : "7"

RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));
String registerRequestModelToJson(RegisterRequestModel data) => json.encode(data.toJson());
class RegisterRequestModel {
  RegisterRequestModel({
      String? phone, 
      String? email, 
      String? name, 
      String? businessName, 
      String? businessTypeId,}){
    _phone = phone;
    _email = email;
    _name = name;
    _businessName = businessName;
    _businessTypeId = businessTypeId;
}

  RegisterRequestModel.fromJson(dynamic json) {
    _phone = json['phone'];
    _email = json['email'];
    _name = json['name'];
    _businessName = json['business_name'];
    _businessTypeId = json['business_type_id'];
  }
  String? _phone;
  String? _email;
  String? _name;
  String? _businessName;
  String? _businessTypeId;
RegisterRequestModel copyWith({  String? phone,
  String? email,
  String? name,
  String? businessName,
  String? businessTypeId,
}) => RegisterRequestModel(  phone: phone ?? _phone,
  email: email ?? _email,
  name: name ?? _name,
  businessName: businessName ?? _businessName,
  businessTypeId: businessTypeId ?? _businessTypeId,
);
  String? get phone => _phone;
  String? get email => _email;
  String? get name => _name;
  String? get businessName => _businessName;
  String? get businessTypeId => _businessTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['email'] = _email;
    map['name'] = _name;
    map['business_name'] = _businessName;
    map['business_type_id'] = _businessTypeId;
    return map;
  }

}