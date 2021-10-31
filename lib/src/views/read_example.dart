import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ReadExample extends StatefulWidget {
  const ReadExample({Key? key}) : super(key: key);

  @override
  State<ReadExample> createState() => _WriteExampleState();
}

class _WriteExampleState extends State<ReadExample> {
  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    final workout = database.child('Workout');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Example'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: workout.get(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return const Text('s');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )),
      ),
    );
  }
}
