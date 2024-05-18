import 'package:buisness_manager/modules/branch/model/core/request_model/branch_create_request_model.dart';
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_name_update_request_model.dart';
import 'package:buisness_manager/modules/branch/model/core/response_model/branch_create_response_model.dart';
import 'package:buisness_manager/modules/branch/model/core/response_model/branch_list_response_model.dart';
import 'package:buisness_manager/modules/branch/model/core/response_model/branch_name_update_request_response_model.dart';
import 'package:buisness_manager/modules/branch/model/service/remote/branch_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BranchViewModel extends ChangeNotifier {
  final BranchService _branchService = BranchRemoteDataSource();
  bool _isLoadingState = false;
  BranchCreateResponseModel? _branchCreateResponseModel;
  BranchListResponseModel? _branchListResponseModel;
  BranchNameUpdateRequestResponseModel? _branchNameUpdateRequestResponseModel;
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
  void setBranchNameUpdateRequestResponseModel(BranchNameUpdateRequestResponseModel branchNameUpdateRequestResponseModel){
    _branchNameUpdateRequestResponseModel = branchNameUpdateRequestResponseModel;
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

  BranchCreateResponseModel? get branchCreateResponseModel => _branchCreateResponseModel;
  BranchNameUpdateRequestResponseModel? get branchNameUpdateRequestResponseModel => _branchNameUpdateRequestResponseModel;

  BranchListResponseModel? get branchListResponseModel => _branchListResponseModel;

  Branches? get branches => _branches;

  ////////////////

  Future<bool> createBranch(BranchCreateRequestModel branchCreateRequestModel,BuildContext context) async {
    _isLoadingState = true;
    bool isCreate = false;
    _branchCreateResponseModel = null;
    try {
      Response response = await _branchService.branchCreate(branchCreateRequestModel);
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _branchCreateResponseModel = BranchCreateResponseModel.fromJson(response.data);
        _branches= _branchListResponseModel!.branches;
        _isLoadingState = false;
        isCreate = true;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),),
          ));
        }
      } else {
        _isLoadingState = false;
        isCreate = false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),),
          ));
        }
      }
    } catch (e) {
      _isLoadingState = false;
      isCreate = false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('$e',style: const TextStyle(color: Colors.white),),
        ));
      }
    }
    return isCreate;
  }

  Future<bool> branchNameUpdateRequest(BranchNameUpdateRequestModel branchNameUpdateRequestModel,BuildContext context)async{
    _isLoadingState =true ;
    bool isUpdate=false ;
    _branchNameUpdateRequestResponseModel = null ;
    try{
      Response response= await _branchService.branchUpdate(branchNameUpdateRequestModel);
      if(response.statusCode == 200 && response.data["status"] == 200){
        _branchNameUpdateRequestResponseModel=BranchNameUpdateRequestResponseModel.fromJson(response.data);
        // _branches=_branchNameUpdateRequestResponseModel.branch;
        _isLoadingState= false;
        isUpdate= true ;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),),
          ));
        }
      }else{
        _isLoadingState =false ;
        isUpdate =false ;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),),
          ));
        }
      }
    }
    catch(e){
   _isLoadingState =false ;
   isUpdate =false ;
   notifyListeners();
   if(context.mounted){
     ScaffoldMessenger.of(context).removeCurrentSnackBar();
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
       backgroundColor: const Color(0xffFF0000),
       content: Text('$e',style: const TextStyle(color: Colors.white),),
     ));
      }
    }
    return isUpdate;

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
  Future<bool> deleteBranch(BuildContext context)async{
    _isLoadingState = true;
    bool isDeleted = false;
    try{
    Response response= await _branchService.branchDelete();
    if(response.statusCode == 200 && response.data["status"] == 200){
      _isLoadingState =false;
      isDeleted = true;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),),
        ));
      }

    } else{
      isDeleted = false;
      _isLoadingState=false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),),
        ));
      }

    }
    }
    catch(e){
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('$e',style: const TextStyle(color: Colors.white),),
        ));
      }
      isDeleted = false;
      _isLoadingState=false;
      notifyListeners();
    }
    return isDeleted;

  }
}
