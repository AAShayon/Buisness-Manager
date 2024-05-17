import 'dart:convert';
/// name : "Ans"
/// business_type_id : "4"
/// phone : "01852355529"
/// email : "shayon.cse01@gmail.com"

UserProfileUpdateRequestModel userProfileUpdateRequestModelFromJson(String str) => UserProfileUpdateRequestModel.fromJson(json.decode(str));
String userProfileUpdateRequestModelToJson(UserProfileUpdateRequestModel data) => json.encode(data.toJson());
class UserProfileUpdateRequestModel {
  UserProfileUpdateRequestModel({
      String? name, 
      String? businessTypeId, 
      String? phone, 
      String? email,}){
    _name = name;
    _businessTypeId = businessTypeId;
    _phone = phone;
    _email = email;
}

  UserProfileUpdateRequestModel.fromJson(dynamic json) {
    _name = json['name'];
    _businessTypeId = json['business_type_id'];
    _phone = json['phone'];
    _email = json['email'];
  }
  String? _name;
  String? _businessTypeId;
  String? _phone;
  String? _email;
UserProfileUpdateRequestModel copyWith({  String? name,
  String? businessTypeId,
  String? phone,
  String? email,
}) => UserProfileUpdateRequestModel(  name: name ?? _name,
  businessTypeId: businessTypeId ?? _businessTypeId,
  phone: phone ?? _phone,
  email: email ?? _email,
);
  String? get name => _name;
  String? get businessTypeId => _businessTypeId;
  String? get phone => _phone;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['business_type_id'] = _businessTypeId;
    map['phone'] = _phone;
    map['email'] = _email;
    return map;
  }

}