// import 'dart:convert';
//
// import 'package:buisness_manager/modules/transaction/model/core/response_model/transaction_information_response_model.dart';
// /// status : 200
// /// msg : "OK"
// /// description : "Transactions"
// /// transactions : {"per_page":10,"from":1,"to":1,"total":1,"current_page":1,"last_page":1,"prev_page_url":null,"first_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/164/transactions?page=1","next_page_url":null,"last_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/164/transactions?page=1","transaction":[{"id":53,"transaction_no":"1053","type":1,"amount":"500.00","transaction_date":"2024-06-04 01:33:00","details":"56","bill_no":"25","image":null,"image_full_path":null,"status":1}]}
//
// TransactionsListResponseModel transactionsListResponseModelFromJson(String str) => TransactionsListResponseModel.fromJson(json.decode(str));
// String transactionsListResponseModelToJson(TransactionsListResponseModel data) => json.encode(data.toJson());
// class TransactionsListResponseModel {
//   TransactionsListResponseModel({
//     dynamic status,
//     dynamic msg,
//     dynamic description,
//     Transactions? transactions,}){
//     _status = status;
//     _msg = msg;
//     _description = description;
//     _transactions = transactions;
//   }
//
//   TransactionsListResponseModel.fromJson(dynamic json) {
//     _status = json['status'];
//     _msg = json['msg'];
//     _description = json['description'];
//     _transactions = json['transactions'] != null ? Transactions.fromJson(json['transactions']) : null;
//   }
//   dynamic _status;
//   dynamic _msg;
//   dynamic _description;
//   Transactions? _transactions;
//   TransactionsListResponseModel copyWith({  dynamic status,
//     dynamic msg,
//     dynamic description,
//     Transactions? transactions,
//   }) => TransactionsListResponseModel(  status: status ?? _status,
//     msg: msg ?? _msg,
//     description: description ?? _description,
//     transactions: transactions ?? _transactions,
//   );
//   dynamic get status => _status;
//   dynamic get msg => _msg;
//   dynamic get description => _description;
//   Transactions? get transactions => _transactions;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     map['msg'] = _msg;
//     map['description'] = _description;
//     if (_transactions != null) {
//       map['transactions'] = _transactions?.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// per_page : 10
// /// from : 1
// /// to : 1
// /// total : 1
// /// current_page : 1
// /// last_page : 1
// /// prev_page_url : null
// /// first_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/164/transactions?page=1"
// /// next_page_url : null
// /// last_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/164/transactions?page=1"
// /// transaction : [{"id":53,"transaction_no":"1053","type":1,"amount":"500.00","transaction_date":"2024-06-04 01:33:00","details":"56","bill_no":"25","image":null,"image_full_path":null,"status":1}]
//
// Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));
// String transactionsToJson(Transactions data) => json.encode(data.toJson());
// class Transactions {
//   Transactions({
//     dynamic perPage,
//     dynamic from,
//     dynamic to,
//     dynamic total,
//     dynamic currentPage,
//     dynamic lastPage,
//     dynamic prevPageUrl,
//     dynamic firstPageUrl,
//     dynamic nextPageUrl,
//     dynamic lastPageUrl,
//     List<Transaction>? transaction,}){
//     _perPage = perPage;
//     _from = from;
//     _to = to;
//     _total = total;
//     _currentPage = currentPage;
//     _lastPage = lastPage;
//     _prevPageUrl = prevPageUrl;
//     _firstPageUrl = firstPageUrl;
//     _nextPageUrl = nextPageUrl;
//     _lastPageUrl = lastPageUrl;
//     _transaction = transaction;
//   }
//
//   Transactions.fromJson(dynamic json) {
//     _perPage = json['per_page'];
//     _from = json['from'];
//     _to = json['to'];
//     _total = json['total'];
//     _currentPage = json['current_page'];
//     _lastPage = json['last_page'];
//     _prevPageUrl = json['prev_page_url'];
//     _firstPageUrl = json['first_page_url'];
//     _nextPageUrl = json['next_page_url'];
//     _lastPageUrl = json['last_page_url'];
//     if (json['transaction'] != null) {
//       _transaction = [];
//       json['transaction'].forEach((v) {
//         _transaction?.add(Transaction.fromJson(v));
//       });
//     }
//   }
//   dynamic _perPage;
//   dynamic _from;
//   dynamic _to;
//   dynamic _total;
//   dynamic _currentPage;
//   dynamic _lastPage;
//   dynamic _prevPageUrl;
//   dynamic _firstPageUrl;
//   dynamic _nextPageUrl;
//   dynamic _lastPageUrl;
//   List<Transaction>? _transaction;
//   Transactions copyWith({  dynamic perPage,
//     dynamic from,
//     dynamic to,
//     dynamic total,
//     dynamic currentPage,
//     dynamic lastPage,
//     dynamic prevPageUrl,
//     dynamic firstPageUrl,
//     dynamic nextPageUrl,
//     dynamic lastPageUrl,
//     List<Transaction>? transaction,
//   }) => Transactions(  perPage: perPage ?? _perPage,
//     from: from ?? _from,
//     to: to ?? _to,
//     total: total ?? _total,
//     currentPage: currentPage ?? _currentPage,
//     lastPage: lastPage ?? _lastPage,
//     prevPageUrl: prevPageUrl ?? _prevPageUrl,
//     firstPageUrl: firstPageUrl ?? _firstPageUrl,
//     nextPageUrl: nextPageUrl ?? _nextPageUrl,
//     lastPageUrl: lastPageUrl ?? _lastPageUrl,
//     transaction: transaction ?? _transaction,
//   );
//   dynamic get perPage => _perPage;
//   dynamic get from => _from;
//   dynamic get to => _to;
//   dynamic get total => _total;
//   dynamic get currentPage => _currentPage;
//   dynamic get lastPage => _lastPage;
//   dynamic get prevPageUrl => _prevPageUrl;
//   dynamic get firstPageUrl => _firstPageUrl;
//   dynamic get nextPageUrl => _nextPageUrl;
//   dynamic get lastPageUrl => _lastPageUrl;
//   List<Transaction>? get transaction => _transaction;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['per_page'] = _perPage;
//     map['from'] = _from;
//     map['to'] = _to;
//     map['total'] = _total;
//     map['current_page'] = _currentPage;
//     map['last_page'] = _lastPage;
//     map['prev_page_url'] = _prevPageUrl;
//     map['first_page_url'] = _firstPageUrl;
//     map['next_page_url'] = _nextPageUrl;
//     map['last_page_url'] = _lastPageUrl;
//     if (_transaction != null) {
//       map['transaction'] = _transaction?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 53
// /// transaction_no : "1053"
// /// type : 1
// /// amount : "500.00"
// /// transaction_date : "2024-06-04 01:33:00"
// /// details : "56"
// /// bill_no : "25"
// /// image : null
// /// image_full_path : null
// /// status : 1
///
// import 'dart:convert';
// /// status : 200
// /// msg : "OK"
// /// description : "Transactions"
// /// transactions : {"per_page":10,"from":1,"to":1,"total":1,"current_page":1,"last_page":1,"prev_page_url":null,"first_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/184/transactions?page=1","next_page_url":null,"last_page_url":"https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/184/transactions?page=1","transactionsList":[{"id":57,"transaction_no":"1057","type":0,"amount":"2500.00","transaction_date":"2024-06-06 20:37:00","details":"hxhd","bill_no":"56464","image":null,"image_full_path":null,"status":1}]}
//
// TransactionsListResponseModel transactionsListResponseModelFromJson(String str) => TransactionsListResponseModel.fromJson(json.decode(str));
// String transactionsListResponseModelToJson(TransactionsListResponseModel data) => json.encode(data.toJson());
// class TransactionsListResponseModel {
//   TransactionsListResponseModel({
//     dynamic status,
//     dynamic msg,
//     dynamic description,
//     Transactions? transactions,}){
//     _status = status;
//     _msg = msg;
//     _description = description;
//     _transactions = transactions;
//   }
//
//   TransactionsListResponseModel.fromJson(dynamic json) {
//     _status = json['status'];
//     _msg = json['msg'];
//     _description = json['description'];
//     _transactions = json['transactions'] != null ? Transactions.fromJson(json['transactions']) : null;
//   }
//   dynamic _status;
//   dynamic _msg;
//   dynamic _description;
//   Transactions? _transactions;
//   TransactionsListResponseModel copyWith({  dynamic status,
//     dynamic msg,
//     dynamic description,
//     Transactions? transactions,
//   }) => TransactionsListResponseModel(  status: status ?? _status,
//     msg: msg ?? _msg,
//     description: description ?? _description,
//     transactions: transactions ?? _transactions,
//   );
//   dynamic get status => _status;
//   dynamic get msg => _msg;
//   dynamic get description => _description;
//   Transactions? get transactions => _transactions;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     map['msg'] = _msg;
//     map['description'] = _description;
//     if (_transactions != null) {
//       map['transactions'] = _transactions?.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// per_page : 10
// /// from : 1
// /// to : 1
// /// total : 1
// /// current_page : 1
// /// last_page : 1
// /// prev_page_url : null
// /// first_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/184/transactions?page=1"
// /// next_page_url : null
// /// last_page_url : "https://skill-test.retinasoft.com.bd/api/v1/admin/333/customer/184/transactions?page=1"
// /// transactionsList : [{"id":57,"transaction_no":"1057","type":0,"amount":"2500.00","transaction_date":"2024-06-06 20:37:00","details":"hxhd","bill_no":"56464","image":null,"image_full_path":null,"status":1}]
//
// Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));
// String transactionsToJson(Transactions data) => json.encode(data.toJson());
// class Transactions {
//   Transactions({
//     dynamic perPage,
//     dynamic from,
//     dynamic to,
//     dynamic total,
//     dynamic currentPage,
//     dynamic lastPage,
//     dynamic prevPageUrl,
//     dynamic firstPageUrl,
//     dynamic nextPageUrl,
//     dynamic lastPageUrl,
//     List<TransactionsList>? transactionsList,}){
//     _perPage = perPage;
//     _from = from;
//     _to = to;
//     _total = total;
//     _currentPage = currentPage;
//     _lastPage = lastPage;
//     _prevPageUrl = prevPageUrl;
//     _firstPageUrl = firstPageUrl;
//     _nextPageUrl = nextPageUrl;
//     _lastPageUrl = lastPageUrl;
//     _transactionsList = transactionsList;
//   }
//
//   Transactions.fromJson(dynamic json) {
//     _perPage = json['per_page'];
//     _from = json['from'];
//     _to = json['to'];
//     _total = json['total'];
//     _currentPage = json['current_page'];
//     _lastPage = json['last_page'];
//     _prevPageUrl = json['prev_page_url'];
//     _firstPageUrl = json['first_page_url'];
//     _nextPageUrl = json['next_page_url'];
//     _lastPageUrl = json['last_page_url'];
//     if (json['transactionsList'] != null) {
//       _transactionsList = [];
//       json['transactionsList'].forEach((v) {
//         _transactionsList?.add(TransactionsList.fromJson(v));
//       });
//     }
//   }
//   dynamic _perPage;
//   dynamic _from;
//   dynamic _to;
//   dynamic _total;
//   dynamic _currentPage;
//   dynamic _lastPage;
//   dynamic _prevPageUrl;
//   dynamic _firstPageUrl;
//   dynamic _nextPageUrl;
//   dynamic _lastPageUrl;
//   List<TransactionsList>? _transactionsList;
//   Transactions copyWith({  dynamic perPage,
//     dynamic from,
//     dynamic to,
//     dynamic total,
//     dynamic currentPage,
//     dynamic lastPage,
//     dynamic prevPageUrl,
//     dynamic firstPageUrl,
//     dynamic nextPageUrl,
//     dynamic lastPageUrl,
//     List<TransactionsList>? transactionsList,
//   }) => Transactions(  perPage: perPage ?? _perPage,
//     from: from ?? _from,
//     to: to ?? _to,
//     total: total ?? _total,
//     currentPage: currentPage ?? _currentPage,
//     lastPage: lastPage ?? _lastPage,
//     prevPageUrl: prevPageUrl ?? _prevPageUrl,
//     firstPageUrl: firstPageUrl ?? _firstPageUrl,
//     nextPageUrl: nextPageUrl ?? _nextPageUrl,
//     lastPageUrl: lastPageUrl ?? _lastPageUrl,
//     transactionsList: transactionsList ?? _transactionsList,
//   );
//   dynamic get perPage => _perPage;
//   dynamic get from => _from;
//   dynamic get to => _to;
//   dynamic get total => _total;
//   dynamic get currentPage => _currentPage;
//   dynamic get lastPage => _lastPage;
//   dynamic get prevPageUrl => _prevPageUrl;
//   dynamic get firstPageUrl => _firstPageUrl;
//   dynamic get nextPageUrl => _nextPageUrl;
//   dynamic get lastPageUrl => _lastPageUrl;
//   List<TransactionsList>? get transactionsList => _transactionsList;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['per_page'] = _perPage;
//     map['from'] = _from;
//     map['to'] = _to;
//     map['total'] = _total;
//     map['current_page'] = _currentPage;
//     map['last_page'] = _lastPage;
//     map['prev_page_url'] = _prevPageUrl;
//     map['first_page_url'] = _firstPageUrl;
//     map['next_page_url'] = _nextPageUrl;
//     map['last_page_url'] = _lastPageUrl;
//     if (_transactionsList != null) {
//       map['transactionsList'] = _transactionsList?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 57
// /// transaction_no : "1057"
// /// type : 0
// /// amount : "2500.00"
// /// transaction_date : "2024-06-06 20:37:00"
// /// details : "hxhd"
// /// bill_no : "56464"
// /// image : null
// /// image_full_path : null
// /// status : 1
//
// TransactionsList transactionsListFromJson(String str) => TransactionsList.fromJson(json.decode(str));
// String transactionsListToJson(TransactionsList data) => json.encode(data.toJson());
// class TransactionsList {
//   TransactionsList({
//     dynamic id,
//     dynamic transactionNo,
//     dynamic type,
//     dynamic amount,
//     dynamic transactionDate,
//     dynamic details,
//     dynamic billNo,
//     dynamic image,
//     dynamic imageFullPath,
//     dynamic status,}){
//     _id = id;
//     _transactionNo = transactionNo;
//     _type = type;
//     _amount = amount;
//     _transactionDate = transactionDate;
//     _details = details;
//     _billNo = billNo;
//     _image = image;
//     _imageFullPath = imageFullPath;
//     _status = status;
//   }
//
//   TransactionsList.fromJson(dynamic json) {
//     _id = json['id'];
//     _transactionNo = json['transaction_no'];
//     _type = json['type'];
//     _amount = json['amount'];
//     _transactionDate = json['transaction_date'];
//     _details = json['details'];
//     _billNo = json['bill_no'];
//     _image = json['image'];
//     _imageFullPath = json['image_full_path'];
//     _status = json['status'];
//   }
//   dynamic _id;
//   dynamic _transactionNo;
//   dynamic _type;
//   dynamic _amount;
//   dynamic _transactionDate;
//   dynamic _details;
//   dynamic _billNo;
//   dynamic _image;
//   dynamic _imageFullPath;
//   dynamic _status;
//   TransactionsList copyWith({  dynamic id,
//     dynamic transactionNo,
//     dynamic type,
//     dynamic amount,
//     dynamic transactionDate,
//     dynamic details,
//     dynamic billNo,
//     dynamic image,
//     dynamic imageFullPath,
//     dynamic status,
//   }) => TransactionsList(  id: id ?? _id,
//     transactionNo: transactionNo ?? _transactionNo,
//     type: type ?? _type,
//     amount: amount ?? _amount,
//     transactionDate: transactionDate ?? _transactionDate,
//     details: details ?? _details,
//     billNo: billNo ?? _billNo,
//     image: image ?? _image,
//     imageFullPath: imageFullPath ?? _imageFullPath,
//     status: status ?? _status,
//   );
//   dynamic get id => _id;
//   dynamic get transactionNo => _transactionNo;
//   dynamic get type => _type;
//   dynamic get amount => _amount;
//   dynamic get transactionDate => _transactionDate;
//   dynamic get details => _details;
//   dynamic get billNo => _billNo;
//   dynamic get image => _image;
//   dynamic get imageFullPath => _imageFullPath;
//   dynamic get status => _status;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['transaction_no'] = _transactionNo;
//     map['type'] = _type;
//     map['amount'] = _amount;
//     map['transaction_date'] = _transactionDate;
//     map['details'] = _details;
//     map['bill_no'] = _billNo;
//     map['image'] = _image;
//     map['image_full_path'] = _imageFullPath;
//     map['status'] = _status;
//     return map;
//   }
//
// }
import 'dart:convert';

// Function to parse JSON string to TransactionsListResponseModel
TransactionsListResponseModel transactionsListResponseModelFromJson(String str) =>
    TransactionsListResponseModel.fromJson(json.decode(str));

// Function to convert TransactionsListResponseModel to JSON string
String transactionsListResponseModelToJson(TransactionsListResponseModel data) =>
    json.encode(data.toJson());

// TransactionsListResponseModel class
class TransactionsListResponseModel {
  TransactionsListResponseModel({
    this.status,
    this.msg,
    this.description,
    this.transactions,
  });

  factory TransactionsListResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionsListResponseModel(
        status: json['status'],
        msg: json['msg'],
        description: json['description'],
        transactions: json['transactions'] != null
            ? Transactions.fromJson(json['transactions'])
            : null,
      );

  int? status;
  String? msg;
  String? description;
  Transactions? transactions;

  Map<String, dynamic> toJson() => {
    'status': status,
    'msg': msg,
    'description': description,
    if (transactions != null) 'transactions': transactions!.toJson(),
  };
}

// Transactions class for paginated list of transactions
class Transactions {
  Transactions({
    this.perPage,
    this.from,
    this.to,
    this.total,
    this.currentPage,
    this.lastPage,
    this.prevPageUrl,
    this.firstPageUrl,
    this.nextPageUrl,
    this.lastPageUrl,
    this.transactionList,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    perPage: json['per_page'],
    from: json['from'],
    to: json['to'],
    total: json['total'],
    currentPage: json['current_page'],
    lastPage: json['last_page'],
    prevPageUrl: json['prev_page_url'],
    firstPageUrl: json['first_page_url'],
    nextPageUrl: json['next_page_url'],
    lastPageUrl: json['last_page_url'],
    transactionList: json['transactions'] != null
        ? List<Transaction>.from(
        json['transactions'].map((x) => Transaction.fromJson(x)))
        : null,
  );

  int? perPage;
  int? from;
  int? to;
  int? total;
  int? currentPage;
  int? lastPage;
  String? prevPageUrl;
  String? firstPageUrl;
  String? nextPageUrl;
  String? lastPageUrl;
  List<Transaction>? transactionList;

  Map<String, dynamic> toJson() => {
    'per_page': perPage,
    'from': from,
    'to': to,
    'total': total,
    'current_page': currentPage,
    'last_page': lastPage,
    'prev_page_url': prevPageUrl,
    'first_page_url': firstPageUrl,
    'next_page_url': nextPageUrl,
    'last_page_url': lastPageUrl,
    if (transactionList != null)
      'transactions': List<dynamic>.from(transactionList!.map((x) => x.toJson())),
  };
}

// Transaction class for individual transaction
class Transaction {
  Transaction({
    this.id,
    this.transactionNo,
    this.type,
    this.amount,
    this.transactionDate,
    this.details,
    this.billNo,
    this.image,
    this.imageFullPath,
    this.status,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json['id'],
    transactionNo: json['transaction_no'],
    type: json['type'],
    amount: json['amount'],
    transactionDate: json['transaction_date'],
    details: json['details'],
    billNo: json['bill_no'],
    image: json['image'],
    imageFullPath: json['image_full_path'],
    status: json['status'],
  );

  int? id;
  String? transactionNo;
  int? type;
  String? amount;
  String? transactionDate;
  String? details;
  String? billNo;
  dynamic image;
  dynamic imageFullPath;
  int? status;

  Map<String, dynamic> toJson() => {
    'id': id,
    'transaction_no': transactionNo,
    'type': type,
    'amount': amount,
    'transaction_date': transactionDate,
    'details': details,
    'bill_no': billNo,
    'image': image,
    'image_full_path': imageFullPath,
    'status': status,
  };
}