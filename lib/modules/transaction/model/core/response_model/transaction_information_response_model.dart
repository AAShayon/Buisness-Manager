import 'dart:convert';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));
String transactionToJson(Transaction data) => json.encode(data.toJson());
class Transaction {
  Transaction({
    dynamic id,
    dynamic transactionNo,
    dynamic type,
    dynamic amount,
    dynamic transactionDate,
    dynamic details,
    dynamic billNo,
    dynamic image,
    dynamic imageFullPath,
    dynamic status,}){
    _id = id;
    _transactionNo = transactionNo;
    _type = type;
    _amount = amount;
    _transactionDate = transactionDate;
    _details = details;
    _billNo = billNo;
    _image = image;
    _imageFullPath = imageFullPath;
    _status = status;
  }

  Transaction.fromJson(dynamic json) {
    _id = json['id'];
    _transactionNo = json['transaction_no'];
    _type = json['type'];
    _amount = json['amount'];
    _transactionDate = json['transaction_date'];
    _details = json['details'];
    _billNo = json['bill_no'];
    _image = json['image'];
    _imageFullPath = json['image_full_path'];
    _status = json['status'];
  }
  dynamic _id;
  dynamic _transactionNo;
  dynamic _type;
  dynamic _amount;
  dynamic _transactionDate;
  dynamic _details;
  dynamic _billNo;
  dynamic _image;
  dynamic _imageFullPath;
  dynamic _status;
  Transaction copyWith({  dynamic id,
    dynamic transactionNo,
    dynamic type,
    dynamic amount,
    dynamic transactionDate,
    dynamic details,
    dynamic billNo,
    dynamic image,
    dynamic imageFullPath,
    dynamic status,
  }) => Transaction(  id: id ?? _id,
    transactionNo: transactionNo ?? _transactionNo,
    type: type ?? _type,
    amount: amount ?? _amount,
    transactionDate: transactionDate ?? _transactionDate,
    details: details ?? _details,
    billNo: billNo ?? _billNo,
    image: image ?? _image,
    imageFullPath: imageFullPath ?? _imageFullPath,
    status: status ?? _status,
  );
  dynamic get id => _id;
  dynamic get transactionNo => _transactionNo;
  dynamic get type => _type;
  dynamic get amount => _amount;
  dynamic get transactionDate => _transactionDate;
  dynamic get details => _details;
  dynamic get billNo => _billNo;
  dynamic get image => _image;
  dynamic get imageFullPath => _imageFullPath;
  dynamic get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['transaction_no'] = _transactionNo;
    map['type'] = _type;
    map['amount'] = _amount;
    map['transaction_date'] = _transactionDate;
    map['details'] = _details;
    map['bill_no'] = _billNo;
    map['image'] = _image;
    map['image_full_path'] = _imageFullPath;
    map['status'] = _status;
    return map;
  }

}