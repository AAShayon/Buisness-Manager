import 'package:buisness_manager/modules/admin/view/widget/user_profile_update_form.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
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
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
            child: Container(
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
                    child: CustomTextFormField(hintText: 'phone', prefixIcon: Icons.perm_identity,readOnly: true,),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                    child: CustomTextFormField(hintText: 'Business Name', prefixIcon: Icons.perm_identity,readOnly: true,),
                  ),Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                    child: CustomTextFormField(hintText: 'Business Type', prefixIcon: Icons.perm_identity,readOnly: true,),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                    child: CustomTextFormField(hintText: 'Business Type ID', prefixIcon: Icons.perm_identity,readOnly: true,),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                    child: CustomTextFormField(hintText: 'Company ID', prefixIcon: Icons.perm_identity,readOnly: true,),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.h,vertical: 5.h),
                    child: CustomTextFormField(hintText: 'Branch ID', prefixIcon: Icons.perm_identity,readOnly: true,),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomCircularButton(text: 'Update', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileUpdateForm()));
                }),
              ),
              CustomCircularButton(text: 'Delete', onPressed: (){}),
            ],
          ),
        ],
      ),
    ));
  }
}
