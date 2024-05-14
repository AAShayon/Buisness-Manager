import 'package:flutter/material.dart';
import 'package:buisness_manager/view/screens/home/home.dart';
import 'package:buisness_manager/view/screens/widgets/custom_container.dart';
import 'package:buisness_manager/view/screens/widgets/text_size.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpReceive extends StatelessWidget {
  const OtpReceive({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: CustomContainer(
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
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                // Handle validation or checks here
              },
              onSubmit: (String verificationCode) {
                if (verificationCode == '123456') {
                  // Navigate to the home screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                        (route) => false,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(child: Text('Successfully Logged In',style: TextStyle(color: Colors.black.withOpacity(.5)),)),
                    ),
                  );
                } else {
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
