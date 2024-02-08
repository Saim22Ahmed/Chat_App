import 'package:chat_app/models/message.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 25.w),
      decoration: BoxDecoration(
          color: isCurrentUser
              ? isDarkMode
                  ? Colors.green.shade600
                  : Colors.green.shade600
              : isDarkMode
                  ? Colors.grey[400]
                  : Colors.white,
          borderRadius: BorderRadius.circular(25.r)),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
