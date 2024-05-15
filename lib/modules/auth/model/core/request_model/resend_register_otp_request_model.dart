import 'dart:convert';
/// email : "demouser@gmail.com"
/// phone : "04567"

ResendRegisterOtpRequestModel resendRegisterOtpRequestModelFromJson(String str) => ResendRegisterOtpRequestModel.fromJson(json.decode(str));
String resendRegisterOtpRequestModelToJson(ResendRegisterOtpRequestModel data) => json.encode(data.toJson());
class ResendRegisterOtpRequestModel {
  ResendRegisterOtpRequestModel({
      String? email, 
      String? phone,}){
    _email = email;
    _phone = phone;
}

  ResendRegisterOtpRequestModel.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
  }
  String? _email;
  String? _phone;
ResendRegisterOtpRequestModel copyWith({  String? email,
  String? phone,
}) => ResendRegisterOtpRequestModel(  email: email ?? _email,
  phone: phone ?? _phone,
);
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }

}