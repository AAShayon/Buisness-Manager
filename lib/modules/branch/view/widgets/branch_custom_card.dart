import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchCustomCard extends StatelessWidget {
  const BranchCustomCard({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return CommonUseContainer(
      height: 100.h,
      child: InkWell(
        onTap: () {
          _showBranchOption(context);
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${user!.branch}"),
                Icon(Icons.business, size: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showBranchOption(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Branch Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.remove_red_eye_rounded),
              title: Text('View'),
              onTap: () {
                Navigator.pop(context);
                // Add your update logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Update'),
              onTap: () {
                Navigator.pop(context);
                // Add your update logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                // Add your delete logic here
              },
            ),
          ],
        ),
      );
    },
  );
}