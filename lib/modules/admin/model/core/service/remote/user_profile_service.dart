import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/local/shared_pre_service.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/admin/model/core/request_model/user_profile_update_request_model.dart';
import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_data_response_model.dart';
import 'package:dio/dio.dart';

abstract class UserProfileService{
  
  Future<Response> userProfile();
  Future<Response> userProfileUpdate(UserProfileUpdateRequestModel userProfileUpdateRequestModel);
  Future<Response> userDeleteProfile();
  Future<void> saveUser(ResponseUser? responseUser);
  Future<void> clearUser();

}

class UserProfileDataSource extends UserProfileService{
  static final UserProfileDataSource _singleton= UserProfileDataSource._internal();
  SharedPreService _sharedPreService=SharedPreService();
  final _dioService=DioService();
  factory UserProfileDataSource(){
    return _singleton;
  }
  UserProfileDataSource._internal();

  @override
  Future<Response> userProfile() async {
   Response? response= await  _dioService.get(ApiUrl().userProfile);
    return response!;
  }

  @override
  Future<Response> userProfileUpdate(UserProfileUpdateRequestModel userProfileUpdateRequestModel) async{
   Response? response = await _dioService.post(ApiUrl().userProfileUpdate,data: userProfileUpdateRequestModel.toJson());
   return response!;
  }

  @override
  Future<Response> userDeleteProfile() async {
   Response? response=await _dioService.request(ApiUrl().userAccountDelete);
   return response!;
  }

  @override
  Future<void> clearUser()async {
    await _sharedPreService.delete(key: 'responseUser');


  }

  @override
  Future<void> saveUser(ResponseUser? responseUser) async {
    if (responseUser != null) {
      await _sharedPreService.write(key: 'responseUser', value: responseUser.toJson());
    }
  }


  
}
