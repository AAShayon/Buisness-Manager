import 'dart:convert';
/// name : "asd"
/// phone : "01000005546"
/// email : "tesc@gmail.com"
/// type : "1"
/// address : "dhaka"
/// area : "dhaka"
/// post_code : "1612"
/// city : "dhaka"
/// state : "dhaka"
/// account_name[] : "oalid"
/// account_number[] : "23423423"
/// routing_number[] : "dhanmondi"
/// swift_code[] : "231"

SupplierCreateRequestModel supplierCreateRequestModelFromJson(String str) => SupplierCreateRequestModel.fromJson(json.decode(str));
String supplierCreateRequestModelToJson(SupplierCreateRequestModel data) => json.encode(data.toJson());
class SupplierCreateRequestModel {
  SupplierCreateRequestModel({
      dynamic name, 
      dynamic phone, 
      dynamic email, 
      dynamic type, 
      dynamic address, 
      dynamic area, 
      dynamic postCode, 
      dynamic city, 
      dynamic state, 
      dynamic accountName, 
      dynamic accountNumber, 
      dynamic routingNumber, 
      dynamic swiftCode,}){
    _name = name;
    _phone = phone;
    _email = email;
    _type = type;
    _address = address;
    _area = area;
    _postCode = postCode;
    _city = city;
    _state = state;
    _accountName = accountName;
    _accountNumber = accountNumber;
    _routingNumber = routingNumber;
    _swiftCode = swiftCode;
}

  SupplierCreateRequestModel.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _type = json['type'];
    _address = json['address'];
    _area = json['area'];
    _postCode = json['post_code'];
    _city = json['city'];
    _state = json['state'];
    _accountName = json['account_name[]'];
    _accountNumber = json['account_number[]'];
    _routingNumber = json['routing_number[]'];
    _swiftCode = json['swift_code[]'];
  }
  dynamic _name;
  dynamic _phone;
  dynamic _email;
  dynamic _type;
  dynamic _address;
  dynamic _area;
  dynamic _postCode;
  dynamic _city;
  dynamic _state;
  dynamic _accountName;
  dynamic _accountNumber;
  dynamic _routingNumber;
  dynamic _swiftCode;
SupplierCreateRequestModel copyWith({  dynamic name,
  dynamic phone,
  dynamic email,
  dynamic type,
  dynamic address,
  dynamic area,
  dynamic postCode,
  dynamic city,
  dynamic state,
  dynamic accountName,
  dynamic accountNumber,
  dynamic routingNumber,
  dynamic swiftCode,
}) => SupplierCreateRequestModel(  name: name ?? _name,
  phone: phone ?? _phone,
  email: email ?? _email,
  type: type ?? _type,
  address: address ?? _address,
  area: area ?? _area,
  postCode: postCode ?? _postCode,
  city: city ?? _city,
  state: state ?? _state,
  accountName: accountName ?? _accountName,
  accountNumber: accountNumber ?? _accountNumber,
  routingNumber: routingNumber ?? _routingNumber,
  swiftCode: swiftCode ?? _swiftCode,
);
  dynamic get name => _name;
  dynamic get phone => _phone;
  dynamic get email => _email;
  dynamic get type => _type;
  dynamic get address => _address;
  dynamic get area => _area;
  dynamic get postCode => _postCode;
  dynamic get city => _city;
  dynamic get state => _state;
  dynamic get accountName => _accountName;
  dynamic get accountNumber => _accountNumber;
  dynamic get routingNumber => _routingNumber;
  dynamic get swiftCode => _swiftCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['type'] = _type;
    map['address'] = _address;
    map['area'] = _area;
    map['post_code'] = _postCode;
    map['city'] = _city;
    map['state'] = _state;
    map['account_name[]'] = _accountName;
    map['account_number[]'] = _accountNumber;
    map['routing_number[]'] = _routingNumber;
    map['swift_code[]'] = _swiftCode;
    return map;
  }

}