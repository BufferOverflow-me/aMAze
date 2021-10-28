import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseException catch (e) {
    debugPrint(e.message);
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<bool> register(String name, String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
