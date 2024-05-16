import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_response.dart';
import 'package:dio/dio.dart';

abstract class UserProfileService{
  
  Future<Response> userProfileData(UserProfileResponse userProfileResponse);
  
  
}

class UserProfileDataSource extends UserProfileService{
  static final UserProfileDataSource _singleton= UserProfileDataSource._internal();
  final _dioService=DioService();
  factory UserProfileDataSource(){
    return _singleton;
  }
  UserProfileDataSource._internal();
  
  @override
  Future<Response> userProfileData(UserProfileResponse userProfileResponse) async{
   Response? response= await _dioService.get(ApiUrl.userProfile);
   return response!;
  }
  
}