import 'package:buisness_manager/modules/admin/model/core/response_model/user_profile_response.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_custom_card.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BranchListGridView extends StatelessWidget {
  const BranchListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final branchViewModel =
        Provider.of<BranchViewModel>(context, listen: false);
    final branches = branchViewModel.branches?.branches;
    // return branches != null && branches.isNotEmpty?
    return SizedBox(
      height: 500.h,
      width: 300.w,
      child: branches != null && branches.isNotEmpty
          ? GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: branches.length,
              itemBuilder: (context, index) {
                final branch = branches[index];
                return CommonUseContainer(
                  child: Card(
                    child:Padding(padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w)
                    ,child: InkWell(
                        onTap: (){
                          _showBranchOption(context);
                        },
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("${branch.id}"??''),
                         Text("${branch.name}" ??''),
                         const Icon(Icons.business, size: 40),
                       ],
                      ),
                    ),

                    )
                    // ListTile(
                    //   title: Text(branch.name ?? ''),
                    //   subtitle: Text(branch.id.toString() ?? ''),
                    //   onTap: () {
                    //     // Handle branch item tap
                    //   },
                    // ),
                  ),
                );
              },
            )
          : Center(child: Text('No branches available')),
    );
  }

  void _showBranchOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Branch Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.remove_red_eye_rounded),
                title: const Text('View'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your update logic here
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your update logic here
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
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
}
