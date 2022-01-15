import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/components/view/common.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({
    Key? key,
    this.id = 'workout',
  }) : super(key: key);
  static const routeName = '/workout';
  final String id;

  @override
  Widget build(BuildContext context) {
    CollectionReference workouts =
        FirebaseFirestore.instance.collection('workouts');
    return Scaffold(
        body: FutureBuilder<QuerySnapshot>(
      future: workouts.doc(id).collection('workout').get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (snapshot.hasData) {
          var doc = snapshot.data!;
          List<Widget> list = [];
          for (var i = 0; i < doc.docs.length; i++) {
            list.add(
              ListTile(
                title: Text(doc.docs[i]['name']),
              ),
            );
          }
          return Stack(
            children: [
              ListView(
                children: list,
              ),
              // Start button here!
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: StyledButton(
                      child: Text(
                        'START TRAINING',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onPressed: () {}),
                ),
              )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
