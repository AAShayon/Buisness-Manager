import 'dart:async';
import 'dart:developer';
import 'package:buisness_manager/modules/admin/model/core/request_model/user_profile_update_request_model.dart';
import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_data_response_model.dart';
import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_update_request_response_model.dart';
import 'package:buisness_manager/modules/admin/model/core/service/remote/user_profile_service.dart';
import 'package:buisness_manager/modules/admin/view/widget/user_profile_update_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UserProfileViewModel extends ChangeNotifier{
  final UserProfileService _userProfileService=UserProfileDataSource();
  bool _isLoadingState=false;
  UserProfileDataResponseModel? _userProfileDataResponseModel;
  ResponseUser? _responseUser;
  UserProfileUpdateRequestResponseModel? _userProfileUpdateRequestResponseModel;
  User? _user;

  ///-----------------setter---------------\\\


  void setIsLoadingState(bool isLoading){
    _isLoadingState = isLoading;
    notifyListeners();
  }

  void setUserProfileResponse(UserProfileDataResponseModel userProfileDataResponseModel){
    _userProfileDataResponseModel = userProfileDataResponseModel;

    notifyListeners();
  }
  void setUserProfileUpdateRequest( UserProfileUpdateRequestResponseModel userProfileUpdateRequestResponseModel){
    _userProfileUpdateRequestResponseModel = userProfileUpdateRequestResponseModel;
    notifyListeners();
  }
  void setUser(User? user){
    _user = user;
    notifyListeners();
  }

  void setResponseUser(ResponseUser? responseUser){
    _responseUser = responseUser;
    notifyListeners();
  }

  ///--getter----\\\

  bool get isLoadingState=>_isLoadingState;
  UserProfileDataResponseModel? get userProfileDataResponseModel => _userProfileDataResponseModel;
  UserProfileUpdateRequestResponseModel? get userProfileUpdateRequestResponseModel => _userProfileUpdateRequestResponseModel;
  ResponseUser? get responseUser => _responseUser;
  User? get user => _user;



  ///---------Methods ---------\\\\

Future<bool> getUserProfile() async{
  _isLoadingState = true ;
  bool isUser= false;
  _userProfileDataResponseModel = null ;
  try{
   Response response=await _userProfileService.userProfile();
    log("response==================================>${response.statusCode}");
    log("response==================================>${response.data}");
    if(response.statusCode == 200){
      _userProfileDataResponseModel = UserProfileDataResponseModel.fromJson(response.data);
      _responseUser =_userProfileDataResponseModel!.responseUser;
      isUser =true ;
      _isLoadingState=false;
      notifyListeners();
    }else{
      _isLoadingState = false;
      isUser =false ;
      notifyListeners();
    }
  }
  catch(e){
    _isLoadingState = false;
    isUser =false ;
    notifyListeners();
  }

  return isUser;
}

Future<bool> userProfileUpdateRequest(UserProfileUpdateRequestModel userProfileUpdateRequestModel) async {
  _isLoadingState =true ;
  bool isUpdate=false;
  _userProfileUpdateRequestResponseModel =null ;
  try{
    Response response= await _userProfileService.userProfileUpdate(userProfileUpdateRequestModel);
    if(response.statusCode == 200){
      _userProfileUpdateRequestResponseModel = UserProfileUpdateRequestResponseModel.fromJson(response.data);
      _user = _userProfileUpdateRequestResponseModel!.user;
      _isLoadingState=false;
      isUpdate = true;
      notifyListeners();
    } else {
      _isLoadingState = false;
      isUpdate = false;
      notifyListeners();
    }
  }
  catch(e){
    _isLoadingState = false;
    isUpdate = false;
    notifyListeners();
  }
  return isUpdate;

}








  String businessType(int businessType) {
    if (businessType == 1) {
      return 'Retailer/Shop';
    } else if (businessType == 2) {
      return 'Wholesaler';
    } else if (businessType == 3) {
      return 'Distributor';
    } else if (businessType == 4) {
      return 'Manufacturer';
    } else if (businessType == 6) {
      return 'Services';
    } else if (businessType == 7) {
      return 'Others';
    } else {
      return 'Unknown';
    }
  }
}
