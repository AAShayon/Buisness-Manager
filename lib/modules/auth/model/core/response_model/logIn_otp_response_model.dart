import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Success"
/// message : "OTP code sent successfully"

LogInOtpResponseModel logInOtpResponseModelFromJson(String str) => LogInOtpResponseModel.fromJson(json.decode(str));
String logInOtpResponseModelToJson(LogInOtpResponseModel data) => json.encode(data.toJson());
class LogInOtpResponseModel {
  LogInOtpResponseModel({
      num? status, 
      String? msg, 
      String? description, 
      String? message,}){
    _status = status;
    _msg = msg;
    _description = description;
    _message = message;
}

  LogInOtpResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _message = json['message'];
  }
  num? _status;
  String? _msg;
  String? _description;
  String? _message;
LogInOtpResponseModel copyWith({  num? status,
  String? msg,
  String? description,
  String? message,
}) => LogInOtpResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  message: message ?? _message,
);
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    map['message'] = _message;
    return map;
  }

}