import 'package:chat_app/services/Auth/auth_service.dart';
import 'package:chat_app/components/myButton.dart';
import 'package:chat_app/components/mySnackBar.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:chat_app/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key, this.onTap});

  final void Function()? onTap;

  final register_controller = Get.put(RegisterController());
  final auth_services = Get.put(AuthServices());

  //register
  void register(BuildContext context) async {
    if (register_controller.pass_controller.value.text ==
        register_controller.confirm_pass_controller.value.text) {
      try {
        await auth_services.SignUpWithEmailAndPassword(
            register_controller.email_controller.text,
            register_controller.pass_controller.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(MySnackBar(context, e.toString(), true));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(MySnackBar(context, 'Password does not match', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat,
              size: 60.h,
              color: themeColor.primary,
            ),
            50.verticalSpace,
            Text(
              'Create your Account ',
              style: TextStyle(color: themeColor.primary, fontSize: 16.sp),
            ),
            25.verticalSpace,
            MyTextField(
              controller: register_controller.email_controller,
              hinttext: 'Email',
            ),
            15.verticalSpace,
            MyTextField(
              controller: register_controller.pass_controller,
              hinttext: 'Password',
            ),
            15.verticalSpace,
            MyTextField(
              controller: register_controller.confirm_pass_controller,
              hinttext: 'Confirm Password',
            ),
            25.verticalSpace,
            MyButton(
              title: 'Register',
              onTap: () => register(context),
            ),
            25.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  style: TextStyle(color: themeColor.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: themeColor.inversePrimary),
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
