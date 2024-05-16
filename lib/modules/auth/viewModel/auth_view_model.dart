

import 'dart:developer';

import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/logIn_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/register_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/login_send_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/register_verify_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_otp_response_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/register_request_response_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/register_verify_otp_response_model.dart';
import 'package:buisness_manager/modules/auth/model/service/remote/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier{

  /*
  * --------------------------attributes----------------------------------------
  * */
  final AuthService _authService =AuthRemoteDataSource();
  bool _isLoadingState = false;
  LogInOtpResponseModel? _logInOtpResponseModel;
  LogInResponseModel? _logInResponseModel;
  User? _user;
  RegisterRequestResponseModel? _registerRequestResponseModel;
  RegisterVerifyOtpResponseModel? _registerVerifyOtpResponseModel;
  /*
  * --------------------------setter----------------------------------------
  * */

  void setIsLoadingState(bool isLoading){
    _isLoadingState = isLoading;
    notifyListeners();
  }
  void setLogInOtpResponseModel(LogInOtpResponseModel logInOtpResponseModel){
    _logInOtpResponseModel = logInOtpResponseModel;
    notifyListeners();
  }
  void setLogInResponseModel(LogInResponseModel? logInResponseModel){
    _logInResponseModel = logInResponseModel;
    notifyListeners();
  }
  void setUser(User? user){
    _user = user;
    notifyListeners();
  }

  void setRegisterRequestResponseModel(RegisterRequestResponseModel? registerRequestResponseModel){
    _registerRequestResponseModel = registerRequestResponseModel;
    notifyListeners();
  }
  void setRegisterVerifyOtpResponseModel(RegisterVerifyOtpResponseModel? registerVerifyOtpResponseModel){
    _registerVerifyOtpResponseModel =registerVerifyOtpResponseModel;
    notifyListeners();
  }
  /*
  * --------------------------getters----------------------------------------
  * */
  bool get isLoadingState=>_isLoadingState;
  LogInOtpResponseModel? get logInOtpResponseModel=> _logInOtpResponseModel;
  LogInResponseModel? get logInResponseModel => _logInResponseModel;
  User? get user =>_user;
  RegisterRequestResponseModel? get registerRequestResponseModel => _registerRequestResponseModel ;
  RegisterVerifyOtpResponseModel? get registerVerifyOtpResponseModel => _registerVerifyOtpResponseModel;
  /*
  * --------------------------methods----------------------------------------
  * */

  Future<bool> registration(RegisterRequestModel registerRequestModel)async{
    _isLoadingState = true ;
    bool isRegister= false;
    _registerRequestResponseModel =null ;
    try {
      Response response=await _authService.register(registerRequestModel);
      log("=======^&^&^&^&^&^&^&^&^&==>${response.statusCode}");
      if(response.statusCode == 200){
        _registerRequestResponseModel = RegisterRequestResponseModel.fromJson(response.data);
        _isLoadingState= false;
        isRegister = true ;
        notifyListeners();
      }
      else {
        _isLoadingState = false ;
        isRegister = false ;
        notifyListeners();
      }
    }
        catch(e){
          _isLoadingState = false ;
          isRegister = false ;
          notifyListeners();
        }
        return isRegister;
  }
  Future<bool> registrationVerifyOtp(RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel)async{
    _isLoadingState = false ;
    bool isRegister= false;
    _registerVerifyOtpResponseModel = null ;
    try{
      Response response = await _authService.verifyOtp(verifyOtpRegisterRequestModel);
      log("=============>${response.statusCode}");
      if(response.statusCode == 200){
        _registerVerifyOtpResponseModel = RegisterVerifyOtpResponseModel.fromJson(response.data);
        _isLoadingState =false;
        isRegister =true ;
        notifyListeners();
      }
      else{
        _isLoadingState = false ;
        isRegister = false;
        notifyListeners();
      }
    }
        catch(e){
          _isLoadingState = false ;
          isRegister = false;
          notifyListeners();
        }
        return isRegister;
  }

  Future<bool> sendOtpForLogin(SendOtpRequestForLoginModel sendOtpRequestForLoginModel,BuildContext context)async{
    setIsLoadingState(true);
    bool isOtpSend=false;
    setLogInResponseModel(null);
    setUser(null);

    try{
      Response response= await _authService.sendOtpForLogin(sendOtpRequestForLoginModel);
      if(response.data["status"]==200){
        setLogInOtpResponseModel(LogInOtpResponseModel.fromJson(response.data));
        setIsLoadingState(false);
        isOtpSend=true;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Center(child: Text('SuccessFully Send otp'),))
          );
        }
      }else{
        setIsLoadingState(false);
        isOtpSend=false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Center(child: Text('Sorry Your Number is Not Register Yet ,Please try again or sign up'),))
          );
        }

      }

    }catch(e){
      setIsLoadingState(false);
      isOtpSend=false;
      notifyListeners();
    }
    return isOtpSend;
  }

  Future<bool> logInWithOtp(LogInRequestModel logInRequestModel)async{
    _isLoadingState = true;
    bool isLogIn=false;
    _logInResponseModel=null;
    _user=null;
    
    try{
      Response response= await _authService.logInWithOtp(logInRequestModel);
      if(response.statusCode==200){
        _logInResponseModel=LogInResponseModel.fromJson(response.data);
        _user = _logInResponseModel!.user;
        String? token = _user?.apiToken;
        DioService().setup(bearerToken: token);
        _isLoadingState=false;
        isLogIn=true;
        notifyListeners();
      }else{
        _isLoadingState=false;
        isLogIn=false;
        notifyListeners();
      }
      
    }catch(e){
      _isLoadingState=false;
      isLogIn=false;
      notifyListeners();
    }
    return isLogIn;
  }

  Future<void> logOut(BuildContext context) async {
    try {
      setIsLoadingState(true);
      Response response = await _authService.logOut();
      setIsLoadingState(false);

      if (response.statusCode == 200) {
        setUser(null);
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Center(child: Text('Logged out successfully'))),
          );
        }
        // Navigate to the login page or any other appropriate screen after logout
      } else {
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Center(child: Text('Failed to logout. Please try again later'))),
          );
        }
      }
    } catch (e) {
      setIsLoadingState(false);
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text('Failed to logout. Please try again later'))),
        );
      }
    }
  }



}