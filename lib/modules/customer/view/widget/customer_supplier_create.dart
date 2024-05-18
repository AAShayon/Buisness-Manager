import 'package:buisness_manager/modules/branch/view/widgets/branch_screen.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomerOrSupplierCreate extends StatefulWidget {
  const CustomerOrSupplierCreate({super.key});

  @override
  State<CustomerOrSupplierCreate> createState() => _CustomerOrSupplierCreateState();
}

class _CustomerOrSupplierCreateState extends State<CustomerOrSupplierCreate> {
  final RegExp phoneRegex = RegExp(r'^\+?(88)?0[1-9]\d{8,9}$');
  final _customerCreateFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController routingNumberController = TextEditingController();
  final TextEditingController swiftCodeController = TextEditingController();

  String? customerOrSupplier;

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    addressController.dispose();
    areaController.dispose();
    postCodeController.dispose();
    cityController.dispose();
    stateController.dispose();
    accountNameController.dispose();
    accountNumberController.dispose();
    routingNumberController.dispose();
    swiftCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Form(
        key: _customerCreateFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: HeadLineMediumText(
                        text: 'Add Customer OR Supplier', color: Colors.lightGreen)),
                SizedBox(height: 25.h),
                Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.w),
                          child: Column(
                            children: [
                              CustomTextFormField(
                                hintText: 'Name',
                                prefixIcon: Iconsax.user,
                                textInputTypeKeyboard: TextInputType.text,
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Phone',
                                prefixIcon: Iconsax.mobile,
                                textInputTypeKeyboard: TextInputType.phone,
                                controller: phoneNumberController,
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
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Email',
                                prefixIcon: Icons.email,
                                textInputTypeKeyboard: TextInputType.emailAddress,
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Customer / Supplier',
                                  prefixIcon: Icon(Icons.add),
                                  border: OutlineInputBorder(),
                                ),
                                value: customerOrSupplier,
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'customer',
                                    child: Text('Customer'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'supplier',
                                    child: Text('Supplier'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    customerOrSupplier = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Customer/Supplier';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Address',
                                prefixIcon: Icons.location_city,
                                textInputTypeKeyboard: TextInputType.streetAddress,
                                controller: addressController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Area',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.streetAddress,
                                controller: areaController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter area';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Post Code',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.text,
                                controller: postCodeController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Post Code';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'City',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.text,
                                controller: cityController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter City';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'State',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.streetAddress,
                                controller: stateController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter State';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Account Name',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.text,
                                controller: accountNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Account Name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Account Number',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.number,
                                controller: accountNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Account Number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Routing Number',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.text,
                                controller: routingNumberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Routing Number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.h),
                              CustomTextFormField(
                                hintText: 'Swift Code',
                                prefixIcon: Icons.location_on_outlined,
                                textInputTypeKeyboard: TextInputType.number,
                                controller: swiftCodeController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Swift Code';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CustomCircularButton(
                          text: 'Create',
                          onPressed: () {
                            if (_customerCreateFormKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BranchViewScreen(),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
