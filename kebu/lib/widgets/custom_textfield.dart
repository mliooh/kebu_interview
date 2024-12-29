import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscureText;
  final Icon icon;
  const CustomTextfield({super.key, required this.text, required this.controller, required this.obscureText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle( color: Colors.grey.shade600),
          prefixIcon: icon,
          prefixIconColor: Colors.grey.shade600,
          
          
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


// bool passwordLength() {
// if 
// }