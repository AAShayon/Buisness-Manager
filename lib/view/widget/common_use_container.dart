import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CommonUseContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;

   const CommonUseContainer({super.key, required this.child, this.height= 100,  this.width = 100,  this.color=Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue,width: 2.0),
      ),
      child: Padding(padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),child: child,),
    );
  }
}
