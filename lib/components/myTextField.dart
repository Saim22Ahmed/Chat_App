import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.hinttext,
      required this.controller,
      this.textinputaction,
      this.maxlines = 1,
      this.onTap});

  final String hinttext;
  final TextEditingController controller;
  final TextInputAction? textinputaction;
  final int? maxlines;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: TextField(
          onTap: onTap,
          maxLines: maxlines,
          inputFormatters: [
            FilteringTextInputFormatter.deny(new RegExp(r'^\s*$'))
          ],
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
          textInputAction: textinputaction
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
          ),
    );
  }
}
