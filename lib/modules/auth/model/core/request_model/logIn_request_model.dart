import 'dart:convert';
/// otp_code : "123456"
/// identifier : "01752355529"

LogInRequestModel logInRequestModelFromJson(String str) => LogInRequestModel.fromJson(json.decode(str));
String logInRequestModelToJson(LogInRequestModel data) => json.encode(data.toJson());
class LogInRequestModel {
  LogInRequestModel({
      dynamic otpCode, 
      dynamic identifier,}){
    _otpCode = otpCode;
    _identifier = identifier;
}

  LogInRequestModel.fromJson(dynamic json) {
    _otpCode = json['otp_code'];
    _identifier = json['identifier'];
  }
  dynamic _otpCode;
  dynamic _identifier;
LogInRequestModel copyWith({  dynamic otpCode,
  dynamic identifier,
}) => LogInRequestModel(  otpCode: otpCode ?? _otpCode,
  identifier: identifier ?? _identifier,
);
  dynamic get otpCode => _otpCode;
  dynamic get identifier => _identifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp_code'] = _otpCode;
    map['identifier'] = _identifier;
    return map;
  }

}