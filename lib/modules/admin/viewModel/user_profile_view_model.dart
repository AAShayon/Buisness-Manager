
import 'dart:developer';

import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_response.dart';
import 'package:buisness_manager/modules/admin/model/core/service/remote/user_profile_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UserProfileViewModel extends ChangeNotifier{
  final UserProfileService _userProfileService=UserProfileDataSource();
  bool _isLoadingState=false;
  UserProfileResponse? _userProfileResponse;
  ResponseUser? _responseUser;


  ///-----------------setter---------------\\\


  void setIsLoadingState(bool isLoading){
    _isLoadingState = isLoading;
    notifyListeners();
  }

  void setUserProfileResponse(UserProfileResponse userProfileResponse){
    _userProfileResponse = userProfileResponse;
    notifyListeners();
  }

  void setResponseUser(ResponseUser? responseUser){
    _responseUser = responseUser;
    notifyListeners();
  }

  ///--getter----\\\

  bool get isLoadingState=>_isLoadingState;
  UserProfileResponse? get userProfileResponse => _userProfileResponse;
  ResponseUser? get responseUser => _responseUser;

  ///---------Methods ---------\\\\

Future<bool> getUserProfile(UserProfileResponse userProfileResponse) async{
  _isLoadingState = true ;
  bool isUser= false;
  _userProfileResponse = null;
  try{
    Response response = await _userProfileService.userProfileData(userProfileResponse);
    log("response==================================>${response.statusCode}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    log("response==================================>${response.data}");
    if(response.statusCode == 200){
      _userProfileResponse = UserProfileResponse.fromJson(response.data);
      _isLoadingState= false;
      isUser =true ;
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




}