import 'dart:convert';

import 'package:buisness_manager/modules/branch/model/core/response_model/branch_information_response_model.dart';
/// status : 200
/// msg : "OK"
/// description : "Success"
/// branch : {"id":16,"company_id":11,"name":"Branch 2","status":1,"created_by":11,"created_at":"2024-05-14 16:15:00","updated_by":null,"updated_at":"2024-05-14 16:15:00","deleted":0,"deleted_by":null,"deleted_at":null}

BranchCreateResponseModel branchCreateResponseModelFromJson(String str) => BranchCreateResponseModel.fromJson(json.decode(str));
String branchCreateResponseModelToJson(BranchCreateResponseModel data) => json.encode(data.toJson());
class BranchCreateResponseModel {
  BranchCreateResponseModel({
      num? status, 
      String? msg, 
      String? description, 
      Branch? branch,}){
    _status = status;
    _msg = msg;
    _description = description;
    _branch = branch;
}

  BranchCreateResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
  }
  num? _status;
  String? _msg;
  String? _description;
  Branch? _branch;
BranchCreateResponseModel copyWith({  num? status,
  String? msg,
  String? description,
  Branch? branch,
}) => BranchCreateResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  branch: branch ?? _branch,
);
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
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

/// id : 16
/// company_id : 11
/// name : "Branch 2"
/// status : 1
/// created_by : 11
/// created_at : "2024-05-14 16:15:00"
/// updated_by : null
/// updated_at : "2024-05-14 16:15:00"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null
