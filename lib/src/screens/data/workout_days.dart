import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/components/view/common.dart';
import 'package:fitness_app/src/components/view/my_dropdown_menu.dart';
import 'package:fitness_app/src/services/provider/workout_day_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutDays extends StatefulWidget {
  const WorkoutDays({Key? key}) : super(key: key);

  @override
  State<WorkoutDays> createState() => _WorkoutDaysState();
}

class _WorkoutDaysState extends State<WorkoutDays> {
  final _workoutDaysKey = GlobalKey<FormState>();
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('workouts');

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WorkoutDayProvider>(context, listen: false);
    final workout =
        firestore.doc(FirebaseAuth.instance.currentUser!.uid.toString());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Workout Days',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(height: 16),

          // Drop downs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _workoutDaysKey,
              child: ListView.builder(
                itemCount: provider.days.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => MyDropDownMenu(
                  index: index,
                  title: index.toString() + '. ' + provider.days[index],
                  myDropdownItems: provider.workOuts,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          // End section here
          Align(
            alignment: Alignment.center,
            child: StyledButton(
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () async {
                  // Save info to firebase and into local storage
                  // Print out the workouts
                  // print(_workoutDaysKey.currentState);
                  _workoutDaysKey.currentState?.save();
                  try {
                    // print('Saving to firebase');
                    workout.update({
                      'workouts': provider.workoutDataArray,
                    });
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                }),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}


// TODO: Remove this section later, if not used!