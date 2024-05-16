import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375 ,838),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AuthViewModel()),
          ChangeNotifierProvider(create: (context)=>UserProfileViewModel()),
          ChangeNotifierProvider(create: (context)=>BranchViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Business Manager',
          home: Login(),

        ),
      ),
    );
  }
}
