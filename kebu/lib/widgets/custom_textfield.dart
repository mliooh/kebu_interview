import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscureText;
  final Icon icon;
  final String? errorText;
  final TextInputType keyboardtype;
  const CustomTextfield(
      {super.key,
      required this.text,
      required this.obscureText,
      required this.icon,
      required this.errorText,
      required this.keyboardtype,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: icon,
            prefixIconColor: Colors.grey.shade600,
            errorText: errorText,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8.sp,
                ),
                borderSide: BorderSide(color: Colors.grey.shade600))),
      ),
    );
  }
}
