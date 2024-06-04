
import 'package:buisness_manager/modules/branch/model/core/request_model/branch_create_request_model.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BranchCreate extends StatelessWidget {
  const BranchCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final _branchCreateFormKey = GlobalKey<FormState>();
    final TextEditingController branchNameController = TextEditingController();

    return Consumer<BranchViewModel>(
      builder: (context,branchViewModel,child) {
        return Scaffold(
          body: CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadlineLargeText(text: 'Branch Create', color: Colors.white),
                  SizedBox(height: 50.h,),
                  Form(
                    key: _branchCreateFormKey,
                    child: CustomTextFormField(
                      hintText: 'Branch Name',
                      prefixIcon: Icons.add,
                      textInputTypeKeyboard: TextInputType.name,
                      controller: branchNameController,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter Valid Branch Name';
                        }
                        return null;
                      },),
                  ),
                  branchViewModel.isLoadingState?const CircularProgressIndicator(color: Colors.amber,):
                  CustomCircularButton(text: 'Create', onPressed: (){
                    if (_branchCreateFormKey.currentState!.validate()){
                      final branchCreateRequestModel=BranchCreateRequestModel(
                          name: branchNameController.text
                      );
                      branchViewModel.createBranch(branchCreateRequestModel,context).then((isCreate) {
                        if(isCreate){
                          Navigator.pop(context);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Name is already registered'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      });

                    }

                  }),
                ],
              )),
        );
      }
    );
  }
}
