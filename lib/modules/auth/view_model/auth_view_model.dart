

import 'package:buisness_manager/modules/auth/model/core/request_model/logIn_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/send_login_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_otp_response_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/auth/model/service/remote/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
  /*
  * --------------------------getters----------------------------------------
  * */
  bool get isLoadingState=>_isLoadingState;
  LogInOtpResponseModel? get logInOtpResponseModel=> _logInOtpResponseModel;
  LogInResponseModel? get logInResponseModel => _logInResponseModel;
  User? get user =>_user;
  /*
  * --------------------------methods----------------------------------------
  * */
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
}