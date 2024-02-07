import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in Method
  Future<UserCredential> SignInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign up Method
  Future<UserCredential> SignUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign out Method
  Future<void> SignOut() async {
    await _auth.signOut();
  }
}
