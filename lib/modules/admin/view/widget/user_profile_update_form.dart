import 'package:buisness_manager/modules/admin/model/core/request_model/user_profile_update_request_model.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/view/landing_screen.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
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
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? selectedBusinessType;
  final RegExp phoneRegex = RegExp(r'^\+?(88)?0[1-9]\d{8,9}$');

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<UserProfileViewModel>(context);
    return CustomContainer(
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
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
                      child: CustomTextFormField(
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
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
                      child: CustomTextFormField(
                        controller: phoneNumberController,
                        hintText: 'Phone',
                        prefixIcon: Icons.phone,
                        readOnly: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          if (!phoneRegex.hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Business Type',
                          prefixIcon: Icon(Icons.add),
                          border: OutlineInputBorder(),
                        ),
                        value: selectedBusinessType,
                        items: const [
                          DropdownMenuItem<String>(
                            value: '1',
                            child: Text('Retailer/Shop'),
                          ),
                          DropdownMenuItem<String>(
                            value: '2',
                            child: Text('Wholesaler'),
                          ),
                          DropdownMenuItem<String>(
                            value: '3',
                            child: Text('Distributor'),
                          ),
                          DropdownMenuItem<String>(
                            value: '4',
                            child: Text('Manufacturer'),
                          ),
                          DropdownMenuItem<String>(
                            value: '6',
                            child: Text('Services'),
                          ),
                          DropdownMenuItem<String>(
                            value: '7',
                            child: Text('Other'),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
                      child: CustomTextFormField(
                        controller: emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                        readOnly: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
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
                    phone: phoneNumberController.text,
                    email: emailController.text,
                    businessTypeId: selectedBusinessType!,
                  );
                  userProfileViewModel.userProfileUpdateRequest(userProfileUpdateRequestModel).then((isUpdate) {
                    if (isUpdate) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LandingScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Phone number or email is needed to update'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
