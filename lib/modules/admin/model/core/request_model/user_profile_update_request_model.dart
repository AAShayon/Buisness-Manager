import 'dart:convert';
/// name : "Rakesh Pandew"
/// business_type_id : "6"

UserProfileUpdateRequestModel userProfileUpdateRequestModelFromJson(String str) => UserProfileUpdateRequestModel.fromJson(json.decode(str));
String userProfileUpdateRequestModelToJson(UserProfileUpdateRequestModel data) => json.encode(data.toJson());
class UserProfileUpdateRequestModel {
  UserProfileUpdateRequestModel({
    String? name,
    String? businessTypeId,}){
    _name = name;
    _businessTypeId = businessTypeId;
  }

  UserProfileUpdateRequestModel.fromJson(dynamic json) {
    _name = json['name'];
    _businessTypeId = json['business_type_id'];
  }
  String? _name;
  String? _businessTypeId;
  UserProfileUpdateRequestModel copyWith({  String? name,
    String? businessTypeId,
  }) => UserProfileUpdateRequestModel(  name: name ?? _name,
    businessTypeId: businessTypeId ?? _businessTypeId,
  );
  String? get name => _name;
  String? get businessTypeId => _businessTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['business_type_id'] = _businessTypeId;
    return map;
  }

}