import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child:
                  Text(FirebaseAuth.instance.currentUser?.displayName ?? '')),
          Center(
              child: Text(
                  FirebaseAuth.instance.currentUser?.emailVerified.toString() ??
                      '')),
          TextButton(
              onPressed: () {
                // FirebaseAuth.instance.signOut();
                Provider.of<ApplicationStateNotifier>(context, listen: false)
                    .signOut();
              },
              child: const Text('Log Out')),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser?.sendEmailVerification();
              },
              child: const Text('Send Email Verification')),
        ],
      ),
    );
  }
}
