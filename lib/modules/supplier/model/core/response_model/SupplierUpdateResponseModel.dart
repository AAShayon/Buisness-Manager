import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Customer updated successfully"
/// customer : {"id":40,"company_id":66,"branch_id":126,"user_id":66,"name":"test customer71 udpate","phone":"01000000007","email":"testcustome7r1@gmail.com","type":1,"balance":"0.00","reminder_date":null,"image":null,"address":"dhaka update","area":"dhaka udpate","post_code":"16122","city":"dhaka update","state":"dhaka","status":1,"created_by":66,"created_at":"2024-05-18 13:56:36","updated_by":66,"updated_at":"2024-05-18 14:07:14","deleted":0,"deleted_by":null,"deleted_at":null,"show_image":null}
/// customer_bank_accounts : [{"id":34,"customer_id":40,"bank_name":null,"account_name":"oalid","account_number":"23423423","routing_number":"dhanmondi","swift_code":"231","status":1,"created_by":66,"created_at":"2024-05-18 13:56:36","updated_by":66,"updated_at":"2024-05-18 13:56:36","deleted":0,"deleted_by":null,"deleted_at":null},{"id":37,"customer_id":40,"bank_name":null,"account_name":"oalid udate","account_number":"2342342322","routing_number":"dhanmondi udpate","swift_code":"2311","status":1,"created_by":null,"created_at":"2024-05-18 14:07:14","updated_by":66,"updated_at":"2024-05-18 14:07:14","deleted":0,"deleted_by":null,"deleted_at":null},{"id":38,"customer_id":40,"bank_name":null,"account_name":"oalid","account_number":"2342342322","routing_number":"mohammadpur","swift_code":"2310","status":1,"created_by":null,"created_at":"2024-05-18 14:07:14","updated_by":66,"updated_at":"2024-05-18 14:07:14","deleted":0,"deleted_by":null,"deleted_at":null}]

SupplierUpdateResponseModel supplierUpdateResponseModelFromJson(String str) => SupplierUpdateResponseModel.fromJson(json.decode(str));
String supplierUpdateResponseModelToJson(SupplierUpdateResponseModel data) => json.encode(data.toJson());
class SupplierUpdateResponseModel {
  SupplierUpdateResponseModel({
      num? status, 
      String? msg, 
      String? description, 
      Customer? customer, 
      List<CustomerBankAccounts>? customerBankAccounts,}){
    _status = status;
    _msg = msg;
    _description = description;
    _customer = customer;
    _customerBankAccounts = customerBankAccounts;
}

  SupplierUpdateResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _description = json['description'];
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['customer_bank_accounts'] != null) {
      _customerBankAccounts = [];
      json['customer_bank_accounts'].forEach((v) {
        _customerBankAccounts?.add(CustomerBankAccounts.fromJson(v));
      });
    }
  }
  num? _status;
  String? _msg;
  String? _description;
  Customer? _customer;
  List<CustomerBankAccounts>? _customerBankAccounts;
SupplierUpdateResponseModel copyWith({  num? status,
  String? msg,
  String? description,
  Customer? customer,
  List<CustomerBankAccounts>? customerBankAccounts,
}) => SupplierUpdateResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  customer: customer ?? _customer,
  customerBankAccounts: customerBankAccounts ?? _customerBankAccounts,
);
  num? get status => _status;
  String? get msg => _msg;
  String? get description => _description;
  Customer? get customer => _customer;
  List<CustomerBankAccounts>? get customerBankAccounts => _customerBankAccounts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['description'] = _description;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    if (_customerBankAccounts != null) {
      map['customer_bank_accounts'] = _customerBankAccounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 34
/// customer_id : 40
/// bank_name : null
/// account_name : "oalid"
/// account_number : "23423423"
/// routing_number : "dhanmondi"
/// swift_code : "231"
/// status : 1
/// created_by : 66
/// created_at : "2024-05-18 13:56:36"
/// updated_by : 66
/// updated_at : "2024-05-18 13:56:36"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null

CustomerBankAccounts customerBankAccountsFromJson(String str) => CustomerBankAccounts.fromJson(json.decode(str));
String customerBankAccountsToJson(CustomerBankAccounts data) => json.encode(data.toJson());
class CustomerBankAccounts {
  CustomerBankAccounts({
      num? id, 
      num? customerId, 
      dynamic bankName, 
      String? accountName, 
      String? accountNumber, 
      String? routingNumber, 
      String? swiftCode, 
      num? status, 
      num? createdBy, 
      String? createdAt, 
      num? updatedBy, 
      String? updatedAt, 
      num? deleted, 
      dynamic deletedBy, 
      dynamic deletedAt,}){
    _id = id;
    _customerId = customerId;
    _bankName = bankName;
    _accountName = accountName;
    _accountNumber = accountNumber;
    _routingNumber = routingNumber;
    _swiftCode = swiftCode;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _deleted = deleted;
    _deletedBy = deletedBy;
    _deletedAt = deletedAt;
}

  CustomerBankAccounts.fromJson(dynamic json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _bankName = json['bank_name'];
    _accountName = json['account_name'];
    _accountNumber = json['account_number'];
    _routingNumber = json['routing_number'];
    _swiftCode = json['swift_code'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _deleted = json['deleted'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  num? _customerId;
  dynamic _bankName;
  String? _accountName;
  String? _accountNumber;
  String? _routingNumber;
  String? _swiftCode;
  num? _status;
  num? _createdBy;
  String? _createdAt;
  num? _updatedBy;
  String? _updatedAt;
  num? _deleted;
  dynamic _deletedBy;
  dynamic _deletedAt;
CustomerBankAccounts copyWith({  num? id,
  num? customerId,
  dynamic bankName,
  String? accountName,
  String? accountNumber,
  String? routingNumber,
  String? swiftCode,
  num? status,
  num? createdBy,
  String? createdAt,
  num? updatedBy,
  String? updatedAt,
  num? deleted,
  dynamic deletedBy,
  dynamic deletedAt,
}) => CustomerBankAccounts(  id: id ?? _id,
  customerId: customerId ?? _customerId,
  bankName: bankName ?? _bankName,
  accountName: accountName ?? _accountName,
  accountNumber: accountNumber ?? _accountNumber,
  routingNumber: routingNumber ?? _routingNumber,
  swiftCode: swiftCode ?? _swiftCode,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  deleted: deleted ?? _deleted,
  deletedBy: deletedBy ?? _deletedBy,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  num? get customerId => _customerId;
  dynamic get bankName => _bankName;
  String? get accountName => _accountName;
  String? get accountNumber => _accountNumber;
  String? get routingNumber => _routingNumber;
  String? get swiftCode => _swiftCode;
  num? get status => _status;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  num? get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  num? get deleted => _deleted;
  dynamic get deletedBy => _deletedBy;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['customer_id'] = _customerId;
    map['bank_name'] = _bankName;
    map['account_name'] = _accountName;
    map['account_number'] = _accountNumber;
    map['routing_number'] = _routingNumber;
    map['swift_code'] = _swiftCode;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['deleted'] = _deleted;
    map['deleted_by'] = _deletedBy;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}

/// id : 40
/// company_id : 66
/// branch_id : 126
/// user_id : 66
/// name : "test customer71 udpate"
/// phone : "01000000007"
/// email : "testcustome7r1@gmail.com"
/// type : 1
/// balance : "0.00"
/// reminder_date : null
/// image : null
/// address : "dhaka update"
/// area : "dhaka udpate"
/// post_code : "16122"
/// city : "dhaka update"
/// state : "dhaka"
/// status : 1
/// created_by : 66
/// created_at : "2024-05-18 13:56:36"
/// updated_by : 66
/// updated_at : "2024-05-18 14:07:14"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null
/// show_image : null

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));
String customerToJson(Customer data) => json.encode(data.toJson());
class Customer {
  Customer({
      num? id, 
      num? companyId, 
      num? branchId, 
      num? userId, 
      String? name, 
      String? phone, 
      String? email, 
      num? type, 
      String? balance, 
      dynamic reminderDate, 
      dynamic image, 
      String? address, 
      String? area, 
      String? postCode, 
      String? city, 
      String? state, 
      num? status, 
      num? createdBy, 
      String? createdAt, 
      num? updatedBy, 
      String? updatedAt, 
      num? deleted, 
      dynamic deletedBy, 
      dynamic deletedAt, 
      dynamic showImage,}){
    _id = id;
    _companyId = companyId;
    _branchId = branchId;
    _userId = userId;
    _name = name;
    _phone = phone;
    _email = email;
    _type = type;
    _balance = balance;
    _reminderDate = reminderDate;
    _image = image;
    _address = address;
    _area = area;
    _postCode = postCode;
    _city = city;
    _state = state;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _deleted = deleted;
    _deletedBy = deletedBy;
    _deletedAt = deletedAt;
    _showImage = showImage;
}

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _companyId = json['company_id'];
    _branchId = json['branch_id'];
    _userId = json['user_id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _type = json['type'];
    _balance = json['balance'];
    _reminderDate = json['reminder_date'];
    _image = json['image'];
    _address = json['address'];
    _area = json['area'];
    _postCode = json['post_code'];
    _city = json['city'];
    _state = json['state'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _deleted = json['deleted'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _showImage = json['show_image'];
  }
  num? _id;
  num? _companyId;
  num? _branchId;
  num? _userId;
  String? _name;
  String? _phone;
  String? _email;
  num? _type;
  String? _balance;
  dynamic _reminderDate;
  dynamic _image;
  String? _address;
  String? _area;
  String? _postCode;
  String? _city;
  String? _state;
  num? _status;
  num? _createdBy;
  String? _createdAt;
  num? _updatedBy;
  String? _updatedAt;
  num? _deleted;
  dynamic _deletedBy;
  dynamic _deletedAt;
  dynamic _showImage;
Customer copyWith({  num? id,
  num? companyId,
  num? branchId,
  num? userId,
  String? name,
  String? phone,
  String? email,
  num? type,
  String? balance,
  dynamic reminderDate,
  dynamic image,
  String? address,
  String? area,
  String? postCode,
  String? city,
  String? state,
  num? status,
  num? createdBy,
  String? createdAt,
  num? updatedBy,
  String? updatedAt,
  num? deleted,
  dynamic deletedBy,
  dynamic deletedAt,
  dynamic showImage,
}) => Customer(  id: id ?? _id,
  companyId: companyId ?? _companyId,
  branchId: branchId ?? _branchId,
  userId: userId ?? _userId,
  name: name ?? _name,
  phone: phone ?? _phone,
  email: email ?? _email,
  type: type ?? _type,
  balance: balance ?? _balance,
  reminderDate: reminderDate ?? _reminderDate,
  image: image ?? _image,
  address: address ?? _address,
  area: area ?? _area,
  postCode: postCode ?? _postCode,
  city: city ?? _city,
  state: state ?? _state,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  deleted: deleted ?? _deleted,
  deletedBy: deletedBy ?? _deletedBy,
  deletedAt: deletedAt ?? _deletedAt,
  showImage: showImage ?? _showImage,
);
  num? get id => _id;
  num? get companyId => _companyId;
  num? get branchId => _branchId;
  num? get userId => _userId;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  num? get type => _type;
  String? get balance => _balance;
  dynamic get reminderDate => _reminderDate;
  dynamic get image => _image;
  String? get address => _address;
  String? get area => _area;
  String? get postCode => _postCode;
  String? get city => _city;
  String? get state => _state;
  num? get status => _status;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  num? get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  num? get deleted => _deleted;
  dynamic get deletedBy => _deletedBy;
  dynamic get deletedAt => _deletedAt;
  dynamic get showImage => _showImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_id'] = _companyId;
    map['branch_id'] = _branchId;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['type'] = _type;
    map['balance'] = _balance;
    map['reminder_date'] = _reminderDate;
    map['image'] = _image;
    map['address'] = _address;
    map['area'] = _area;
    map['post_code'] = _postCode;
    map['city'] = _city;
    map['state'] = _state;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['deleted'] = _deleted;
    map['deleted_by'] = _deletedBy;
    map['deleted_at'] = _deletedAt;
    map['show_image'] = _showImage;
    return map;
  }

}