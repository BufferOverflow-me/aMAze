import 'package:flutter/cupertino.dart';

class WorkoutDayProvider extends ChangeNotifier {
  List<String> _workoutDataArray = [
    'Rest',
    'Rest',
    'Rest',
    'Rest',
    'Rest',
    'Rest',
    'Rest',
  ];
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
    'Rest',
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
  ];

  List<String> get workoutDataArray {
    return _workoutDataArray;
  }

  void workoutDataArraySetter(int index, String value) {
    _workoutDataArray[index] = value;
    notifyListeners();
  }
}
