import 'package:buisness_manager/modules/auth/model/core/request_model/login_send_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/view/registration.dart';
import 'package:buisness_manager/modules/auth/view_model/auth_view_model.dart';
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
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneNumberController = TextEditingController();
  final RegExp phoneRegex = RegExp(r'^(\+880\d{10}|01\d{9})$');

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context,authViewModel,child) {
        return CustomContainer(
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
            const HeadlineLargeText(
              text: 'Buisness Manager',
              color: Colors.blueAccent,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: const HeadlineLargeText(
                text: 'Login',
                color: Colors.white,
              ),
            ),
            CustomTextFormField(
              hintText: 'Mobile',
              prefixIcon: Iconsax.mobile,
              textInputTypeKeyboard: TextInputType.phone,
              controller: phoneNumberController,
            ),
            SizedBox(
              height: 25.h,
            ),
            authViewModel.isLoadingState?const CircularProgressIndicator(
              color: Colors.amber,
            ):RoundedCircularButton(
                text: 'Next',
                onPressed: () async{
                  if(!authViewModel.isLoadingState){
                    String phoneNumber = phoneNumberController.text.trim();
                    if (phoneRegex.hasMatch(phoneNumber)){
                      // ApiUrl.branchId="dfg";
                      // log("====>${ApiUrl.branchUpdate}");
                      await authViewModel.sendOtpForLogin(SendOtpRequestForLoginModel(identifier: phoneNumber),context).then((value){
                        if(value==true){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  OtpScreen(identifier: phoneNumber, isLoginPage:true,)));
                        }
                      });
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                              child: Text('Please enter a valid Bangladeshi phone number.')),
                        ),
                      );
                    }
                  }
                }),
            SizedBox(
              height: 25.h,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                },
                child: HeadLineSmallText(
                    text: "If you don't have an account yet,please Sign Up",
                    color: Colors.white)),
            SizedBox(
              height: 25.h,
            ),
            RoundedCircularButton(
                text: 'Signup',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                })
                      ],
                    ));
      }
    );
  }
}
