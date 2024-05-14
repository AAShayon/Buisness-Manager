import 'package:buisness_manager/view/screens/auth/registration.dart';
import 'package:buisness_manager/view/screens/common/otp_sending.dart';
import 'package:buisness_manager/view/screens/widgets/custom_circular_button.dart';
import 'package:buisness_manager/view/screens/widgets/custom_container.dart';
import 'package:buisness_manager/view/screens/widgets/custom_text_from_filed.dart';
import 'package:buisness_manager/view/screens/widgets/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneNumberController = TextEditingController();
  // final RegExp phoneRegex = RegExp(r'^\+880\d{10}$');
  final RegExp phoneRegex = RegExp(r'^(\+880\d{10}|01\d{9})$');

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        RoundedCircularButton(
            text: 'Next',
            onPressed: () {
              String phoneNumber = phoneNumberController.text.trim();
              if (phoneRegex.hasMatch(phoneNumber)) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtpScreen()));
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                        child: Text(
                            'Please enter a valid Bangladeshi phone number.')),
                  ),
                );
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
                text: "If you don't have an account yet,please Sign Up",
                color: Colors.white)),
        SizedBox(
          height: 25.h,
        ),
        RoundedCircularButton(
            text: 'Signup',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()));
            })
      ],
    ));
  }
}
