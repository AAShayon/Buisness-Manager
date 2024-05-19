import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:dio/dio.dart';

abstract class TransactionService {
  Future<Response> transactionList();
  Future<Response> transactionCreate(TransactionCreateRequestModel transactionCreateRequestModel);
  Future<Response> transactionUpdate(TransactionUpdateRequestModel transactionUpdateRequestModel);

  Future<Response> transactionDelete();
}

class TransactionRemoteDataSource extends TransactionService {
  static final TransactionRemoteDataSource _singleton = TransactionRemoteDataSource._internal();
  final _dioService = DioService();

  factory TransactionRemoteDataSource() {
    return _singleton;
  }

  TransactionRemoteDataSource._internal();

  @override
  Future<Response> transactionList() async {
    Response? response = await _dioService.get(ApiUrl().transactionList);
    return response!;
  }

  @override
  Future<Response> transactionCreate(TransactionCreateRequestModel transactionCreateRequestModel) async {
    Response? response = await _dioService.post(ApiUrl().transactionCreate, data: transactionCreateRequestModel.toJson());
    return response!;
  }

  @override
  Future<Response> transactionUpdate(TransactionUpdateRequestModel transactionUpdateRequestModel) async {
    Response? response = await _dioService.post(ApiUrl().transactionUpdate, data: transactionUpdateRequestModel.toJson());
    return response!;
  }

  @override
  Future<Response> transactionDelete() async {
    Response? response = await _dioService.delete(ApiUrl().transactionDelete);
    return response!;
  }


}



// Future<Response> transactionDelete(String transactionId) async {
//   Response? response = await _dioService.delete("${ApiUrl().transactionDelete}/$transactionId");
//   return response!;
// }
// Future<Response> transactionDelete(String transactionId);