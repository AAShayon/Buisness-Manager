import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class TransactionService {
  Future<Response> transactionList({required String branchId,required String customerOrSupplierId});
  Future<Response> transactionCreate(TransactionCreateRequestModel transactionCreateRequestModel,{required String branchID});
  Future<Response> transactionUpdate(TransactionUpdateRequestModel transactionUpdateRequestModel,{required String branchID,required String transactionID });
  Future<Response> transactionDelete({required String branchID,required String transactionID });
}

class TransactionRemoteDataSource extends TransactionService {
  static final TransactionRemoteDataSource _singleton = TransactionRemoteDataSource._internal();
  final _dioService = DioService();

  factory TransactionRemoteDataSource() {
    return _singleton;
  }

  TransactionRemoteDataSource._internal();

  @override
  Future<Response> transactionList({required String branchId,required String customerOrSupplierId}) async {
    ApiUrl.branchId=branchId;
    ApiUrl.customerOrSupplierID=customerOrSupplierId.toString();
    Response? response = await _dioService.get(ApiUrl().transactionList);
    return response!;
  }

  @override
  Future<Response> transactionCreate(TransactionCreateRequestModel transactionCreateRequestModel,{required String branchID}) async {
    ApiUrl.branchId=branchID;
    Response? response = await _dioService.post(ApiUrl().transactionCreate, data: transactionCreateRequestModel.toJson());
    return response!;
  }

  @override
  Future<Response> transactionUpdate(TransactionUpdateRequestModel transactionUpdateRequestModel,
      {required String branchID,required String transactionID }) async {
    ApiUrl.branchId=branchID;
    ApiUrl.transactionID=transactionID;
    Response? response = await _dioService.post(ApiUrl().transactionUpdate, data: transactionUpdateRequestModel.toJson());
    return response!;
  }

  @override
  Future<Response> transactionDelete({required String branchID,required String transactionID }) async {
    ApiUrl.branchId=branchID;
    ApiUrl.transactionID=transactionID;
    Response? response = await _dioService.delete(ApiUrl().transactionDelete);
    return response!;
  }


}



// Future<Response> transactionDelete(String transactionId) async {
//   Response? response = await _dioService.delete("${ApiUrl().transactionDelete}/$transactionId");
//   return response!;
// }
// Future<Response> transactionDelete(String transactionId);