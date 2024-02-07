import 'package:chat_app/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  void logout() {
    auth_services.SignOut();
  }

  final auth_services = Get.put(AuthServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          // Logout button
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('hi')),
    );
  }
}
