import 'package:buisness_manager/modules/branch/model/core/request_model/branch_create_request_model.dart';
import 'package:buisness_manager/modules/branch/model/core/response_model/branch_create_response_model.dart';
import 'package:buisness_manager/modules/branch/model/service/remote/branch_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BranchViewModel extends ChangeNotifier{
  final BranchService _branchService=BranchRemoteDataSource();
  bool _isLoadingState = false;
  BranchCreateResponseModel? _branchCreateResponseModel;

  ///////////////////////////////////////////////////////////


  void setIsLoadingState(bool isLoading){
    _isLoadingState = isLoading;
    notifyListeners();
  }

  void setBranchCreateRequestResponseModel(BranchCreateResponseModel branchCreateResponseModel){
    _branchCreateResponseModel = branchCreateResponseModel;
    notifyListeners();
  }



  /////////////////////////

  bool get isLoadingState=>_isLoadingState;
  BranchCreateResponseModel? get branchCreateResponseModel =>_branchCreateResponseModel;

  ////////////////

Future<bool> createBranch(BranchCreateRequestModel branchCreateRequestModel) async {
  _isLoadingState =true ;
  bool isCreate=false;
  _branchCreateResponseModel=null;
  try{
    Response response=await _branchService.branchCreate(branchCreateRequestModel);
    if(response.statusCode == 200){
      _branchCreateResponseModel = BranchCreateResponseModel.fromJson(response.data);
      _isLoadingState=false;
      isCreate=true;
      notifyListeners();
    }
    else{
      _isLoadingState=false;
      isCreate=false;
      notifyListeners();
    }
  }
  catch(e){
    _isLoadingState=false;
    isCreate=false;
    notifyListeners();
  }
  return isCreate;
}


}