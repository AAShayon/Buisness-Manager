


import 'dart:developer';

import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/local/shared_pre_service.dart';
import 'package:buisness_manager/model/service/remote/api_error_handler.dart';
import 'package:buisness_manager/model/service/remote/api_response.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/register_verify_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/logIn_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/register_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/resend_register_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/login_send_otp_request_model.dart';
import 'package:dio/dio.dart';

abstract class AuthService{
  DioService getDioServiceInstance();
  Future<ApiResponse> logInWithOtp(LogInRequestModel logInRequestModel);
  Future<ApiResponse> register(RegisterRequestModel registerRequestModel);
  Future<ApiResponse> verifyOtp(RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel);
  Future<ApiResponse> resendOtpForRegister(ResendRegisterOtpRequestModel registerOtpRequestModel);
  Future<ApiResponse> sendOtpForLogin(SendOtpRequestForLoginModel sendOtpRequestForLoginModel);
  Future<ApiResponse> logOut();
  Future<void> updateDioService(DioService dioService);
  Future<void> saveAuthToken(String? token);
  Future<void> clearToken(String? token);
  Future<String?> getToken();

}

class AuthRemoteDataSource extends AuthService{
  static final AuthRemoteDataSource _singleton = AuthRemoteDataSource._internal();
   SharedPreService _sharedPreService=SharedPreService();
  late DioService _dioService;
  DioService? get dioService => _dioService;
  factory AuthRemoteDataSource(){
  return _singleton;
  }
  AuthRemoteDataSource._internal(){
    _dioService=DioService();
  }

  @override
  DioService getDioServiceInstance() {
   return _dioService;
  }

  @override
  Future<ApiResponse> logInWithOtp(LogInRequestModel logInRequestModel) async{
    try{
      Response? response = await _dioService.post(ApiUrl().login, data: logInRequestModel.toJson());
      log("===>${response!.toString()}");
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  @override
  Future<ApiResponse> sendOtpForLogin(SendOtpRequestForLoginModel sendOtpRequestForLoginModel) async{
   try{
     Response? response= await _dioService.post(ApiUrl().sendLoginOtp,data: sendOtpRequestForLoginModel.toJson());
     // log("===>${response!.toString()}");
     return ApiResponse.withSuccess(response!);
   } catch(e){
         log("===>$e");
         return ApiResponse.withError(ApiErrorHandler.getMessage(e));
       }
  }

  @override
  Future<ApiResponse> logOut() async{
   try{
     Response? response= await _dioService.post(ApiUrl().logout);
     log("===>${response!.toString()}");
     return ApiResponse.withSuccess(response);
   }
   catch(e){
     log("===>$e");
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }

  @override
  Future<ApiResponse> register(RegisterRequestModel registerRequestModel) async{
    try{
      Response? response= await _dioService.post(ApiUrl().registration,data: registerRequestModel.toJson());
      log("===>${response!.toString()}");
      return ApiResponse.withSuccess(response);
    }catch(e){
      log("===>$e");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  @override
  Future<ApiResponse> verifyOtp(RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel) async{
    try{
      Response? response= await _dioService.post(ApiUrl().signUpVerifyOtp,data: verifyOtpRegisterRequestModel.toJson());
      log("===>${response!.toString()}");

      return ApiResponse.withSuccess(response);
    }catch(e){
      log("===>$e");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> resendOtpForRegister(ResendRegisterOtpRequestModel registerOtpRequestModel) async{
   try{
     Response? response= await _dioService.post(ApiUrl().registration,data: registerOtpRequestModel.toJson());
     log("===>${response!.toString()}");

     return ApiResponse.withSuccess(response);
   }catch(e){
     log("===>$e");
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }

  @override
  Future<void> updateDioService(DioService dioService) async {
   dioService.setup();

  }

  @override
  Future<void> saveAuthToken(String? token) async{
    await _sharedPreService.write(key: 'token', value: token.toString());
  }

  @override
  Future<String?> getToken() async {
    return await _sharedPreService.read(key: 'token');
  }


  @override
  Future<void> clearToken(String? token) async {
    await _sharedPreService.delete(key: 'token');
  }







}