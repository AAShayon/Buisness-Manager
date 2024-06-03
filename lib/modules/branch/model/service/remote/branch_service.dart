
import 'dart:developer';

import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/api_error_handler.dart';
import 'package:buisness_manager/model/service/remote/api_response.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_create_request_model.dart';
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_name_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class BranchService{
  Future<ApiResponse> branchList();
  Future<ApiResponse> branchCreate(BranchCreateRequestModel branchCreateRequestModel);
  Future<ApiResponse> branchUpdate(BranchNameUpdateRequestModel branchNameUpdateRequestModel,{required String branchId});
  Future<ApiResponse> branchDelete({required String branchId});
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
  Future<ApiResponse> branchList() async {
   try{
     Response? response=await _dioService.get(ApiUrl().branchList);
     return ApiResponse.withSuccess(response!);
   }catch(e){
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }

  }

    @override
    Future<ApiResponse> branchCreate(BranchCreateRequestModel branchCreateRequestModel) async {
    try{
      Response? response= await _dioService.post(ApiUrl().branchCreate,data: branchCreateRequestModel.toJson());
      return ApiResponse.withSuccess(response!);
    }
    catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
    }

  @override
  Future<ApiResponse> branchUpdate(BranchNameUpdateRequestModel branchNameUpdateRequestModel,{required String branchId}) async{
    ApiUrl.branchId=branchId;
    try{
      Response? response= await _dioService.post(ApiUrl().branchUpdate,data: branchNameUpdateRequestModel.toJson());
      return ApiResponse.withSuccess(response!);
    }catch(e){
      return  ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

    @override
    Future<ApiResponse> branchDelete({required String branchId}) async{
    ApiUrl.branchId=branchId;
    try{
      Response? response=await _dioService.delete(ApiUrl().branchDelete);
      return ApiResponse.withSuccess(response!);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }

    }




}