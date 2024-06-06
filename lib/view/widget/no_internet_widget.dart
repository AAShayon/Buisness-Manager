import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoInternetWidget extends StatelessWidget {
  final dynamic onPressed;
  NoInternetWidget({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      height: 120.h,
                      width: 120.w,
                      "assets/internet.json",

                      fit: BoxFit.cover),

                  SizedBox(height: 30.h,),

                  Text("No internet !!!",style: TextStyle(color: Colors.greenAccent),),
                  SizedBox(height: 5.h,),
                  Text("Please Check your internet connection",style: TextStyle(color: Colors.greenAccent),),
                  SizedBox(height: 20.h,),

                  CustomCircularButton(text: 'Try Again', onPressed: onPressed)

                ],
              ),
            ],
          ))),
    );
  }
}
