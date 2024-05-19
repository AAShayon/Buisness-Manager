import 'dart:convert';
/// status : 200
/// msg : "OK"
/// description : "Customer updated successfully"
/// customer : {"id":38,"company_id":66,"branch_id":126,"user_id":66,"name":"test customer1 udpate","phone":"01000000006","email":"testcust@gmail.com","type":0,"balance":"0.00","reminder_date":null,"image":null,"address":"dhaka update","area":"dhaka udpate","post_code":"16122","city":"dhaka update","state":"dhaka","status":1,"created_by":66,"created_at":"2024-05-18 13:38:43","updated_by":66,"updated_at":"2024-05-18 14:02:42","deleted":0,"deleted_by":null,"deleted_at":null,"show_image":null}
/// customer_bank_accounts : [{"id":32,"customer_id":38,"bank_name":null,"account_name":"oalid","account_number":"23423423","routing_number":"dhanmondi","swift_code":"231","status":1,"created_by":66,"created_at":"2024-05-18 13:38:43","updated_by":66,"updated_at":"2024-05-18 13:38:43","deleted":0,"deleted_by":null,"deleted_at":null},{"id":35,"customer_id":38,"bank_name":null,"account_name":"oalid udate","account_number":"2342342322","routing_number":"dhanmondi udpate","swift_code":"2311","status":1,"created_by":null,"created_at":"2024-05-18 14:02:42","updated_by":66,"updated_at":"2024-05-18 14:02:42","deleted":0,"deleted_by":null,"deleted_at":null},{"id":36,"customer_id":38,"bank_name":null,"account_name":"oalid","account_number":"2342342322","routing_number":"mohammadpur","swift_code":"2310","status":1,"created_by":null,"created_at":"2024-05-18 14:02:42","updated_by":66,"updated_at":"2024-05-18 14:02:42","deleted":0,"deleted_by":null,"deleted_at":null}]

CustomerUpdateResponseModel customerUpdateResponseModelFromJson(String str) => CustomerUpdateResponseModel.fromJson(json.decode(str));
String customerUpdateResponseModelToJson(CustomerUpdateResponseModel data) => json.encode(data.toJson());
class CustomerUpdateResponseModel {
  CustomerUpdateResponseModel({
      dynamic status, 
      dynamic msg, 
      dynamic description, 
      Customer? customer, 
      List<CustomerBankAccounts>? customerBankAccounts,}){
    _status = status;
    _msg = msg;
    _description = description;
    _customer = customer;
    _customerBankAccounts = customerBankAccounts;
}

  CustomerUpdateResponseModel.fromJson(dynamic json) {
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
  dynamic _status;
  dynamic _msg;
  dynamic _description;
  Customer? _customer;
  List<CustomerBankAccounts>? _customerBankAccounts;
CustomerUpdateResponseModel copyWith({  dynamic status,
  dynamic msg,
  dynamic description,
  Customer? customer,
  List<CustomerBankAccounts>? customerBankAccounts,
}) => CustomerUpdateResponseModel(  status: status ?? _status,
  msg: msg ?? _msg,
  description: description ?? _description,
  customer: customer ?? _customer,
  customerBankAccounts: customerBankAccounts ?? _customerBankAccounts,
);
  dynamic get status => _status;
  dynamic get msg => _msg;
  dynamic get description => _description;
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

/// id : 32
/// customer_id : 38
/// bank_name : null
/// account_name : "oalid"
/// account_number : "23423423"
/// routing_number : "dhanmondi"
/// swift_code : "231"
/// status : 1
/// created_by : 66
/// created_at : "2024-05-18 13:38:43"
/// updated_by : 66
/// updated_at : "2024-05-18 13:38:43"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null

CustomerBankAccounts customerBankAccountsFromJson(String str) => CustomerBankAccounts.fromJson(json.decode(str));
String customerBankAccountsToJson(CustomerBankAccounts data) => json.encode(data.toJson());
class CustomerBankAccounts {
  CustomerBankAccounts({
      dynamic id, 
      dynamic customerId, 
      dynamic bankName, 
      dynamic accountName, 
      dynamic accountNumber, 
      dynamic routingNumber, 
      dynamic swiftCode, 
      dynamic status, 
      dynamic createdBy, 
      dynamic createdAt, 
      dynamic updatedBy, 
      dynamic updatedAt, 
      dynamic deleted, 
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
  dynamic _id;
  dynamic _customerId;
  dynamic _bankName;
  dynamic _accountName;
  dynamic _accountNumber;
  dynamic _routingNumber;
  dynamic _swiftCode;
  dynamic _status;
  dynamic _createdBy;
  dynamic _createdAt;
  dynamic _updatedBy;
  dynamic _updatedAt;
  dynamic _deleted;
  dynamic _deletedBy;
  dynamic _deletedAt;
CustomerBankAccounts copyWith({  dynamic id,
  dynamic customerId,
  dynamic bankName,
  dynamic accountName,
  dynamic accountNumber,
  dynamic routingNumber,
  dynamic swiftCode,
  dynamic status,
  dynamic createdBy,
  dynamic createdAt,
  dynamic updatedBy,
  dynamic updatedAt,
  dynamic deleted,
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
  dynamic get id => _id;
  dynamic get customerId => _customerId;
  dynamic get bankName => _bankName;
  dynamic get accountName => _accountName;
  dynamic get accountNumber => _accountNumber;
  dynamic get routingNumber => _routingNumber;
  dynamic get swiftCode => _swiftCode;
  dynamic get status => _status;
  dynamic get createdBy => _createdBy;
  dynamic get createdAt => _createdAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get deleted => _deleted;
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

/// id : 38
/// company_id : 66
/// branch_id : 126
/// user_id : 66
/// name : "test customer1 udpate"
/// phone : "01000000006"
/// email : "testcust@gmail.com"
/// type : 0
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
/// created_at : "2024-05-18 13:38:43"
/// updated_by : 66
/// updated_at : "2024-05-18 14:02:42"
/// deleted : 0
/// deleted_by : null
/// deleted_at : null
/// show_image : null

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));
String customerToJson(Customer data) => json.encode(data.toJson());
class Customer {
  Customer({
      dynamic id, 
      dynamic companyId, 
      dynamic branchId, 
      dynamic userId, 
      dynamic name, 
      dynamic phone, 
      dynamic email, 
      dynamic type, 
      dynamic balance, 
      dynamic reminderDate, 
      dynamic image, 
      dynamic address, 
      dynamic area, 
      dynamic postCode, 
      dynamic city, 
      dynamic state, 
      dynamic status, 
      dynamic createdBy, 
      dynamic createdAt, 
      dynamic updatedBy, 
      dynamic updatedAt, 
      dynamic deleted, 
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
  dynamic _id;
  dynamic _companyId;
  dynamic _branchId;
  dynamic _userId;
  dynamic _name;
  dynamic _phone;
  dynamic _email;
  dynamic _type;
  dynamic _balance;
  dynamic _reminderDate;
  dynamic _image;
  dynamic _address;
  dynamic _area;
  dynamic _postCode;
  dynamic _city;
  dynamic _state;
  dynamic _status;
  dynamic _createdBy;
  dynamic _createdAt;
  dynamic _updatedBy;
  dynamic _updatedAt;
  dynamic _deleted;
  dynamic _deletedBy;
  dynamic _deletedAt;
  dynamic _showImage;
Customer copyWith({  dynamic id,
  dynamic companyId,
  dynamic branchId,
  dynamic userId,
  dynamic name,
  dynamic phone,
  dynamic email,
  dynamic type,
  dynamic balance,
  dynamic reminderDate,
  dynamic image,
  dynamic address,
  dynamic area,
  dynamic postCode,
  dynamic city,
  dynamic state,
  dynamic status,
  dynamic createdBy,
  dynamic createdAt,
  dynamic updatedBy,
  dynamic updatedAt,
  dynamic deleted,
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
  dynamic get id => _id;
  dynamic get companyId => _companyId;
  dynamic get branchId => _branchId;
  dynamic get userId => _userId;
  dynamic get name => _name;
  dynamic get phone => _phone;
  dynamic get email => _email;
  dynamic get type => _type;
  dynamic get balance => _balance;
  dynamic get reminderDate => _reminderDate;
  dynamic get image => _image;
  dynamic get address => _address;
  dynamic get area => _area;
  dynamic get postCode => _postCode;
  dynamic get city => _city;
  dynamic get state => _state;
  dynamic get status => _status;
  dynamic get createdBy => _createdBy;
  dynamic get createdAt => _createdAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get deleted => _deleted;
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