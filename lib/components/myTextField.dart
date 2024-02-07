import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key, required this.hinttext, required this.controller});

  final String hinttext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeColor.tertiary)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeColor.primary),
          ),
          filled: true,
          fillColor: themeColor.secondary,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: themeColor.primary,
          ),
        ),
        obscureText: hinttext == 'Password' || hinttext == 'Confirm Password'
            ? true
            : false,
        controller: controller,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
