import 'package:buisness_manager/modules/auth/model/core/request_model/register_request_model.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/view/otp_sending.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  String? selectedBusinessType;

  @override
  void dispose() {
    phoneNumberController.dispose();
    emailController.dispose();
    nameController.dispose();
    businessNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Consumer<AuthViewModel>(
          builder: (context,authViewModel,child) {
            return CustomContainer(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(child: HeadLineMediumText(text: 'Welcome to Registration', color: Colors.lightGreen)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 45.w),
                                  child: Column(
                                    children: [
                                      CustomTextFormField(
                                        hintText: 'Phone',
                                        prefixIcon: Iconsax.mobile,
                                        textInputTypeKeyboard: TextInputType.phone,
                                        controller: phoneNumberController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a phone number';
                                          }else if (!RegExp(r'^01\d{9}$').hasMatch(value)) {
                                            return 'Please enter a valid phone number of 11 Digits';
                                          }
                                          return null;
                                        },
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly,
                                            LengthLimitingTextInputFormatter(11),
                                          ]
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
                                          }else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 15.h),
                                      CustomTextFormField(
                                        hintText: 'Name',
                                        prefixIcon: Iconsax.user,
                                        textInputTypeKeyboard: TextInputType.text,
                                        controller: nameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 15.h),
                                      CustomTextFormField(
                                        hintText: 'Business Name',
                                        prefixIcon: Icons.business,
                                        textInputTypeKeyboard: TextInputType.text,
                                        controller: businessNameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a business name';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 15.h),
                                      DropdownButtonFormField<String>(
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
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        authViewModel.isLoadingState?
                        const CircularProgressIndicator(
                          color: Colors.green,
                        ):
                        CustomCircularButton(
                          text: 'Next',
                          onPressed: () async {

                            if (_formKey.currentState!.validate()) {
                              final registerRequestModel=RegisterRequestModel(
                                phone: phoneNumberController.text,
                                email: emailController.text,
                                name: nameController.text,
                                businessName: businessNameController.text,
                                businessTypeId: selectedBusinessType!,
                              );
                              authViewModel.registration(registerRequestModel,context).then((isRegistered) {
                                if(isRegistered){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(identifier: authViewModel.registerRequestResponseModel!.identifierId, isLoginPage: false,)));
                                }
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );

  }
}
