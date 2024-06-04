import 'dart:convert';

import 'package:buisness_manager/modules/branch/model/core/response_model/branch_information_response_model.dart';
/// status : 200
/// msg : "OK"
/// description : "Success"
/// branch : {"id":125,"company_id":65,"name":"Test Branch Updated","status":1,"created_by":65,"created_at":"2024-05-18 08:55:43","updated_by":65,"updated_at":"2024-05-18 08:56:15","deleted":0,"deleted_by":null,"deleted_at":null}

BranchNameUpdateRequestResponseModel branchNameUpdateRequestResponseModelFromJson(String str) => BranchNameUpdateRequestResponseModel.fromJson(json.decode(str));
String branchNameUpdateRequestResponseModelToJson(BranchNameUpdateRequestResponseModel data) => json.encode(data.toJson());
class BranchNameUpdateRequestResponseModel {
  BranchNameUpdateRequestResponseModel({
      dynamic status, 
      dynamic msg, 
      dynamic description, 
      Branch? branch,}){
    _status = status;
    _msg = msg;
    _description = description;
    _branch = branch;
}

  BranchNameUpdateRequestResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
  }
  dynamic _status;
  dynamic _msg;
  dynamic _description;
  Branch? _branch;
BranchNameUpdateRequestResponseModel copyWith({  dynamic status,
  dynamic msg,
  dynamic description,
  Branch? branch,
}) => BranchNameUpdateRequestResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  branch: branch ?? _branch,
);
  dynamic get status => _status;
  dynamic get msg => _msg;
  dynamic get description => _description;
  Branch? get branch => _branch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_branch != null) {
      map['branch'] = _branch?.toJson();
    }
    return map;
  }

}

/// id : 125
/// company_id : 65
/// name : "Test Branch Updated"
/// status : 1
/// created_by : 65
/// created_at : "2024-05-18 08:55:43"
/// updated_by : 65
/// updated_at : "2024-05-18 08:56:15"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null
