import 'package:buisness_manager/modules/auth/model/core/request_model/login_send_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/view/registration.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/view/otp_sending.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey=GlobalKey<FormState>();
  final TextEditingController identifierController = TextEditingController();
  final RegExp phoneRegex = RegExp(r'^01\d{9}$');
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  @override
  void dispose() {
    identifierController.dispose();
    super.dispose();
  }
  String? validateIdentifier(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number or email';
    } else if (!phoneRegex.hasMatch(value) && !emailRegex.hasMatch(value)) {
      if (!phoneRegex.hasMatch(value)) {
        return 'Please enter a valid phone number of 11 Digits';
      } else if (!emailRegex.hasMatch(value)) {
        return 'Please enter a valid email';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
          return CustomContainer(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Image.asset("assets/businessManager.png",fit: BoxFit.fill,color: Colors.black,),
                  ),
              
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.h),
                    child: const HeadlineLargeText(
                      text: 'Please Login',
                      color: Colors.white,
                    ),
                  ),
                  Form(
                    key: _loginFormKey,
                    child: CustomTextFormField(
                      hintText: 'Mobile or Email',
                      prefixIcon: Iconsax.user,
                      textInputTypeKeyboard: TextInputType.text,
                      controller: identifierController,
                        validator:validateIdentifier
                    
                    
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  authViewModel.isLoadingState
                      ? const CircularProgressIndicator(
                    color: Colors.green,
                  )
                      :
                  CustomCircularButton(
                      text: 'Next',
                      onPressed: () async {
                        if(_loginFormKey.currentState!.validate()){
                          if (!authViewModel.isLoadingState) {
                            String identifier = identifierController.text.trim();
                            if (validateIdentifier(identifier) == null) {
                              await authViewModel
                                  .sendOtpForLogin(
                                SendOtpRequestForLoginModel(identifier: identifier),
                                context,
                              )
                                  .then((value) {
                                if (value == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                        identifier: identifier,
                                        isLoginPage: true,
                                      )));
                                }
                              });
                            }
                          }
                        }
                      }),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationPage()));
                      },
                      child: HeadLineSmallText(
                          text:
                          "If you don't have an account yet,please Sign Up",
                          color: Colors.white)),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomCircularButton(
                      text: 'Signup',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationPage()));
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
