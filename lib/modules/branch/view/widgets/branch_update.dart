import 'package:buisness_manager/modules/branch/model/core/request_model/branch_name_update_request_model.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BranchUpdate extends StatelessWidget {
  final num id;
  const BranchUpdate({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final _branchUpdateFormKey = GlobalKey<FormState>();
    final TextEditingController branchNameController = TextEditingController();

    return Consumer<BranchViewModel>(
      builder: (context, branchViewModel, child) {
        return Scaffold(
          body: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadlineLargeText(text: 'Branch Update', color: Colors.white),
                SizedBox(height: 50.h,),
                Form(
                  key: _branchUpdateFormKey,
                  child: CustomTextFormField(
                    hintText: 'Branch Name',
                    prefixIcon: Icons.business,
                    textInputTypeKeyboard: TextInputType.name,
                    controller: branchNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid Branch Name';
                      }
                      return null;
                    },
                  ),
                ),
                branchViewModel.isLoadingState
                    ? const CircularProgressIndicator(color: Colors.amber,)
                    : CustomCircularButton(
                  text: 'Update',
                  onPressed: () {
                    if (_branchUpdateFormKey.currentState!.validate()) {
                      final branchNameUpdateRequestModel = BranchNameUpdateRequestModel(
                          name: branchNameController.text
                      );

                      branchViewModel.branchNameUpdateRequest(branchNameUpdateRequestModel, context,branchId: id.toString()).then((isUpdate) {
                        if (isUpdate) {
                      Navigator.pop(context);
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
