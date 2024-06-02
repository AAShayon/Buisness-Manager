import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService{
  Future<void> write({required String key, required dynamic value});
  Future<dynamic> read({required String key});
  Future<void> delete({required String key});
  Future<void> update({required String key, required dynamic value});
}


class SharedPreService implements StorageService{
  static SharedPreferences? sharedPreferences;
  static final SharedPreService _singleton = SharedPreService._internal();


  factory SharedPreService(){
    return _singleton;
  }
  SharedPreService._internal(){
    setup();
  }
  setup()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }

  @override
  Future<void> delete ({required String key}) async{
   await sharedPreferences?.remove(key);
  }

  @override
  Future<dynamic> read({required String key}) async {
   return sharedPreferences?.get(key);
  }

  @override
  Future<void> update({required String key,required dynamic value}) async {
   await sharedPreferences?.remove(key);
   await sharedPreferences?.setString(key, value.toString());
  }

  @override
  Future<void> write({required String key,required dynamic value}) async {
    // TODO: implement write
   await  sharedPreferences?.setString(key, value);
  }


}

//import 'package:shared_preferences/shared_preferences.dart';
//
// abstract class StorageService {
//   Future<void> write({required String key, required dynamic value});
//   Future<dynamic> read({required String key});
//   Future<void> delete({required String key});
//   Future<void> update({required String key, required dynamic value});
// }
//
// class SharedPreService implements StorageService {
//   late SharedPreferences _sharedPreferences;
//   static final SharedPreService _singleton = SharedPreService._internal();
//
//   factory SharedPreService() {
//     return _singleton;
//   }
//
//   SharedPreService._internal() {
//     _setup();
//   }
//
//   Future<void> _setup() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   Future<void> _ensureInitialized() async {
//     if (_sharedPreferences == null) {
//       await _setup();
//     }
//   }
//
//   @override
//   Future<void> write({required String key, required dynamic value}) async {
//     await _ensureInitialized();
//     await _sharedPreferences.setString(key, value.toString());
//   }
//
//   @override
//   Future<dynamic> read({required String key}) async {
//     await _ensureInitialized();
//     return _sharedPreferences.get(key);
//   }
//
//   @override
//   Future<void> delete({required String key}) async {
//     await _ensureInitialized();
//     await _sharedPreferences.remove(key);
//   }
//
//   @override
//   Future<void> update({required String key, required dynamic value}) async {
//     await _ensureInitialized();
//     await _sharedPreferences.setString(key, value.toString());
//   }
// }