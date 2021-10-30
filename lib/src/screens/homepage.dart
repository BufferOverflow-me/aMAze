import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/screens/auth/auth_page.dart';
import 'package:fitness_app/src/services/flutterfire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text(FirebaseAuth.instance.currentUser.toString()),
          TextButton(
              onPressed: () {
                context.read<FlutterFire>().signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AuthPage()));
              },
              child: const Text('Logout'))
        ],
      ),
    ));
  }
}
