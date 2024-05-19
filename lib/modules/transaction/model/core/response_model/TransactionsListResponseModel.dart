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