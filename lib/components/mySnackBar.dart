import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

MySnackBar(BuildContext context, String message, bool isError) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: isError ? Colors.red[600] : Colors.green[600],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          Icon(
            isError ? Icons.error : Icons.check,
            size: 24.sp,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}
