import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/api_error_handler.dart';
import 'package:buisness_manager/model/service/remote/api_response.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class TransactionService {
  Future<ApiResponse> transactionList({required String branchId,required String customerOrSupplierId,dynamic  page, dynamic limit});
  Future<ApiResponse> transactionCreate(TransactionCreateRequestModel transactionCreateRequestModel,{required String branchID});
  Future<ApiResponse> transactionUpdate(TransactionUpdateRequestModel transactionUpdateRequestModel,{required String branchID,required String transactionID });
  Future<ApiResponse> transactionDelete({required String branchID,required String transactionID });
}

class TransactionRemoteDataSource extends TransactionService {
  static final TransactionRemoteDataSource _singleton = TransactionRemoteDataSource._internal();
    DioService? _dioService;
  factory TransactionRemoteDataSource() {
    return _singleton;
  }

  TransactionRemoteDataSource._internal(){
   _dioService = DioService();
  }

  @override
  Future<ApiResponse> transactionList({required String branchId,required String customerOrSupplierId,dynamic page, dynamic limit}) async {
    ApiUrl.branchId=branchId;
    ApiUrl.customerOrSupplierID=customerOrSupplierId.toString();
   try{
     Response? response = await _dioService!.get(ApiUrl().transactionList,queryParameters: {
       'page': page,
       'limit':limit,

     });
     return ApiResponse.withSuccess(response!);
   }catch(e){
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }

  @override
  Future<ApiResponse> transactionCreate(TransactionCreateRequestModel transactionCreateRequestModel,{required String branchID}) async {
    ApiUrl.branchId=branchID;
    try{
      Response? response = await _dioService!.post(ApiUrl().transactionCreate, data: transactionCreateRequestModel.toJson());
      return ApiResponse.withSuccess(response!);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> transactionUpdate(TransactionUpdateRequestModel transactionUpdateRequestModel,
      {required String branchID,required String transactionID }) async {
    ApiUrl.branchId=branchID;
    ApiUrl.transactionID=transactionID;
   try{
     Response? response = await _dioService!.post(ApiUrl().transactionUpdate, data: transactionUpdateRequestModel.toJson());
     return ApiResponse.withSuccess(response!);
   }catch(e){
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }

  @override
  Future<ApiResponse> transactionDelete({required String branchID,required String transactionID }) async {
    ApiUrl.branchId=branchID;
    ApiUrl.transactionID=transactionID;
    try{
      Response? response = await _dioService!.delete(ApiUrl().transactionDelete);
      return ApiResponse.withSuccess(response!);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
