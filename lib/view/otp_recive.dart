import 'package:buisness_manager/modules/auth/model/core/request_model/logIn_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/request_model/register_verify_otp_request_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:buisness_manager/view/landing_screen.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OtpReceive extends StatelessWidget {
  final dynamic identifier;
  final bool isLoginPage;
 OtpReceive({super.key,required this.identifier, required this.isLoginPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: Consumer<AuthViewModel>(
        builder: (context,authViewModel,child) {
          return CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.h),
                  child: HeadlineLargeText(
                    text: 'Enter Your OTP Here',
                    color: Colors.white,
                  ),
                ),
                OtpTextField(
                  fieldWidth: 50.h,
                  numberOfFields: 6,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Handle validation or checks here
                  },
                  onSubmit: (String verificationCode) async {
                    if (!authViewModel.isLoadingState) {
                      if(isLoginPage){
                        LogInRequestModel logInRequestModel = LogInRequestModel(
                          otpCode: verificationCode,
                          identifier: identifier,
                        );
                        await authViewModel.logInWithOtp(logInRequestModel,context).then((loggedIn) {
                          if(loggedIn){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LandingScreen(),), (route) => false,);
                          }
                          return null;
                        });
                      }else{
                        RegisterVerifyOtpRequestModel verifyOtpRegisterRequestModel=RegisterVerifyOtpRequestModel(
                            otpCode: verificationCode,
                            identifierId: identifier
                        );
                        await authViewModel.registrationVerifyOtp(verifyOtpRegisterRequestModel,context).then((registered) {
                          if(registered){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Login(),), (route) => false,);
                          }
                          return null;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showInvalidOtpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Invalid Verification Code"),
          content: Text('Please enter a valid verification code.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}