import 'dart:developer';


import 'package:buisness_manager/model/service/remote/api_response.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_create_response_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_update_responseModel.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/transactions_list_response_model.dart';
import 'package:buisness_manager/modules/transaction/model/service/transaction_service.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionViewModel extends ChangeNotifier {
  final TransactionService _transactionService = TransactionRemoteDataSource();
  bool _isLoadingState = false;
  TransactionCreateResponseModel? _transactionCreateResponseModel;
  TransactionUpdateResponseModel? _transactionUpdateResponseModel;
  TransactionsListResponseModel? _transactionsListResponseModel;
  Transactions? _transactions;
  List<Transaction> _transaction=[];
  List<Transaction>? _newTransaction;
  int _limit=10;
  int _page=1;

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


  ///for customer list fetch pagination

  void resetPage(){
    _page=1;
    _limit=10;
    notifyListeners();
  }
  void pageCounter({required BuildContext context}){
    ++_page;
    notifyListeners();
  }

  void clearList(){
    _transaction.clear();
    notifyListeners();
  }



  bool get isLoadingState => _isLoadingState;
  TransactionCreateResponseModel? get transactionCreateResponseModel => _transactionCreateResponseModel;
  TransactionUpdateResponseModel? get transactionUpdateResponseModel => _transactionUpdateResponseModel;
  TransactionsListResponseModel? get transactionsListResponseModel => _transactionsListResponseModel;
  Transactions? get transactions => _transactions;
  List<Transaction> get transaction => _transaction;
  List<Transaction>? get newTransaction => _newTransaction;
  int? get page => _page;
  int? get limit => _limit;

  Future<bool> transactionListFetch(BuildContext context,{required String branchID,required String customerOrSupplierID,dynamic page, dynamic limit}) async {
    _isLoadingState=true;
    bool isFetched = false;
    _transactionsListResponseModel = null;
    if(page ==1){
      _transaction=[];
    }
    try {
      ApiResponse apiResponse = await _transactionService.transactionList(branchId: branchID, customerOrSupplierId: customerOrSupplierID,page: page,limit: limit);
      if(apiResponse.response !=null){
        if (apiResponse.response!.statusCode == 200) {
          _transactionsListResponseModel = TransactionsListResponseModel.fromJson(apiResponse.response!.data);
          _newTransaction = _transactionsListResponseModel!.transactions!.transactionList!;
          _transaction = _transaction + _newTransaction!;
          log('transactions.........................=>${_transaction.length}');
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
          resetPage();
          clearList();
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
          resetPage();
          clearList();
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
