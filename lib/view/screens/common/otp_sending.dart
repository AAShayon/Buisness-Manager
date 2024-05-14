import 'dart:async';
import 'package:buisness_manager/view/screens/common/otp_recive.dart';
import 'package:buisness_manager/view/screens/widgets/custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/text_size.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OtpReceive(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(
     crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeadLineMediumText(text: 'Verification Code',color: Colors.deepPurple,),

        Padding(
          padding:  EdgeInsets.symmetric(vertical: 25.h),
          child: HeadLineSmallText(text: 'Successfully An verfication code sent to', color: Colors.black),
        ),
        HeadLineSmallText(text: '+8801752355529', color: Colors.white),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 25.h),
          child: SizedBox(
            width: 200.w,
            child: TweenAnimationBuilder(duration: const Duration(seconds: 3),builder: (context, value, child) => Column(
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.deepPurpleAccent,
                  value: value,
                ),
               SizedBox(height: 10.h),
                Text(
                  '${(value * 100).toInt()}%',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,shadows: [
                  Shadow(color: Colors.pink,blurRadius: 10 , offset: Offset(2,2)),
                  Shadow(color: Colors.blue,blurRadius: 10 , offset: Offset(-2,-2)),
                ]),)
              ],
            ), tween: Tween(begin: 0.0,end: 1.0),),
          ),
        )
      ],
    ));
  }
}


