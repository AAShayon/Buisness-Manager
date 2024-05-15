import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType textInputTypeKeyboard;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
        this.obscureText = false,
        required this.hintText,
        required this.prefixIcon, required this.textInputTypeKeyboard, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(67, 71, 77, 0.08),
            spreadRadius: 10,
            blurRadius: 40,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Center(
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            border: Border.all(color: Colors.white)
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: textInputTypeKeyboard,
            validator: validator,
            decoration: InputDecoration(


              prefixIcon: Icon(
                prefixIcon,
                color: Colors.blue,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: const TextStyle(
                fontSize: 10,
                color: Color.fromRGBO(
                  131,
                  143,
                  160,
                  100,
                ),
              ),
              hintText: hintText,
            ),
            obscureText: obscureText,
          ),
        ),
      ),
    );
  }
}