import 'package:buisness_manager/model/service/remote/api_response.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/TransactionsListResponseModel.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_create_response_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_update_responseModel.dart';
import 'package:buisness_manager/modules/transaction/model/service/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionViewModel extends ChangeNotifier {
  final TransactionService _transactionService = TransactionRemoteDataSource();
  bool _isLoadingState = false;
  TransactionCreateResponseModel? _transactionCreateResponseModel;
  TransactionUpdateResponseModel? _transactionUpdateResponseModel;
  TransactionsListResponseModel? _transactionsListResponseModel;
  Transactions? _transactions;

  void setIsLoadingState(bool isLoading) {
    _isLoadingState = isLoading;
    notifyListeners();
  }

  void setTransactionCreateResponseModel(TransactionCreateResponseModel transactionCreateResponseModel) {
    _transactionCreateResponseModel = transactionCreateResponseModel;
    notifyListeners();
  }

  void setTransactionUpdateResponseModel(TransactionUpdateResponseModel transactionUpdateResponseModel) {
    _transactionUpdateResponseModel = transactionUpdateResponseModel;
    notifyListeners();
  }

  void setTransactionsListResponseModel(TransactionsListResponseModel transactionsListResponseModel) {
    _transactionsListResponseModel = transactionsListResponseModel;
    notifyListeners();
  }

  void setTransactions(Transactions? transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  bool get isLoadingState => _isLoadingState;

  TransactionCreateResponseModel? get transactionCreateResponseModel => _transactionCreateResponseModel;
  TransactionUpdateResponseModel? get transactionUpdateResponseModel => _transactionUpdateResponseModel;
  TransactionsListResponseModel? get transactionsListResponseModel => _transactionsListResponseModel;
  Transactions? get transactions => _transactions;

  Future<bool> createTransaction(TransactionCreateRequestModel transactionCreateRequestModel, BuildContext context,{required String branchID}) async {
    _isLoadingState =true;
    bool isCreated = false;
    _transactionCreateResponseModel=null;
    try {
      ApiResponse apiResponse = await _transactionService.transactionCreate(transactionCreateRequestModel, branchID: branchID);
      if(apiResponse.response != null){
        if (apiResponse.response!.statusCode == 200 && apiResponse.response!.data["status"] == 200) {
          _transactionCreateResponseModel = TransactionCreateResponseModel.fromJson(apiResponse.response!.data);
          _isLoadingState = false;
          isCreated = true;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
        else {
          _isLoadingState = false;
          isCreated = false;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
      }
    else {
        _isLoadingState = false;
        isCreated = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Center(child: Text('${apiResponse.error}', style: const TextStyle(color: Colors.white))),
          ));
        }
      }
    } catch (e) {
      _isLoadingState = false;
      isCreated = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(child: Text('$e', style: const TextStyle(color: Colors.white))),
        ));
      }
    }
    return isCreated;
  }

  Future<bool> updateTransaction(TransactionUpdateRequestModel transactionUpdateRequestModel, BuildContext context,{required String branchID,required String transactionID}) async {
    _isLoadingState =true;
    bool isUpdate=false ;
    _transactionUpdateResponseModel = null ;

    try {
      ApiResponse apiResponse = await _transactionService.transactionUpdate(transactionUpdateRequestModel, branchID: branchID, transactionID: transactionID);
      if(apiResponse.response != null){
        if (apiResponse.response!.statusCode == 200 && apiResponse.response!.data["status"] == 200) {
          _transactionUpdateResponseModel= TransactionUpdateResponseModel.fromJson(apiResponse.response!.data);
          _isLoadingState =false;
          isUpdate = true;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
        else {
          _isLoadingState =false;
          isUpdate = false;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
      }
      else {
        _isLoadingState =false;
        isUpdate = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Center(child: Text('${apiResponse.error}', style: const TextStyle(color: Colors.white))),
          ));
        }
      }
    } catch (e) {
      _isLoadingState =false;
      isUpdate = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(child: Text('$e', style: const TextStyle(color: Colors.white))),
        ));
      }
    }
    return isUpdate;
  }

  Future<bool> transactionListFetch(BuildContext context,{required String branchID,required String customerOrSupplierID}) async {
    _isLoadingState=true;
    bool isFetched = false;
    _transactionsListResponseModel = null;
    try {
      ApiResponse apiResponse = await _transactionService.transactionList(branchId: branchID, customerOrSupplierId: customerOrSupplierID);
      if(apiResponse.response !=null){
        if (apiResponse.response!.statusCode == 200) {
          _transactionsListResponseModel = TransactionsListResponseModel.fromJson(apiResponse.response!.data);
          _transactions = _transactionsListResponseModel!.transactions;
          _isLoadingState=false;
          isFetched = true;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
        else {
          _isLoadingState=false;
          isFetched = false;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
      }
      else {
        _isLoadingState=false;
        isFetched = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Center(child: Text('${apiResponse.error}', style: const TextStyle(color: Colors.white))),
          ));
        }
      }
    } catch (e) {
      _isLoadingState=false;
      isFetched = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(child: Text('$e', style: const TextStyle(color: Colors.white))),
        ));
      }
    }
    return isFetched;
  }

  Future<bool> deleteTransaction(BuildContext context,{required String branchID,required String transactionID}) async {
    _isLoadingState = true;
    bool isDeleted = false;
    try {
      ApiResponse apiResponse = await _transactionService.transactionDelete(branchID: branchID, transactionID: transactionID);
      if(apiResponse.response != null){
        if (apiResponse.response!.statusCode == 200 && apiResponse.response!.data["status"] == 200) {
          _isLoadingState =false;
          isDeleted = true;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
        else {
          isDeleted = false;
          _isLoadingState=false;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text('${apiResponse.response!.data["description"]}', style: const TextStyle(color: Colors.white))),
            ));
          }
        }
      }
     else {
        isDeleted = false;
        _isLoadingState=false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Center(child: Text('${apiResponse.error}', style: const TextStyle(color: Colors.white))),
          ));
        }
      }
    } catch (e) {
      isDeleted = false;
      _isLoadingState=false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(child: Text('$e', style: const TextStyle(color: Colors.white))),
        ));
      }
    }
    return isDeleted;
  }
}
