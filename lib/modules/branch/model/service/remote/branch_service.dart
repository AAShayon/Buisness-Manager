
import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_create_request_model.dart';
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_name_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class BranchService{
  Future<Response> branchList();
  Future<Response> branchCreate(BranchCreateRequestModel branchCreateRequestModel);
  Future<Response> branchUpdate(BranchNameUpdateRequestModel branchNameUpdateRequestModel);
  Future<Response> branchDelete();
}

class BranchRemoteDataSource extends BranchService{
static final BranchRemoteDataSource _singleton = BranchRemoteDataSource._internal();
final _dioService=DioService();
factory BranchRemoteDataSource(){
  return _singleton;
}
BranchRemoteDataSource._internal();

@override
Future<Response> branchList() async {
  Response? response=await _dioService.get(ApiUrl.branchList);
  return response!;
}

  @override
  Future<Response> branchCreate(BranchCreateRequestModel branchCreateRequestModel) async {
  Response? response= await _dioService.post(ApiUrl.branchCreate,data: branchCreateRequestModel.toJson());
  return response!;
  }

@override
Future<Response> branchUpdate(BranchNameUpdateRequestModel branchNameUpdateRequestModel) async{
  Response? response= await _dioService.post(ApiUrl.branchUpdate,data: branchNameUpdateRequestModel.toJson());
  return response!;
}

  @override
  Future<Response> branchDelete() async{
  Response? response=await _dioService.delete(ApiUrl.branchDelete);
  return response!;
  }




}