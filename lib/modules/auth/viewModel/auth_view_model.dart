

import 'dart:developer';
import 'package:buisness_manager/model/service/local/shared_pre_service.dart';
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

    String? token = await _sharedPreService.read(key: 'token');
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
      Response response=await _authService.register(registerRequestModel);
      log("=======^&^&^&^&^&^&^&^&^&==>${response.statusCode}");
      if(response.statusCode == 200 && response.data["status"]==200){
        _registerRequestResponseModel = RegisterRequestResponseModel.fromJson(response.data);
        _isLoadingState= false;
        isRegister = true ;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor:  Colors.green,
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
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
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
          ));
        }
      }
    }
    catch(e){
      _isLoadingState = false ;
      isRegister = false ;
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
  Future<bool> registrationVerifyOtp(RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel,BuildContext context)async{
    _isLoadingState = false ;
    bool isRegister= false;
    _registerVerifyOtpResponseModel = null ;
    try{
      Response response = await _authService.verifyOtp(verifyOtpRegisterRequestModel);
      log("=============>${response.statusCode}");
      if(response.statusCode == 200 && response.data["status"]==200){
        _registerVerifyOtpResponseModel = RegisterVerifyOtpResponseModel.fromJson(response.data);
        _isLoadingState =false;
        isRegister =true ;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: Colors.green,
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
          ));
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
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
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
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xff00ff3c),
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
          ));
        }
      }else{
        setIsLoadingState(false);
        isOtpSend=false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
          ));
        }

      }

    }catch(e){
      setIsLoadingState(false);
      isOtpSend=false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('$e',style: const TextStyle(color: Colors.white),),
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
      Response response= await _authService.logInWithOtp(logInRequestModel);
      if(response.statusCode==200 && response.data["status"]==200){
        _logInResponseModel=LogInResponseModel.fromJson(response.data);
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
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
          ));
        }
      }else{
        _isLoadingState=false;
        isLogIn=false;
        notifyListeners();
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
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

  Future<void> logOut(BuildContext context) async {
    try {
      setIsLoadingState(true);
      Response response = await _authService.logOut();
      setIsLoadingState(false);

      if (response.statusCode == 200) {
        setUser(null);
        _authService.clearToken('token');
        _authService.updateDioService(_authService.getDioServiceInstance());

        // await _sharedPreService.delete(key: 'user');
        // await _sharedPreService.delete(key: 'token');
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xff22ff00),
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
          ));
        }

      } else {
        if(context.mounted){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Center(child: Text('${response.data["description"]}',style: const TextStyle(color: Colors.white),)),
          ));
        }
      }
    } catch (e) {
      setIsLoadingState(false);
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text('Failed to logout. Please try again later'))),
        );
      }
    }
  }



}