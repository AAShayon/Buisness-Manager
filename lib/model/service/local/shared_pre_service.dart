

import 'package:buisness_manager/model/service/local/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreService implements StorageService{
  late SharedPreferences sharedPreferences;
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
  void delete({required String key}) {
    // TODO: implement delete
    sharedPreferences.remove(key);
  }

  @override
  void read({required String key}) {
    // TODO: implement read
    sharedPreferences.get(key);
  }

  @override
  void update({required String key,required dynamic value}) {
    // TODO: implement update
    sharedPreferences.remove(key);
    sharedPreferences.setString(key, value.toString());
  }

  @override
  void write({required String key,required dynamic value}) {
    // TODO: implement write
    sharedPreferences.setString(key, value.toString());
  }


}