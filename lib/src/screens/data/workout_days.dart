import 'package:fitness_app/src/components/components.dart';
import 'package:fitness_app/src/components/my_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutDays extends StatefulWidget {
  const WorkoutDays({Key? key}) : super(key: key);

  @override
  State<WorkoutDays> createState() => _WorkoutDaysState();
}

class _WorkoutDaysState extends State<WorkoutDays> {
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  List<String> workOuts = [
    'Pull',
    'Push',
    'Upper Body',
    'Lower Body',
    'Chest',
    'Back',
    'Legs',
    'Shoulder',
    'Biceps',
    'Triceps',
    'Abs',
    'Cardio',
    'Rest'
  ];

  List<String> setWorkouts = [];

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: days.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => MyDropDownMenu(
                title: days[index],
                myDropdownItems: workOuts,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          // End section here
          Align(
            alignment: Alignment.center,
            child: StyledButton(
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  // Save info to firebase and into local storage
                  // Print out the workouts
                }),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
