import 'dart:convert';
/// identifier_id : "15"
/// otp_code : "123456"

VerifyOtpRegisterRequestModel verifyOtpRequestModelFromJson(String str) => VerifyOtpRegisterRequestModel.fromJson(json.decode(str));
String verifyOtpRequestModelToJson(VerifyOtpRegisterRequestModel data) => json.encode(data.toJson());
class VerifyOtpRegisterRequestModel {
  VerifyOtpRegisterRequestModel({
      String? identifierId, 
      String? otpCode,}){
    _identifierId = identifierId;
    _otpCode = otpCode;
}

  VerifyOtpRegisterRequestModel.fromJson(dynamic json) {
    _identifierId = json['identifier_id'];
    _otpCode = json['otp_code'];
  }
  String? _identifierId;
  String? _otpCode;
VerifyOtpRegisterRequestModel copyWith({  String? identifierId,
  String? otpCode,
}) => VerifyOtpRegisterRequestModel(  identifierId: identifierId ?? _identifierId,
  otpCode: otpCode ?? _otpCode,
);
  String? get identifierId => _identifierId;
  String? get otpCode => _otpCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier_id'] = _identifierId;
    map['otp_code'] = _otpCode;
    return map;
  }

}