import 'package:buisness_manager/model/service/local/shared_pre_service.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/modules/customer/viewModel/customer_view_model.dart';
import 'package:buisness_manager/modules/transaction/viewModel/transaction_view_model.dart';
import 'package:buisness_manager/view/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.lightGreen,),);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ScreenUtilInit(
      designSize: Size(375 ,838),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AuthViewModel()),
          ChangeNotifierProvider(create: (context)=>UserProfileViewModel()),
          ChangeNotifierProvider(create: (context)=>BranchViewModel()),
          ChangeNotifierProvider(create: (context)=>CustomerViewModel()),
          ChangeNotifierProvider(create: (context)=>TransactionViewModel()),
        ],
        child: StreamProvider<InternetConnectionStatus>(
          initialData: InternetConnectionStatus.connected,
          create: (_) {
            return InternetConnectionChecker().onStatusChange;
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Business Manager',
            home: OnboardingScreen(),

          ),
        ),
      ),
    );
  }
}
