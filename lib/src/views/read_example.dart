import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReadExample extends StatefulWidget {
  const ReadExample({Key? key}) : super(key: key);

  @override
  State<ReadExample> createState() => _WriteExampleState();
}

class _WriteExampleState extends State<ReadExample> {
  final database = FirebaseDatabase.instance.reference();
  String displayText = 'Name';
  String imageUrl = 'https://picsum.photos/200';
  // late StreamSubscription _streamSubscription;
  @override
  void initState() {
    super.initState();
    // _activateListener();
    _performSingleFetch();
  }

  void _performSingleFetch() {
    database
        .child(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      final data = Map<String, dynamic>.from(snapshot.value);
      setState(() {
        displayText = data['Name'] as String;
        imageUrl = data['PhotoUrl'] as String;
      });
    });
  }

  // _activateListener() {
  //   _streamSubscription = database
  //       .child(FirebaseAuth.instance.currentUser!.uid)
  //       .onValue
  //       .listen((event) {
  //     final data = Map<String, dynamic>.from(event.snapshot.value);

  //     setState(() {
  //       displayText = data['Name'];
  //       imageUrl = data['PhotoUrl'];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Example'),
      ),
      // body: StreamBuilder(
      //   stream: database
      //       .child(FirebaseAuth.instance.currentUser!.uid)
      //       .child('Workouts')
      //       .orderByKey()
      //       .onValue,
      //   builder: (_, snapshot) {
      //     final tileList = <ListTile>[];
      //     if (snapshot.hasData) {
      //       final myWorkouts = Map<String, dynamic>.from(
      //           (snapshot.data! as Event).snapshot.value);
      //       myWorkouts.forEach((key, value) {
      //         final nextWorkout = Map<String, dynamic>.from(value)['Cardio'];
      //         final workoutTile = ListTile(
      //           leading: const FaIcon(FontAwesomeIcons.dumbbell),
      //           title: Text(nextWorkout['Name']),
      //           subtitle: Text(nextWorkout['Description']),
      //         );
      //         tileList.add(workoutTile);
      //       });
      //       return ListView.builder(
      //         itemCount: tileList.length,
      //         itemBuilder: (_, i) {
      //           return tileList[i];
      //         },
      //       );
      //     }
      //     return const Center(child: CircularProgressIndicator());
      //   },
      // ),
      body: FirebaseAnimatedList(
        query: database
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child('Workouts'),
        itemBuilder: (context, snapshot, animation, index) {
          final myWorkout = Map<String, dynamic>.from(snapshot.value);
          final nextWorkout = Map<String, dynamic>.from(myWorkout)['Cardio'];
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                  parent: animation,
                  curve: Curves.bounceOut,
                  reverseCurve: Curves.bounceIn),
            ),
            child: ListTile(
              leading: const FaIcon(FontAwesomeIcons.weight),
              title: Text(nextWorkout['Name']),
              subtitle: Text(nextWorkout['Description']),
            ),
            // child: Text(myWorkout.toString()),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // _streamSubscription.cancel();
    super.dispose();
  }
}
