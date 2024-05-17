import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_data_response_model.dart';
import 'package:buisness_manager/modules/admin/view/widget/user_profile_card.dart';
import 'package:buisness_manager/modules/admin/view/widget/user_profile_update_form.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileViewModel>(
      builder: (context, userProfileViewModel, child) {
        final user = userProfileViewModel.responseUser;
        if (user != null) {
          return CustomContainer(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 25.h),
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const NetworkImage( 'https://via.placeholder.com/150'),
                  ),
                  SizedBox(height: 15.h),
                  HeadlineLargeText(text: user.name, color: Colors.lightBlueAccent),
                  SizedBox(height: 10.h),
                  UserProfileInfoCard(user: user),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCircularButton(
                        text: 'Update',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserProfileUpdateForm()),
                          );
                        },
                      ),
                      SizedBox(width: 20.w),
                      CustomCircularButton(
                        text: 'Delete',
                        onPressed: () {
                          // Add delete functionality here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: Text('No Data', style: TextStyle(fontSize: 18.0)));
      },
    );
  }
}


