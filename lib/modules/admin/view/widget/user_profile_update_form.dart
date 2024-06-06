import 'package:buisness_manager/modules/admin/model/core/request_model/user_profile_update_request_model.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserProfileUpdateForm extends StatefulWidget {
  const UserProfileUpdateForm({super.key});

  @override
  State<UserProfileUpdateForm> createState() => _UserProfileUpdateFormState();
}

class _UserProfileUpdateFormState extends State<UserProfileUpdateForm> {
  final _userProfileUpdateForm = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  String? selectedBusinessType;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<UserProfileViewModel>(context);
    return Scaffold(
      body: CustomContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25.h),
              const HeadlineLargeText(text: 'User Profile Update', color: Colors.white),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: _userProfileUpdateForm,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: nameController,
                            hintText: 'Name',
                            prefixIcon: Icons.update,
                            readOnly: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid Name';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                            child: DropdownButtonFormField<String>(
                              decoration:  InputDecoration(
                                  labelText: 'Business Type',
                                  labelStyle: TextStyle(color: Colors.greenAccent),
                                  prefixIcon: Icon(Icons.add,color: Colors.greenAccent,),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),focusColor: Colors.greenAccent

                              ),
                              value: selectedBusinessType,
                              items: const [
                                DropdownMenuItem<String>(
                                  value: '1',
                                  child: Text('Retailer/Shop',style: TextStyle(color: Colors.greenAccent),),
                                ),
                                DropdownMenuItem<String>(
                                  value: '2',
                                  child: Text('Wholesaler',style: TextStyle(color: Colors.greenAccent),),
                                ),
                                DropdownMenuItem<String>(
                                  value: '3',
                                  child: Text('Distributor',style: TextStyle(color: Colors.greenAccent),),
                                ),
                                DropdownMenuItem<String>(
                                  value: '4',
                                  child: Text('Manufacturer',style: TextStyle(color: Colors.greenAccent),),
                                ),
                                DropdownMenuItem<String>(
                                  value: '6',
                                  child: Text('Services',style: TextStyle(color: Colors.greenAccent),),
                                ),
                                DropdownMenuItem<String>(
                                  value: '7',
                                  child: Text('Other',style: TextStyle(color: Colors.greenAccent),),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedBusinessType = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a business type';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: userProfileViewModel.isLoadingState
                    ? const CircularProgressIndicator(
                  color: Colors.amber,
                )
                    : CustomCircularButton(
                  text: 'Update',
                  onPressed: () {
                    if (_userProfileUpdateForm.currentState!.validate()) {
                      final userProfileUpdateRequestModel = UserProfileUpdateRequestModel(
                        name: nameController.text,
                        businessTypeId: selectedBusinessType!,
                      );
                      userProfileViewModel.userProfileUpdateRequest(userProfileUpdateRequestModel,context).then((isUpdate) {
                        if (isUpdate) {
                        Navigator.pop(context);
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
