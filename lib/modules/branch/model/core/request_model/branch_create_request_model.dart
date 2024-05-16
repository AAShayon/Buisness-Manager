import 'dart:convert';
/// name : "SuperTech"

BranchCreateRequestModel branchCreateRequestModelFromJson(String str) => BranchCreateRequestModel.fromJson(json.decode(str));
String branchCreateRequestModelToJson(BranchCreateRequestModel data) => json.encode(data.toJson());
class BranchCreateRequestModel {
  BranchCreateRequestModel({
      String? name,}){
    _name = name;
}

  BranchCreateRequestModel.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
BranchCreateRequestModel copyWith({  String? name,
}) => BranchCreateRequestModel(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}