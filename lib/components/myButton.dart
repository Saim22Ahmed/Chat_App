import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.title, this.onTap});
  final title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: themeColor.secondary,
        ),
        padding: EdgeInsets.all(25.w),
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: Center(child: Text(title)),
      ),
    );
  }
}
