

import 'dart:developer';
import 'package:buisness_manager/model/service/local/shared_pre_service.dart';
import 'package:buisness_manager/model/service/remote/api_error_handler.dart';
import 'package:buisness_manager/model/service/remote/api_response.dart';
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
  final SharedPreService _sharedPreService =SharedPreService();
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

  Future<bool> isLoggedIn() async {

    // String? token = await _sharedPreService.read(key: 'token');
    String? token = await _authService.getToken();
    return token != null && token.isNotEmpty;
  }
  // Future<void> saveToken(String token) async {
  //   await _sharedPreService.write(key: 'token', value: token);
  // }



  void setLogInOtpResponseModel(LogInOtpResponseModel logInOtpResponseModel){
    _logInOtpResponseModel = logInOtpResponseModel;
    notifyListeners();
  }
  void setLogInResponseModel(LogInResponseModel? logInResponseModel){
    _logInResponseModel = logInResponseModel;
    notifyListeners();
  }
  void setUser(User? user) {
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


  Future<bool> registration(RegisterRequestModel registerRequestModel,BuildContext context)async{
    _isLoadingState = true ;
    bool isRegister= false;
    _registerRequestResponseModel =null ;
    try {
      ApiResponse apiResponse=await _authService.register(registerRequestModel);
      if(apiResponse.response!=null){
        if(apiResponse.response!.statusCode == 200 && apiResponse.response!.data["status"]==200){
          _registerRequestResponseModel = RegisterRequestResponseModel.fromJson(apiResponse.response!.data);
          _isLoadingState= false;
          isRegister = true ;
          notifyListeners();
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              backgroundColor:  Colors.green,
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
        else {
          _isLoadingState = false ;
          isRegister = false ;
          notifyListeners();
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              backgroundColor: const Color(0xffFF0000),
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
      }else{
        _isLoadingState = false ;
        isRegister = false ;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${apiResponse.error}',style: const TextStyle(color: Colors.white),)),
          ));
        }
      }
    }
    catch(e){
      _isLoadingState = false ;
      isRegister = false ;
      notifyListeners();
      if(context.mounted){
        log("$e");
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          // backgroundColor: const Color(0xffFF0000),
          backgroundColor: Colors.greenAccent,
          content: Center(child: Text('$e',style: const TextStyle(color: Colors.white),)),
        ));
      }
    }
    return isRegister;
  }
  Future<bool> registrationVerifyOtp(RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel,BuildContext context)async{
    _isLoadingState = false ;
    bool isRegister= false;
    _registerVerifyOtpResponseModel = null ;
    try{
      ApiResponse apiResponse = await _authService.verifyOtp(verifyOtpRegisterRequestModel);
      // log("=============>${response.statusCode}");
     if(apiResponse.response !=null){
       if(apiResponse.response!.statusCode == 200 && apiResponse.response!.data["status"]==200){
         _registerVerifyOtpResponseModel = RegisterVerifyOtpResponseModel.fromJson(apiResponse.response!.data);
         _isLoadingState =false;
         isRegister =true ;
         notifyListeners();
         if(context.mounted){
           ScaffoldMessenger.of(context).removeCurrentSnackBar();
           ScaffoldMessenger.of(context).showSnackBar( SnackBar(
             backgroundColor: Colors.green,
             content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
           ));
         }
       }
       else {
         _isLoadingState = false ;
         isRegister = false;
         notifyListeners();
         if(context.mounted){
           ScaffoldMessenger.of(context).removeCurrentSnackBar();
           ScaffoldMessenger.of(context).showSnackBar( SnackBar(
             backgroundColor: const Color(0xffFF0000),
             content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
           ));
         }

       }
     }
      else{
        _isLoadingState = false ;
        isRegister = false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${apiResponse.error}',style: const TextStyle(color: Colors.white),)),
          ));
        }
      }
    }
    catch(e){
      _isLoadingState = false ;
      isRegister = false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Center(child: Text('$e',style: const TextStyle(color: Colors.white),)),
        ));
      }
    }
    return isRegister;
  }

  Future<bool> sendOtpForLogin(SendOtpRequestForLoginModel sendOtpRequestForLoginModel,BuildContext context)async{
    _isLoadingState=true;
    bool isOtpSend=false;
    _logInOtpResponseModel=null;

    try{
      ApiResponse apiResponse= await _authService.sendOtpForLogin(sendOtpRequestForLoginModel);
      if(apiResponse.response!=null){
        if(apiResponse.response!.statusCode == 200 && apiResponse.response!.data["status"]==200){
          _logInOtpResponseModel= LogInOtpResponseModel.fromJson(apiResponse.response!.data);
          _isLoadingState=false;
          isOtpSend=true;
          notifyListeners();
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
        else{
          _isLoadingState=false;
          isOtpSend=false;
          notifyListeners();
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              backgroundColor: const Color(0xffFF0000),
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
      }
      else{
        _isLoadingState=false;
        isOtpSend=false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${apiResponse.error}',style: const TextStyle(color: Colors.white),)),
          ));
        }

      }

    }catch(e){
      _isLoadingState=false;
      isOtpSend=false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Center(child: Text('$e',style: const TextStyle(color: Colors.white),)),
        ));
      }
    }
    return isOtpSend;
  }

  Future<bool> logInWithOtp(LogInRequestModel logInRequestModel ,BuildContext context)async{
    _isLoadingState = true;
    bool isLogIn=false;
    _logInResponseModel=null;
    _user=null;
    
    try{
      ApiResponse apiResponse= await _authService.logInWithOtp(logInRequestModel);
      if(apiResponse.response != null){
        if(apiResponse.response!.statusCode==200 && apiResponse.response!.data["status"]==200){
          _logInResponseModel=LogInResponseModel.fromJson(apiResponse.response!.data);
          _user = _logInResponseModel!.user;
          String? token = _user?.apiToken;
          _authService.saveAuthToken(token);
          _authService.updateDioService(_authService.getDioServiceInstance());
          _isLoadingState=false;
          isLogIn=true;
          notifyListeners();
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              backgroundColor: const Color(0xff00ff0d),
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
        else{
          _isLoadingState =false;
          isLogIn=false;
          notifyListeners();
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: const Color(0xffFF0000),
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
      }
      else{
        _isLoadingState=false;
        isLogIn=false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${apiResponse.error}',style: const TextStyle(color: Colors.white),)),
          ));
        }
      }
      
    }catch(e){
      _isLoadingState=false;
      isLogIn=false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Center(child: Text('$e',style: const TextStyle(color: Colors.white),)),
        ));
      }
    }
    return isLogIn;
  }

  Future<bool> logOut(BuildContext context) async {
    try {
      setIsLoadingState(true);
      ApiResponse apiResponse = await _authService.logOut();
      setIsLoadingState(false);
      if(apiResponse.response != null){
        if (apiResponse.response!.statusCode == 200) {
          setUser(null);
          _authService.clearToken('token');
          _authService.updateDioService(_authService.getDioServiceInstance());
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              backgroundColor: const Color(0xff22ff00),
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
          return true;
        }
        else{
          if(context.mounted){
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              backgroundColor: const Color(0xffFF0000),
              content: Center(child: Text('${apiResponse.response!.data["description"]}',style: const TextStyle(color: Colors.white),)),
            ));
          }
          return false;
        }
      }

  else {
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${apiResponse.error}',style: const TextStyle(color: Colors.white),)),
          ));
        }
        return false;
      }
    } catch (e) {
      setIsLoadingState(false);
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text('Failed to logout. Please try again later'))),
        );
      }
      return false;
    }
  }



}