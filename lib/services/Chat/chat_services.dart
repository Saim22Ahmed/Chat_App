import 'package:chat_app/models/message.dart';
import 'package:chat_app/services/Auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class ChatServices extends GetxController {
  // instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final auth_services = Get.put(AuthServices());

  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((docs) {
        final user = docs.data();
        return user;
      }).toList();
    });
  }

  // Send message
  Future<void> sendMessage(String receiverID, message) async {
    // getting current user info

    final currentUserId = auth_services.CurrentUser!.uid;
    final currentUserEmail = auth_services.CurrentUser!.email!;

    // creating a message
    Message Newmessage = Message(
        senderEmail: currentUserEmail,
        senderId: currentUserId,
        receiverId: receiverID,
        message: message,
        timestamp: Timestamp.now());

    // construct roomID between two users to ensure uniqueness
    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String ChatRoomID = ids.join('_');

    // adding message to the database
    await _firestore
        .collection("chat_rooms")
        .doc(ChatRoomID)
        .collection('messages')
        .add(Newmessage.toMap());
  }

  // get messages
  Stream<QuerySnapshot> getMessages(String UserId, User2Id) {
    // construct roomID between two users
    List<String> ids = [UserId, User2Id];
    ids.sort();
    String ChatRoomID = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(ChatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
