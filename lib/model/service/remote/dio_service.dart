
import 'dart:developer';
import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:dio/dio.dart';

class DioService{
  static final DioService _singleton=DioService._internal();
  final _dio=Dio();

  factory DioService(){
    return _singleton;
  }
  DioService._internal(){
    setup();
  }

  Future<void> setup({String? bearerToken})async{
    try{
      final headers={
        'Content_type':'application/json',
      };
      if(bearerToken != null){
        headers['Authorization']='Bearer $bearerToken';
      }
      final options=BaseOptions(
          baseUrl: ApiUrl.baseUrl,
          headers: headers,
          validateStatus: (v){
            if(v == null){
              return false;
            }
            else {
              return v< 500 ;
            }
          }

      );
      _dio.options=options;

    }catch(e){
      print(e);
    }
  }
  Future<Response?> post(String path , {Map? data})async{
    log(path);
    try{
      final response= await _dio.post(path,data: data);
      log("${response.statusCode}");
      return response;
    }
    catch (e){print(e);}
    return null;
  }
  Future<Response?> get(String path,{Map<String,dynamic>? data}) async {
    try{
      final response=await _dio.get(path,queryParameters: data);
      return response;
    }catch(e){print(e);}
    return null;
  }

}