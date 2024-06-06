import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType? textInputTypeKeyboard;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;// Add a readOnly flag

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.prefixIcon,
    this.textInputTypeKeyboard,
    this.controller,
    this.validator,
    this.readOnly = false, this.onTap, this.inputFormatters,  // Initialize readOnly
  });

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
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.greenAccent),
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            keyboardType: textInputTypeKeyboard,
            validator: validator,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              errorMaxLines: 100,
              fillColor: Colors.greenAccent,
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.greenAccent,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hoverColor: Colors.greenAccent,
              hintStyle: const TextStyle(
                fontSize: 10,
                color: Colors.greenAccent,
              ),
              hintText: hintText,
            ),
            obscureText: obscureText,
            readOnly: readOnly,  // Set the readOnly property
          ),
        ),
      ),
    );
  }
}
