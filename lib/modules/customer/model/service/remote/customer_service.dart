

import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/customer/model/core/request_model/customer_create_request_model.dart';
import 'package:buisness_manager/modules/customer/model/core/request_model/customer_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class CustomerService {
  
  Future<Response> customerList({required String branchId,required int customerOrSupplierType});
  Future<Response> customerCreate(CustomerCreateRequestModel customerCreateRequestModel, {required String branchId,required int customerOrSupplierType});
  Future<Response> customerUpdate(CustomerUpdateRequestModel customerUpdateRequestModel,{required String branchId,required String customerOrSupplierId });
  Future<Response> customerDelete({required String branchId, required String customerOrSupplierId});
  
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
  Future<Response> customerList({required String branchId,required int customerOrSupplierType}) async {
    ApiUrl.branchId=branchId;
    ApiUrl.customerOrSupplierType=customerOrSupplierType.toString();
  Response? response= await _dioService!.get(ApiUrl().customerOrSupplierList);
  return response!;
  }


  @override
  Future<Response> customerUpdate(CustomerUpdateRequestModel customerUpdateRequestModel,{required String branchId,required String customerOrSupplierId }) async{
   ApiUrl.branchId=branchId;
   ApiUrl.customerOrSupplierID=customerOrSupplierId;
    Response? response = await _dioService!.post(ApiUrl().customerOrSupplierUpdate,data: customerUpdateRequestModel.toJson());
  return response!;
  }
  

  @override
  Future<Response> customerDelete({required String branchId,required String customerOrSupplierId}) async {
   ApiUrl.branchId=branchId;
   ApiUrl.customerOrSupplierID=customerOrSupplierId;
    Response? response=await _dioService!.delete(ApiUrl().customerOrSupplierDelete);

  return response!;
  }

  @override
  Future<Response> customerCreate(CustomerCreateRequestModel customerCreateRequestModel, {required String branchId,required int customerOrSupplierType})async {
  ApiUrl.branchId=branchId;
  Response? response =await _dioService!.post(ApiUrl().customerOrSupplierCreate,data: customerCreateRequestModel.toJson());
  return response!;
  }
  
}

//  @override
//   Future<Response> customerCreate(CustomerCreateRequestModel customerCreateRequestModel, {required String branchId}) async{
//     ApiUrl.branchId=branchId;
//   Response? response = await _dioService!.post(ApiUrl().customerOrSupplierCreate,data: customerCreateRequestModel.toJson());
//   return response!;
//   }