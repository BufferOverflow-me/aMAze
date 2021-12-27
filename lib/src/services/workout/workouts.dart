/// App will ask the user to set his week days with workout
enum WorkoutDays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

/// This data will be fetched from the server
/// and will be used to populate the workout
/// list.
enum WorkoutTarget {
  upperBody,
  lowerBody,
  fullBody,
  push,
  pull,
  legs,
  abs,
}

/// A workout that can be performed by a user.
/// Beginner level will have 3 sets and 12 reps with a rest time of 1 minutes.
/// Intermediate level will have 4 sets and 10 reps with a rest time of 3 minute.
/// Advanced level will have 5 sets and 8 reps with a rest time of 5 minutes.
enum Level {
  beginner,
  intermediate,
  advanced,
}

// TODO: To be included in the future
enum WorkoutType {
  compound,
  isolation,
  strength,
}

enum CompoundExerciseType {
  barbell,
  dumbbell,
  machine,
}

enum IsolationExerciseType {
  dumbbell,
  machine,
}

enum StrengthExerciseType {
  barbell,
  dumbbell,
  machine,
}
