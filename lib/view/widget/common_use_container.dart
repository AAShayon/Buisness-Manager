import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CommonUseContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;
  final Color borderColor;

   const CommonUseContainer({super.key, required this.child, this.height= 100,  this.width = 100,  this.color=Colors.transparent,  this.borderColor=Colors.greenAccent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor,width: 5.0),
      ),
      child: Padding(padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),child: child,),
    );
  }
}
