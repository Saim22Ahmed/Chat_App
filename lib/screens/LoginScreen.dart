import 'package:chat_app/Auth/auth_service.dart';
import 'package:chat_app/components/myButton.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:chat_app/controllers/login_controller.dart';
import 'package:chat_app/controllers/login_or_Register_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, this.onTap});

  final void Function()? onTap;

  final login_controller = Get.put(LoginController());
  final auth_services = Get.put(AuthServices());

  void login(BuildContext context) async {
    try {
      await auth_services.SignInWithEmailAndPassword(
          login_controller.email_controller.text,
          login_controller.pass_controller.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat,
              size: 60.h,
              color: Theme.of(context).colorScheme.primary,
            ),
            50.verticalSpace,
            Text(
              'Welcome back , you\'ve been missed',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16.sp),
            ),
            25.verticalSpace,
            MyTextField(
              controller: login_controller.email_controller,
              hinttext: 'Email',
            ),
            15.verticalSpace,
            MyTextField(
              controller: login_controller.pass_controller,
              hinttext: 'Password',
            ),
            25.verticalSpace,
            MyButton(
              title: 'Login',
              onTap: () => login(context),
            ),
            25.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account ? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
