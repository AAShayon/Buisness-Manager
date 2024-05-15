import 'dart:convert';
/// identifier : "01752355529"

SendLogInOtpRequestModel sendLogInOtpRequestModelFromJson(String str) => SendLogInOtpRequestModel.fromJson(json.decode(str));
String sendLogInOtpRequestModelToJson(SendLogInOtpRequestModel data) => json.encode(data.toJson());
class SendLogInOtpRequestModel {
  SendLogInOtpRequestModel({
      String? identifier,}){
    _identifier = identifier;
}

  SendLogInOtpRequestModel.fromJson(dynamic json) {
    _identifier = json['identifier'];
  }
  String? _identifier;
SendLogInOtpRequestModel copyWith({  String? identifier,
}) => SendLogInOtpRequestModel(  identifier: identifier ?? _identifier,
);
  String? get identifier => _identifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = _identifier;
    return map;
  }

}