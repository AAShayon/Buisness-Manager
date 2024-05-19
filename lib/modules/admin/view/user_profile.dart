import 'package:buisness_manager/modules/admin/view/widget/user_profile_card.dart';
import 'package:buisness_manager/modules/admin/view/widget/user_profile_update_form.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<UserProfileViewModel>(
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
                  backgroundImage: const AssetImage('assets/userimage.png'),
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

                        bool? confirmDelete = await showDialog<bool>(
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
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        if (confirmDelete == true) {
                          bool isDeleted = await userProfileViewModel.deleteUserProfile(context);
                          if (isDeleted) {
                            if (context.mounted) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),(route) => false,
                              );
                            }
                          }
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }
      return const Center(child: Text('No Data', style: TextStyle(fontSize: 18.0)));
    },

    ));
  }


}
