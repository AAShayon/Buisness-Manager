
import 'dart:developer';

import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_create_request_model.dart';
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_name_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class BranchService{
  Future<Response> branchList();
  Future<Response> branchCreate(BranchCreateRequestModel branchCreateRequestModel);
  Future<Response> branchUpdate(BranchNameUpdateRequestModel branchNameUpdateRequestModel,{required String branchId});
  Future<Response> branchDelete({required String branchId});
}

class BranchRemoteDataSource extends BranchService{
  static final BranchRemoteDataSource _singleton = BranchRemoteDataSource._internal();
  late DioService _dioService;


  factory BranchRemoteDataSource(){
    return _singleton;
  }
  BranchRemoteDataSource._internal(){
    _dioService=DioService() ;
  }

  @override
  Future<Response> branchList() async {
    Response? response=await _dioService.get(ApiUrl().branchList);
    return response!;

  }

    @override
    Future<Response> branchCreate(BranchCreateRequestModel branchCreateRequestModel) async {
    Response? response= await _dioService.post(ApiUrl().branchCreate,data: branchCreateRequestModel.toJson());
    return response!;
    }

  @override
  Future<Response> branchUpdate(BranchNameUpdateRequestModel branchNameUpdateRequestModel,{required String branchId}) async{
    ApiUrl.branchId=branchId;
    Response? response= await _dioService.post(ApiUrl().branchUpdate,data: branchNameUpdateRequestModel.toJson());
    return response!;
  }

    @override
    Future<Response> branchDelete({required String branchId}) async{
    ApiUrl.branchId=branchId;
    log("======>ApiUrl.branchId${ApiUrl.branchId}");
    log("======>ApiUrl.branchId${ApiUrl().branchDelete}");
    Response? response=await _dioService.delete(ApiUrl().branchDelete);
    return response!;
    }




}