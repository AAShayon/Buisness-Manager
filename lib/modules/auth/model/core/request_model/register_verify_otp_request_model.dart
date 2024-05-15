import 'dart:convert';
/// identifier_id : "15"
/// otp_code : "123456"

RegisterVerifyOtpRequestModel verifyOtpRequestModelFromJson(String str) => RegisterVerifyOtpRequestModel.fromJson(json.decode(str));
String registerVerifyOtpRequestModelToJson(RegisterVerifyOtpRequestModel data) => json.encode(data.toJson());
class RegisterVerifyOtpRequestModel {
  RegisterVerifyOtpRequestModel({
      dynamic identifierId, 
      dynamic otpCode,}){
    _identifierId = identifierId;
    _otpCode = otpCode;
}

  RegisterVerifyOtpRequestModel.fromJson(dynamic json) {
    _identifierId = json['identifier_id'];
    _otpCode = json['otp_code'];
  }
  dynamic _identifierId;
  dynamic _otpCode;
RegisterVerifyOtpRequestModel copyWith({  dynamic identifierId,
  dynamic otpCode,
}) => RegisterVerifyOtpRequestModel(  identifierId: identifierId ?? _identifierId,
  otpCode: otpCode ?? _otpCode,
);
  dynamic get identifierId => _identifierId;
  dynamic get otpCode => _otpCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier_id'] = _identifierId;
    map['otp_code'] = _otpCode;
    return map;
  }

}