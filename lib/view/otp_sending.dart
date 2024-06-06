import 'dart:async';
import 'package:buisness_manager/view/otp_recive.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/text_size.dart';

class OtpScreen extends StatefulWidget {
  final dynamic identifier;
  final bool isLoginPage;

  const OtpScreen({super.key, required this.identifier, required this.isLoginPage});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OtpReceive(identifier: widget.identifier, isLoginPage: widget.isLoginPage,),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeadLineMediumText(
              text: 'Verification Code',
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: HeadLineSmallText(
                text: 'Successfully, a verification code was sent to',
                color: Colors.green,
              ),
            ),
            HeadLineSmallText(
              text: widget.identifier.toString(),
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: SizedBox(
                width: 200.w,
                child: TweenAnimationBuilder(
                  duration: const Duration(seconds: 3),
                  builder: (context, value, child) => Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.green,
                        value: value,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '${(value * 100).toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.pink,
                                blurRadius: 10,
                                offset: Offset(2, 2)),
                            Shadow(
                                color: Colors.blue,
                                blurRadius: 10,
                                offset: Offset(-2, -2)),
                          ],
                        ),
                      )
                    ],
                  ),
                  tween: Tween(begin: 0.0, end: 1.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
