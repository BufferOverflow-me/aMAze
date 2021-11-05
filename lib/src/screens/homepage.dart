import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: Text("HomePage")),
        TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("Log Out"))
      ],
    );
  }
}
