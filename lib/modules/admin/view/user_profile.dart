import 'dart:developer';

import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_data_response_model.dart';
import 'package:buisness_manager/modules/admin/view/widget/user_profile_card.dart';
import 'package:buisness_manager/modules/admin/view/widget/user_profile_update_form.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key});

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
                    backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
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
                      userProfileViewModel.isLoadingState
                          ? CircularProgressIndicator(color: Colors.amber)
                          : CustomCircularButton(
                        text: 'Delete',
                        onPressed: () async {
                          bool? deleteConfirmed = await _confirmDelete(context);
                          if (deleteConfirmed ?? false) {
                            log("Starting deletion process...");
                            bool isDeleted = await userProfileViewModel.deleteUserProfile(context);
                            log("Deletion process completed. IsDeleted: $isDeleted");
                            if (isDeleted) {
                              // Navigate to the login page after successful deletion
                              log("Navigating to login page after successful deletion...");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                            } else {
                              log("Deletion failed. Please check logs for more details.");
                            }
                          }
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

  Future<bool?> _confirmDelete(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete your profile from this app?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
