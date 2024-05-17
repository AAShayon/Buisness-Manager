import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Business Manager',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Login(),
              //   ),
              // );
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) =>
                      const Login()), (
                  route) => false);
            },
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}