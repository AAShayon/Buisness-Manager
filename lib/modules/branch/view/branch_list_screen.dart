import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:buisness_manager/modules/customer/view/customer_supplier_list_screen.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_update.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import '../model/core/response_model/branch_list_response_model.dart';

class BranchListGridView extends StatelessWidget {
  const BranchListGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BranchViewModel>(
      builder: (context,branchViewModel,child) {
        if(branchViewModel.branchListResponseModel!=null
            &&branchViewModel.branchListResponseModel!.branches!=null
            &&branchViewModel.branchListResponseModel!.branches!.branchList!=null){
          List<Branch> branchList=branchViewModel.branchListResponseModel!.branches!.branchList!;
          return branchList.isNotEmpty
              ?Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                  child: GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: branchList.length,
                    itemBuilder: (context, index) {
                      Branch branch = branchList[index];
                      return CommonUseContainer(
                        color: Colors.blue,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                            child: InkWell(
                              onTap: () {
                                log('===================> ${branchList[index]}');
                                _showBranchOption(context, branch.name, branch.id!,
                                  // branchIndex: index
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${branch.id}" ?? ''),
                                  Text(branch.name ?? ''),
                                  Icon(Icons.business, size: 40.sp),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              :SizedBox.shrink();
        }else{
          return CircularProgressIndicator();
        }
      }
    );
  }
}

void _showBranchOption(BuildContext context, dynamic name, num id) {
  showDialog(
    context: context,
    builder: (showDialogContext) {
      return AlertDialog(
        title: const Text('Branch Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.remove_red_eye_rounded),
              title: const Text('Customer List'),
              onTap: () async {
                // final customerViewModel = Provider.of<CustomerViewModel>(showDialogContext, listen: false);
                // await customerViewModel.customerListFetch(branchId: id.toString(), customerOrSupplierType: 0);
                Navigator.push(showDialogContext, MaterialPageRoute(builder: (context) => CustomerSupplierViewScreen(
                      name: name,
                      branchId: id.toString(),
                      customerOrSupplierType: 0,
                    ),
                  ),
                ).then((value) {
                  Navigator.of(showDialogContext).pop();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.remove_red_eye_rounded),
              title: const Text('Supplier List'),
              onTap: () async {
                Navigator.push(showDialogContext, MaterialPageRoute(builder: (context) => CustomerSupplierViewScreen(
                      name: name,
                      branchId: id.toString(),
                      customerOrSupplierType: 1,
                    ),
                  ),
                ).then((value) {
                  Navigator.of(showDialogContext).pop();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Update'),
              onTap: () {
                Navigator.pop(showDialogContext);
                Navigator.push(
                    showDialogContext,
                    MaterialPageRoute(
                        builder: (context) => BranchUpdate(
                              id: id,
                            )));
                // log("============================>${id}");
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                Navigator.of(showDialogContext).pop();
                showDialog<bool>(
                  context: showDialogContext,
                  barrierDismissible: false,
                  builder: (BuildContext deleteContext) {
                    return AlertDialog(
                      title: Text('Confirm Delete'),
                      content: Text(
                          'Are you sure you want to delete your Branch?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(deleteContext).pop();
                            // Navigator.of(showDialogContext).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () async {
                            final branchViewModel = Provider.of<BranchViewModel>(deleteContext, listen: false);
                            await branchViewModel.deleteBranch(context: deleteContext, branchId: id.toString()).then((isDeleted)async {
                                    if (isDeleted) {
                                      await branchViewModel.branchListFetch().then((value) {
                                        Navigator.of(deleteContext).pop();
                                      });
                                    }
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
