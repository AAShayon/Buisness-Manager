
import 'dart:developer';

import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/modules/customer/model/core/request_model/customer_create_request_model.dart';
import 'package:buisness_manager/modules/customer/model/core/request_model/customer_update_request_model.dart';
import 'package:buisness_manager/modules/customer/model/core/response_model/CustomerUpdateResponseModel.dart';
import 'package:buisness_manager/modules/customer/model/core/response_model/customer_create_response_model.dart';
import 'package:buisness_manager/modules/customer/model/core/response_model/customer_list_response_model.dart';
import 'package:buisness_manager/modules/customer/model/service/remote/customer_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerViewModel extends ChangeNotifier {
  CustomerService _customerService = CustomerRemoteDataSource();
  bool _isLoadingState = false;
  CustomerListResponseModel? _customerListResponseModel;
  CustomerCreateResponseModel? _customerCreateResponseModel;
  CustomerUpdateResponseModel? _customerUpdateResponseModel;
  Customers? _customers;


  ///////////////////////////////////////////////////////////

  void setIsLoadingState(bool isLoading) {
    _isLoadingState = isLoading;
    notifyListeners();
  }

  void setCustomerCreateResponseModel(CustomerCreateResponseModel customerCreateResponseModel) {
    _customerCreateResponseModel = customerCreateResponseModel;
    notifyListeners();
  }
  void setCustomerUpdateResponseModel(CustomerUpdateResponseModel customerUpdateResponseModel){
    _customerUpdateResponseModel =customerUpdateResponseModel;
    notifyListeners();

  }

  void setCustomerListResponseModel(CustomerListResponseModel customerListResponseModel){
   _customerListResponseModel = customerListResponseModel;
    notifyListeners();
  }
  void setCustomersList(Customers? customers) {
    _customers = customers;
    notifyListeners();
  }

  /////////////////////////

  bool get isLoadingState => _isLoadingState;
  CustomerListResponseModel? get customerListResponseModel => _customerListResponseModel;
  CustomerCreateResponseModel? get customerCreateResponseModel => _customerCreateResponseModel;
  CustomerUpdateResponseModel? get customerUpdateResponseModel => _customerUpdateResponseModel;
  Customers? get customers => _customers;

  ////////////////
  Future<bool> createCustomer(CustomerCreateRequestModel customerCreateRequestModel, BuildContext context,{required String branchId}) async {
    _isLoadingState = true;
    bool isCreate = false;
    _customerCreateResponseModel = null;
    _customers = null;
    try {
      Response response = await _customerService.customerCreate(customerCreateRequestModel, branchId: branchId);

      if (response.statusCode == 200 && response.data["status"] == 200) {
        _customerCreateResponseModel = CustomerCreateResponseModel.fromJson(response.data);
        _customers = _customerListResponseModel!.customers;
        log("============>check customer list${_customers!.customerList!.length}");
        _isLoadingState = false;
        isCreate = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      } else {
        _isLoadingState = false;
        isCreate = false;
        notifyListeners();
        if (context.mounted) {

          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      }
    } catch (e) {
      _isLoadingState = false;
      isCreate = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('$e', style: const TextStyle(color: Colors.white)),
        ));
      }
    }
    return isCreate;
  }

  Future<bool> updateCustomer(CustomerUpdateRequestModel customerUpdateRequestModel, BuildContext context,{required String branchId, required String customerOrSupplierId}) async {
    _isLoadingState = true;
    bool isUpdate = false;
    _customerUpdateResponseModel = null;
    try {
      Response response = await _customerService.customerUpdate(customerUpdateRequestModel, branchId: branchId, customerOrSupplierId: customerOrSupplierId);
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _customerUpdateResponseModel = CustomerUpdateResponseModel.fromJson(response.data);
        _isLoadingState = false;
        isUpdate = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      } else {
        _isLoadingState = false;
        isUpdate = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      }
    } catch (e) {
      _isLoadingState = false;
      isUpdate = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('$e', style: const TextStyle(color: Colors.white)),
        ));
      }
    }
    return isUpdate;
  }

  Future<bool> customerListFetch({required String branchId,required int customerOrSupplierType}) async {
    _isLoadingState = true;
    bool isCustomerListFetch = false;
    _customerListResponseModel = null;
    _customers = null;
    try {
      Response response = await _customerService.customerList(branchId: branchId,customerOrSupplierType: customerOrSupplierType);
      log('customer list=================>${response.data}');
      log('customer list=================>${response.data['status']}');
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _customerListResponseModel = CustomerListResponseModel.fromJson(response.data);
        _customers = _customerListResponseModel!.customers;
        _isLoadingState = false;
        isCustomerListFetch = true;
        notifyListeners();
      } else {
        _isLoadingState = false;
        isCustomerListFetch = false;
        notifyListeners();
      }
    } catch (e) {
      _isLoadingState = false;
      isCustomerListFetch = false;
      notifyListeners();
    }
    return isCustomerListFetch;
  }

  Future<bool> deleteCustomer(BuildContext context,{required String branchId,required customerOrSupplierId}) async {
    _isLoadingState = true;
    bool isDeleted = false;
    try {
      Response response = await _customerService.customerDelete(branchId: branchId,customerOrSupplierId: customerOrSupplierId);
      if (response.statusCode == 200 && response.data["status"] == 200) {
        _isLoadingState = false;
        isDeleted = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      } else {
        isDeleted = false;
        _isLoadingState = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color(0xffFF0000),
            content: Text('${response.data["description"]}', style: const TextStyle(color: Colors.white)),
          ));
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color(0xffFF0000),
          content: Text('$e', style: const TextStyle(color: Colors.white)),
        ));
      }
      isDeleted = false;
      _isLoadingState = false;
      notifyListeners();
    }
    return isDeleted;
  }


}