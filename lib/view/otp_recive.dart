import 'package:buisness_manager/modules/auth/model/core/request_model/logIn_request_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:buisness_manager/view/landing_screen.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OtpReceive extends StatelessWidget {
  final String identifier;
  const OtpReceive({super.key,required this.identifier});

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
                      LogInRequestModel logInRequestModel = LogInRequestModel(
                        otpCode: verificationCode,
                        identifier: identifier,
                      );

                      bool success = await authViewModel.logInWithOtp(logInRequestModel);
                      if (success) {
                        // Navigate to the home screen
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingScreen(logInResponseModel: authViewModel.logInResponseModel!),
                          ),
                              (route) => false,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(child: Text('Successfully Logged In', style: TextStyle(color: Colors.black.withOpacity(.5)))),
                          ),
                        );
                      } else {
                        _showInvalidOtpDialog(context);
                      }
                    }
                  },
                ),
              ],
            ),
          );
        }
      ),
    );
  }
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