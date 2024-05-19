
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/TransactionsListResponseModel.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_create_response_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_update_responseModel.dart';
import 'package:buisness_manager/modules/transaction/model/service/transaction_service.dart';
import 'package:dio/dio.dart';
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

  Future<bool> createTransaction(TransactionCreateRequestModel transactionCreateRequestModel, BuildContext context) async {
   _isLoadingState =true;
    bool isCreated = false;
    _transactionCreateResponseModel=null;
    try {
      Response response = await _transactionService.transactionCreate(transactionCreateRequestModel);
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _transactionCreateResponseModel = TransactionCreateResponseModel.fromJson(response.data);
        _isLoadingState = false;
        isCreated = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      } else {
        _isLoadingState = false;
        isCreated = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
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
          content: Text('$e', style: const TextStyle(color: Colors.white)),
        ));
      }
    }
    return isCreated;
  }

  Future<bool> updateTransaction(TransactionUpdateRequestModel transactionUpdateRequestModel, BuildContext context) async {
    _isLoadingState =true;
      bool isUpdate=false ;
    _transactionUpdateResponseModel = null ;

    try {
      Response response = await _transactionService.transactionUpdate(transactionUpdateRequestModel);
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _transactionUpdateResponseModel= TransactionUpdateResponseModel.fromJson(response.data);
        _isLoadingState =false;
         isUpdate = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      } else {
        _isLoadingState =false;
        isUpdate = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
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
          content: Text('$e', style: const TextStyle(color: Colors.white)),
        ));
      }
    }
    return isUpdate;
  }

  Future<bool> transactionListFetch() async {
    _isLoadingState=true;
    bool isFetched = false;
    _transactionsListResponseModel = null;
    try {
      Response response = await _transactionService.transactionList();
      if (response.statusCode == 200) {
      _transactionsListResponseModel = TransactionsListResponseModel.fromJson(response.data);
        _transactions = _transactionsListResponseModel!.transactions;
        _isLoadingState=false;
         isFetched = true;
         notifyListeners();
      } else {
        _isLoadingState=false;
        isFetched = false;
        notifyListeners();
      }
    } catch (e) {
      _isLoadingState=false;
      isFetched = false;
      notifyListeners();
    }
    return isFetched;
  }

  Future<bool> deleteTransaction(BuildContext context) async {
    _isLoadingState = true;
    bool isDeleted = false;
    try {
      Response response = await _transactionService.transactionDelete();
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _isLoadingState =false;
        isDeleted = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      } else {
        isDeleted = false;
        _isLoadingState=false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
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
          content: Text('$e', style: const TextStyle(color: Colors.white)),
        ));
      }
    }
    return isDeleted;
  }
}
