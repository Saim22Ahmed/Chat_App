import 'dart:async';

import 'package:chat_app/components/ChatBubble.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:chat_app/controllers/chatscreen_controller.dart';
import 'package:chat_app/services/Auth/auth_service.dart';
import 'package:chat_app/services/Chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen(
      {super.key, required this.recieverEmail, required this.recieverId});
  final dynamic recieverEmail;
  final dynamic recieverId;

  final _msgController = TextEditingController();

  final _chatscreenController = Get.put(ChatScreenController());
  final _auth_services = Get.put(AuthServices());
  final _chat_services = Get.put(ChatServices());

  void sendMessage() async {
    if (_msgController.text.isNotEmpty) {
      await _chat_services.sendMessage(recieverId, _msgController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          recieverEmail,
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Expanded(child: buildMessageList()),
            _buildUserInput(context)
          ],
        ),
      ),
    );
  }

  // messageList
  Widget buildMessageList() {
    String senderId = _auth_services.CurrentUser!.uid;
    return StreamBuilder(
        stream: _chat_services.getMessages(senderId, recieverId),
        builder: (context, snapshot) {
          // incase of error
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          // incase of loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // incase of data available
          return ListView(
            // reverse: true,
            controller: _chatscreenController.scrollController.value,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  // MessageItem
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // isCurrent User?
    bool isCurrentUser = data['senderId'] == _auth_services.CurrentUser!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child:
            ChatBubble(message: data['message'], isCurrentUser: isCurrentUser));
  }

  // UserInput
  Widget _buildUserInput(context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        children: [
          Expanded(
              child: MyTextField(
                  onTap: () {
                    Future.delayed(300.ms, () {
                      _chatscreenController.scrolldown();
                    });
                  },
                  textinputaction: TextInputAction.newline,
                  maxlines: null,
                  hinttext: 'Type your message',
                  controller: _msgController)),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF3BA03E),
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 20.r),
            child: IconButton(
                onPressed: () {
                  sendMessage();
                  _msgController.clear();
                  Future.delayed(80.ms, () {
                    _chatscreenController.scrolldown();
                  });
                },
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).colorScheme.tertiary,
                )),
          )
        ],
      ),
    );
  }
}
