import 'dart:developer';

import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_screen.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_update.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/landing_screen.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BranchListGridView extends StatelessWidget {
  const BranchListGridView({super.key});

  @override
  Widget build(BuildContext context) {


    return Consumer<BranchViewModel>(
          builder: (context,branchViewModel,child) {
            final branches = branchViewModel.branches?.branches;
            return branches != null && branches.isNotEmpty
                ? GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: branches.length,
                    itemBuilder: (context, index) {
                      final branch = branches[index];
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
                        child: CommonUseContainer(
                          color: Colors.blue,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                              child: InkWell(
                                onTap: () {
                                  ApiUrl.branchId="${branch.id}";
                                  _showBranchOption(context, branch.name, branch.id.toString());
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${branch.id}" ?? ''),
                                    Text(branch.name ?? ''),
                                    const Icon(Icons.business, size: 40),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ): const Center(child: Text('No branches available'));
          }
        )
        ;
  }

  void _showBranchOption(BuildContext context, dynamic name, dynamic id) {
    showDialog(
      context: context,
      builder: (context) {
        final branchViewModel = Provider.of<BranchViewModel>(context, listen: false);
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BranchViewScreen(name: name, id: id)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BranchUpdate(id: id,)));
                },
              ),
              branchViewModel.isLoadingState? const CircularProgressIndicator(color: Colors.amber,)
              :ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () async {

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
                    bool isDeleted = await branchViewModel.deleteBranch(context);
                    if (isDeleted) {

                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LandingScreen()),(route) => false,
                        );
                      }
                    }
                  }

                },
              ),
            ],
          ),
        );
      },
    );
  }
}
