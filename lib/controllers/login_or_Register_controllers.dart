import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOrRegisterController extends GetxController {
  final email_controller = TextEditingController();

  final pass_controller = TextEditingController();

  RxBool showLoginScreen = true.obs;

  void toggleScreen() {
    showLoginScreen.value = !showLoginScreen.value;
    print(showLoginScreen.value);
  }
}
