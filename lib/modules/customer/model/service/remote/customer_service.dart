

import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/api_error_handler.dart';
import 'package:buisness_manager/model/service/remote/api_response.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/customer/model/core/request_model/customer_create_request_model.dart';
import 'package:buisness_manager/modules/customer/model/core/request_model/customer_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class CustomerService {
  Future<ApiResponse> customerList({required String branchId,required int customerOrSupplierType,dynamic  page, dynamic limit});
  Future<ApiResponse> customerCreate(CustomerCreateRequestModel customerCreateRequestModel, {required String branchId,required int customerOrSupplierType});
  Future<ApiResponse> customerUpdate(CustomerUpdateRequestModel customerUpdateRequestModel,{required String branchId,required String customerOrSupplierId });
  Future<ApiResponse> customerDelete({required String branchId, required String customerOrSupplierId});
  
}

class CustomerRemoteDataSource extends CustomerService{
  static final CustomerRemoteDataSource _singleton = CustomerRemoteDataSource._internal();
  DioService? _dioService;
  factory CustomerRemoteDataSource(){
    return _singleton;
  }
  CustomerRemoteDataSource._internal(){
    _dioService=DioService();
  }
  
  @override
  Future<ApiResponse> customerList({required String branchId,required int customerOrSupplierType, dynamic page, dynamic limit}) async {
    ApiUrl.branchId=branchId;
    ApiUrl.customerOrSupplierType=customerOrSupplierType.toString();
   try{
     Response? response= await _dioService!.get(ApiUrl().customerOrSupplierList,queryParameters: {
       'page': page,
       'limit':limit,

     });
     return ApiResponse.withSuccess(response!);
   }
   catch(e){
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }

  @override
  Future<ApiResponse> customerCreate(CustomerCreateRequestModel customerCreateRequestModel, {required String branchId,required int customerOrSupplierType})async {
    ApiUrl.branchId=branchId;
    try{
      Response? response =await _dioService!.post(ApiUrl().customerOrSupplierCreate,data: customerCreateRequestModel.toJson());
      return ApiResponse.withSuccess(response!);
    }
    catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> customerUpdate(CustomerUpdateRequestModel customerUpdateRequestModel,{required String branchId,required String customerOrSupplierId }) async{
   ApiUrl.branchId=branchId;
   ApiUrl.customerOrSupplierID=customerOrSupplierId;
   try{
     Response? response = await _dioService!.post(ApiUrl().customerOrSupplierUpdate,data: customerUpdateRequestModel.toJson());
     return ApiResponse.withSuccess(response!);
   }
       catch(e){
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
       }
  }

  @override
  Future<ApiResponse> customerDelete({required String branchId,required String customerOrSupplierId}) async {
   ApiUrl.branchId=branchId;
   ApiUrl.customerOrSupplierID=customerOrSupplierId;
   try{
     Response? response=await _dioService!.delete(ApiUrl().customerOrSupplierDelete);
     return ApiResponse.withSuccess(response!);
   }catch(e){
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }


}