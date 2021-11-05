import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class WriteExample extends StatefulWidget {
  const WriteExample({Key? key}) : super(key: key);

  @override
  State<WriteExample> createState() => _WriteExampleState();
}

class _WriteExampleState extends State<WriteExample> {
  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    final workout =
        database.child(FirebaseAuth.instance.currentUser!.uid.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    try {
                      workout.set({
                        'Name': FirebaseAuth.instance.currentUser!.displayName,
                        'Email': FirebaseAuth.instance.currentUser!.email,
                        'IsEmailVerified':
                            FirebaseAuth.instance.currentUser!.emailVerified,
                        'PhotoUrl': FirebaseAuth.instance.currentUser!.photoURL
                      });
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          content: const Text('User set'),
                          actions: [
                            TextButton(
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .hideCurrentMaterialBanner(),
                              child: const Text('Ok'),
                            )
                          ],
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      );
                    } catch (e) {
                      throw (e.toString());
                    }
                  },
                  child: const Text('Perform Set Operation')),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await workout
                          .child('Workouts')
                          .push()
                          .child('Cardio')
                          .set({
                        'Name': 'Cardio',
                        'Description': 'Cardio Workout',
                        'Duration': '30',
                        'Distance': '10',
                        'Calories': '200',
                        'Date': '2020-01-01'
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Set Workout'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                          backgroundColor: Theme.of(context).primaryColorLight,
                        ),
                      );
                    } catch (e) {
                      throw (e.toString());
                    }
                  },
                  child: const Text('Set Workout')),
            ],
          ),
        ),
      ),
    );
  }
}
