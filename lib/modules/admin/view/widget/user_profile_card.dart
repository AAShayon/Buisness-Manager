import 'package:buisness_manager/modules/admin/view/widget/user_profile_field.dart';
import 'package:flutter/material.dart';
import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_data_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileInfoCard extends StatelessWidget {
  const UserProfileInfoCard({Key? key, required this.user}) : super(key: key);

  final ResponseUser user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          UserProfileField(label: 'Email', value: user.email, icon: Icons.email),
          UserProfileField(label: 'Phone', value: user.phone, icon: Icons.phone),
          UserProfileField(label: 'Business Name', value: user.businessName, icon: Icons.business),
          UserProfileField(label: 'Business Type', value: user.businessType, icon: Icons.category),
          UserProfileField(label: 'Company ID', value: user.companyId.toString(), icon: Icons.perm_identity),
          UserProfileField(label: 'Branch ID', value: user.branchId.toString(), icon: Icons.perm_identity),
          UserProfileField(label: 'Branch', value: user.branch, icon: Icons.location_city),
        ],
      ),
    );
  }
}