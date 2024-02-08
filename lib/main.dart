import 'package:chat_app/services/Auth/Login_or_Register.dart';
import 'package:chat_app/services/Auth/auth_gate.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/LoginScreen.dart';
import 'package:chat_app/screens/RegisterScreen.dart';
import 'package:chat_app/themes/light_mode.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthGate(),
          theme: Provider.of<ThemeProvider>(context).themeData,
        );
      },
    );
  }
}
