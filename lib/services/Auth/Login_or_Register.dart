import 'package:chat_app/controllers/login_or_Register_controllers.dart';
import 'package:chat_app/screens/LoginScreen.dart';
import 'package:chat_app/screens/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  LoginOrRegisterScreen({Key? key});

  final login_or_register_controller = Get.put(LoginOrRegisterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => login_or_register_controller.showLoginScreen.value
        ? LoginScreen(
            onTap: () {
              login_or_register_controller.toggleScreen();
            },
          )
        : RegisterScreen(
            onTap: () {
              login_or_register_controller.toggleScreen();
            },
          ));
  }
}
