import 'package:chat_app/services/Auth/auth_service.dart';
import 'package:chat_app/screens/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  void logout() {
    auth_services.SignOut();
  }

  final auth_services = Get.put(AuthServices());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // Logo
          Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                  dividerTheme: DividerThemeData(color: Colors.transparent)),
              child: DrawerHeader(
                  margin: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.chat,
                    size: 40.sp,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
            ),
          ),

          // Menu Items
          // Home ListTile

          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text('H O M E'),
              onTap: () {
                Get.back();
              },
            ),
          ),
          //  Settings ListTile
          Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: Text('S E T T I N G S'),
                onTap: () {
                  Get.to(() => SettingScreen(),
                      transition: Transition.rightToLeft, duration: 250.ms

                      // popGesture: true,
                      );
                  Scaffold.of(context).closeDrawer();
                },
              )),
          // Logout Tile
          Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text('L O G O U T'),
                onTap: () {
                  logout();
                },
              ))
        ],
      ),
    );
  }
}
