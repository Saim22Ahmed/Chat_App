import 'package:chat_app/components/UserTile.dart';
import 'package:chat_app/controllers/chatscreen_controller.dart';
import 'package:chat_app/screens/ChatScreen.dart';
import 'package:chat_app/services/Auth/auth_service.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/Chat/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final auth_services = Get.put(AuthServices());
  final chat_services = Get.put(ChatServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: chat_services.getUserStream(),
        builder: (context, snapshot) {
          // incase of error
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          // incase of loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // incase of data available
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userdata) => _buildUserListItem(userdata, context))
                .toList(),
          );
        });
  }

  // individual User list
  Widget _buildUserListItem(
      Map<String, dynamic> userdata, BuildContext context) {
    // display all user except the current one
    if (userdata['email'] == auth_services.CurrentUser!.email) {
      return Container();
    } else {
      return UserTile(
        text: userdata['email'],
        onTap: () {
          Get.to(
              () => ChatScreen(
                    recieverEmail: userdata['email'],
                    recieverId: userdata['uid'],
                  ),
              transition: Transition.rightToLeft,
              duration: 250.ms);
        },
      );
    }
  }
}
