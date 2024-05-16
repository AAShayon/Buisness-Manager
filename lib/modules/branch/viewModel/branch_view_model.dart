import 'package:buisness_manager/modules/branch/model/core/request_model/branch_create_request_model.dart';
import 'package:buisness_manager/modules/branch/model/core/response_model/branch_create_response_model.dart';
import 'package:buisness_manager/modules/branch/model/core/response_model/branch_list_response_model.dart';
import 'package:buisness_manager/modules/branch/model/service/remote/branch_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BranchViewModel extends ChangeNotifier {
  final BranchService _branchService = BranchRemoteDataSource();
  bool _isLoadingState = false;
  BranchCreateResponseModel? _branchCreateResponseModel;
  BranchListResponseModel? _branchListResponseModel;
  Branches? _branches;

  ///////////////////////////////////////////////////////////

  void setIsLoadingState(bool isLoading) {
    _isLoadingState = isLoading;
    notifyListeners();
  }

  void setBranchCreateRequestResponseModel(
      BranchCreateResponseModel branchCreateResponseModel) {
    _branchCreateResponseModel = branchCreateResponseModel;
    notifyListeners();
  }

  void setBranchListResponseModel(BranchListResponseModel branchCreateRequestModel){
    _branchListResponseModel = _branchListResponseModel;
    notifyListeners();
  }
  void setBranchList(Branches? branches) {
    _branches = branches;
    notifyListeners();
  }

  /////////////////////////

  bool get isLoadingState => _isLoadingState;

  BranchCreateResponseModel? get branchCreateResponseModel =>
      _branchCreateResponseModel;

  BranchListResponseModel? get branchListResponseModel =>
      _branchListResponseModel;

  Branches? get branches => _branches;

  ////////////////

  Future<bool> createBranch(
      BranchCreateRequestModel branchCreateRequestModel) async {
    _isLoadingState = true;
    bool isCreate = false;
    _branchCreateResponseModel = null;
    try {
      Response response = await _branchService.branchCreate(branchCreateRequestModel);
      if (response.statusCode == 200) {
        _branchCreateResponseModel = BranchCreateResponseModel.fromJson(response.data);
        _branches= _branchListResponseModel!.branches;
        _isLoadingState = false;
        isCreate = true;
        notifyListeners();
      } else {
        _isLoadingState = false;
        isCreate = false;
        notifyListeners();
      }
    } catch (e) {
      _isLoadingState = false;
      isCreate = false;
      notifyListeners();
    }
    return isCreate;
  }

  Future<bool> branchListFetch() async {
    _isLoadingState = true;
    bool isBranchListFetch = false;
    _branchListResponseModel = null;
    try {
      Response response=await _branchService.branchList();
      if(response.statusCode == 200){
        _branchListResponseModel = BranchListResponseModel.fromJson(response.data);
        _branches = _branchListResponseModel!.branches;
        _isLoadingState =false ;
        isBranchListFetch =true;
        notifyListeners();
      }
      else{
        _isLoadingState =false ;
        isBranchListFetch =false;
        notifyListeners();
      }

    } catch (e) {
      _isLoadingState =false ;
      isBranchListFetch =false;
      notifyListeners();
    }
    return isBranchListFetch;
  }
}
