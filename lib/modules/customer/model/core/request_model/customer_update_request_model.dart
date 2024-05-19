import 'dart:convert';
/// name : "test customer1 udpate"
/// phone : "01000000006"
/// email : "testcust@gmail.com"
/// type : "0"
/// address : "dhaka update"
/// area : "dhaka udpate"
/// post_code : "16122"
/// city : "dhaka update"
/// state : "dhaka update"
/// account_name[] : "oalid"
/// account_number[] : "2342342322"
/// routing_number[] : "mohammadpur"
/// swift_code[] : "2310"

CustomerUpdateRequestModel customerUpdateRequestModelFromJson(String str) => CustomerUpdateRequestModel.fromJson(json.decode(str));
String customerUpdateRequestModelToJson(CustomerUpdateRequestModel data) => json.encode(data.toJson());
class CustomerUpdateRequestModel {
  CustomerUpdateRequestModel({
      String? name, 
      String? phone, 
      String? email, 
      String? type, 
      String? address, 
      String? area, 
      String? postCode, 
      String? city, 
      String? state, 
      String? accountName, 
      String? accountNumber, 
      String? routingNumber, 
      String? swiftCode,}){
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

  CustomerUpdateRequestModel.fromJson(dynamic json) {
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
  String? _name;
  String? _phone;
  String? _email;
  String? _type;
  String? _address;
  String? _area;
  String? _postCode;
  String? _city;
  String? _state;
  String? _accountName;
  String? _accountNumber;
  String? _routingNumber;
  String? _swiftCode;
CustomerUpdateRequestModel copyWith({  String? name,
  String? phone,
  String? email,
  String? type,
  String? address,
  String? area,
  String? postCode,
  String? city,
  String? state,
  String? accountName,
  String? accountNumber,
  String? routingNumber,
  String? swiftCode,
}) => CustomerUpdateRequestModel(  name: name ?? _name,
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
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get type => _type;
  String? get address => _address;
  String? get area => _area;
  String? get postCode => _postCode;
  String? get city => _city;
  String? get state => _state;
  String? get accountName => _accountName;
  String? get accountNumber => _accountNumber;
  String? get routingNumber => _routingNumber;
  String? get swiftCode => _swiftCode;

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