import 'dart:convert';
/// identifier : "01752355529"

SendOtpRequestForLoginModel sendLoginOtpRequestModelFromJson(String str) => SendOtpRequestForLoginModel.fromJson(json.decode(str));
String sendLoginOtpRequestModelToJson(SendOtpRequestForLoginModel data) => json.encode(data.toJson());
class SendOtpRequestForLoginModel {
  SendOtpRequestForLoginModel({
      String? identifier,}){
    _identifier = identifier;
}

  SendOtpRequestForLoginModel.fromJson(dynamic json) {
    _identifier = json['identifier'];
  }
  String? _identifier;
SendOtpRequestForLoginModel copyWith({  String? identifier,
}) => SendOtpRequestForLoginModel(  identifier: identifier ?? _identifier,
);
  String? get identifier => _identifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = _identifier;
    return map;
  }

}