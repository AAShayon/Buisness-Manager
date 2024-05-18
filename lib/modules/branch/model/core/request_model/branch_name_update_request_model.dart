import 'dart:convert';
/// name : "Test Branch Updated"

BranchNameUpdateRequestModel branchNameUpdateRequestModelFromJson(String str) => BranchNameUpdateRequestModel.fromJson(json.decode(str));
String branchNameUpdateRequestModelToJson(BranchNameUpdateRequestModel data) => json.encode(data.toJson());
class BranchNameUpdateRequestModel {
  BranchNameUpdateRequestModel({
      String? name,}){
    _name = name;
}

  BranchNameUpdateRequestModel.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
BranchNameUpdateRequestModel copyWith({  String? name,
}) => BranchNameUpdateRequestModel(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}