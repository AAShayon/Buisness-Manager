import 'dart:async';
import 'dart:developer';
import 'package:buisness_manager/model/service/local/shared_pre_service.dart';
import 'package:buisness_manager/modules/admin/model/core/request_model/user_profile_update_request_model.dart';
import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_data_response_model.dart';
import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_update_request_response_model.dart';
import 'package:buisness_manager/modules/admin/model/core/service/remote/user_profile_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserProfileViewModel extends ChangeNotifier{
  final UserProfileService _userProfileService=UserProfileDataSource();
  final SharedPreService _sharedPreService = SharedPreService();

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
    if (responseUser != null) {
      _sharedPreService.write(key: 'responseUser', value: _responseUser!.toJson());
    } else {
      _sharedPreService.delete(key: 'responseUser');
    }
    notifyListeners();
  }

  ///--getter----\\\

  bool get isLoadingState=>_isLoadingState;
  UserProfileDataResponseModel? get userProfileDataResponseModel => _userProfileDataResponseModel;
  UserProfileUpdateRequestResponseModel? get userProfileUpdateRequestResponseModel => _userProfileUpdateRequestResponseModel;
  ResponseUser? get responseUser => _responseUser;
  User? get user => _user;



  ///---------Methods ---------\\\\

Future<bool> getUserProfile(BuildContext context) async{
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
      if (responseUser != null) {
        _userProfileService.saveUser(_responseUser);
      }
      else {
        _userProfileService.clearUser();
      }

      isUser =true ;
      _isLoadingState=false;
      notifyListeners();
      // ${response.data["status"]}
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: Colors.green,
          content: Center(child: Text('${response.data["description"] }',style: const TextStyle(color: Colors.white),)),
        ));
      }
    }else{
      _isLoadingState = false;
      isUser =false ;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Center(child: Text(' ${response.data["status"]}${response.data["msg"] }',style: const TextStyle(color: Colors.white),)),
        ));
      }
    }
  }
  catch(e){
    _isLoadingState = false;
    isUser =false ;
    notifyListeners();
  }

  return isUser;
}

Future<bool> userProfileUpdateRequest(UserProfileUpdateRequestModel userProfileUpdateRequestModel,BuildContext context) async {
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
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor:  Colors.green,
          content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
        ));
      }
    } else {
      _isLoadingState = false;
      isUpdate = false;
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
    _isLoadingState = false;
    isUpdate = false;
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
  Future<bool> deleteUserProfile(BuildContext context) async {
    _isLoadingState = true;
    bool isDeleted = false;
    try {
      Response response = await _userProfileService.userDeleteProfile();
      // log("Delete Profile Response Status Code: ${response.statusCode}");
      // log("Delete Profile Response Data: ${response.data}");
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _isLoadingState =false;
        _userProfileService.clearUser();
        isDeleted = true;
        notifyListeners();
        // if(context.mounted){
        //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
        //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        //     backgroundColor: const Color(0xffFF0000),
        //     content: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),),
        //   ));
        // }
      } else {
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
    } catch (e) {
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
