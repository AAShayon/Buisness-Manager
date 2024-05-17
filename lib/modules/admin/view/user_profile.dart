import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.h,),
          HeadlineLargeText(text: 'UserName', color: Colors.white),
          Container(
            width: 350.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(10),),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                  child: CustomTextFormField(hintText: 'ID', prefixIcon: Icons.perm_identity,readOnly: true,),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                  child: CustomTextFormField(hintText: 'Email', prefixIcon: Icons.perm_identity,readOnly: true,),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                  child: CustomTextFormField(hintText: 'ID', prefixIcon: Icons.perm_identity,readOnly: true,),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                  child: CustomTextFormField(hintText: 'phone', prefixIcon: Icons.perm_identity,readOnly: true,),
                ),Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                  child: CustomTextFormField(hintText: 'ID', prefixIcon: Icons.perm_identity,readOnly: true,),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                  child: CustomTextFormField(hintText: 'ID', prefixIcon: Icons.perm_identity,readOnly: true,),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
