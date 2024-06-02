


import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/local/shared_pre_service.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/register_verify_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/logIn_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/register_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/resend_register_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/login_send_otp_request_model.dart';
import 'package:dio/dio.dart';

abstract class AuthService{
  DioService getDioServiceInstance();
  Future<Response> logInWithOtp(LogInRequestModel logInRequestModel);
  Future<Response> register(RegisterRequestModel registerRequestModel);
  Future<Response> verifyOtp(RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel);
  Future<Response> resendOtpForRegister(ResendRegisterOtpRequestModel registerOtpRequestModel);
  Future<Response> sendOtpForLogin(SendOtpRequestForLoginModel sendOtpRequestForLoginModel);
  Future<Response> logOut();
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
  Future<Response> logInWithOtp(LogInRequestModel logInRequestModel) async{
    Response? response= await _dioService.post(ApiUrl().login, data:logInRequestModel.toJson());
    return response!;
  }
  @override
  Future<Response> sendOtpForLogin(SendOtpRequestForLoginModel sendOtpRequestForLoginModel) async{
    Response? response= await _dioService.post(ApiUrl().sendLoginOtp,data: sendOtpRequestForLoginModel.toJson());
    return response!;
  }

  @override
  Future<Response> logOut() async{
    Response? response= await _dioService.post(ApiUrl().logout);
    return response!;
  }

  @override
  Future<Response> register(RegisterRequestModel registerRequestModel) async{
    Response? response= await _dioService.post(ApiUrl().registration,data: registerRequestModel.toJson());
    return response!;
  }
  @override
  Future<Response> verifyOtp(RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel) async{
    Response? response= await _dioService.post(ApiUrl().signUpVerifyOtp,data: verifyOtpRegisterRequestModel.toJson());
    return response!;
  }

  @override
  Future<Response> resendOtpForRegister(ResendRegisterOtpRequestModel registerOtpRequestModel) async{
    Response? response= await _dioService.post(ApiUrl().registration,data: registerOtpRequestModel.toJson());
    return response!;
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
    // await _sharedPreService.delete(key: 'user');
    await _sharedPreService.delete(key: 'token');
  }







}