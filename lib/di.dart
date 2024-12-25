
import 'package:buisness_manager/model/service/remote/dio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
late final SharedPreferences appData;

Future<void> diSetup() async {
  appData = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(appData);
  locator.registerSingleton<DioService>(DioService());
}
