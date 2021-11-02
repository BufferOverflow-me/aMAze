import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ReadExample extends StatefulWidget {
  const ReadExample({Key? key}) : super(key: key);

  @override
  State<ReadExample> createState() => _WriteExampleState();
}

class _WriteExampleState extends State<ReadExample> {
  final database = FirebaseDatabase.instance.reference();
  String displayText = 'Name';
  String imageUrl = 'https://picsum.photos/200';
  late StreamSubscription _streamSubscription;
  @override
  void initState() {
    super.initState();
    _activateListener();
  }

  _activateListener() {
    _streamSubscription = database
        .child(FirebaseAuth.instance.currentUser!.uid)
        .onValue
        .listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value);

      setState(() {
        displayText = data['Name'];
        imageUrl = data['PhotoUrl'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(displayText.toString()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
