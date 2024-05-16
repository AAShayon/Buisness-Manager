import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_response.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchListGridView extends StatelessWidget {
  final int length;
  const BranchListGridView({
    super.key,
   required this.length, required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.h),
        child: GridView.builder(
          physics:  const NeverScrollableScrollPhysics(),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: length,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 2, // Set to 10 to display 10 cards
          itemBuilder: (BuildContext context, int index) {
            return BranchCustomCard(user: user);
          },
        ),
      ),
    );
  }
}