import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTableWithBorder extends StatelessWidget {
  final String text;
  final Radius? topLeft;
  final Radius? bottomLeft;
  final Radius? topRight;
  final Radius? bottomRight;
  final double width;
  final double fontSize;

  const CustomTableWithBorder({
    Key? key,
    required this.text,
    this.topLeft,
    this.bottomLeft,
    this.topRight,
    this.bottomRight, required this.width,  this.fontSize=15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.only(
          topLeft: topLeft ?? Radius.zero,
          bottomLeft: bottomLeft ?? Radius.zero,
          topRight: topRight ?? Radius.zero,
          bottomRight: bottomRight ?? Radius.zero,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h,),
        child: Center(
          child: HeadlineLargeText(
            text: text,
            color: Colors.white,
            fontsize: fontSize,
          ),
        ),
      ),
    );
  }
}