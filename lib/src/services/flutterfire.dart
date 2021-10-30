import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FlutterFire extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      return e.message;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  Future register(String name, String email, String password) async {
    notifyListeners();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser?.sendEmailVerification();
      await _auth.currentUser?.updateDisplayName(name);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        return e.message;
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        return e.message;
      }
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
