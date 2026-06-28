/// Plain models for the player. The real plan comes from the adaptive engine (build phase);
/// [WorkoutPlan.sample] lets the signature screen run standalone for profiling and the demo.
class Exercise {
  final String name;
  final int sets;
  final int reps;
  final double? weightKg;
  final int restSeconds;

  const Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    this.weightKg,
    this.restSeconds = 45,
  });
}

class WorkoutPlan {
  final String title;
  final List<Exercise> exercises;

  const WorkoutPlan({required this.title, required this.exercises});

  int get totalSets => exercises.fold(0, (sum, e) => sum + e.sets);

  static WorkoutPlan sample() => const WorkoutPlan(
        title: '22-minute session',
        exercises: [
          Exercise(name: 'Push-ups', sets: 4, reps: 12, restSeconds: 45),
          Exercise(name: 'Goblet Squat', sets: 4, reps: 12, weightKg: 20, restSeconds: 60),
          Exercise(name: 'Plank', sets: 3, reps: 1, restSeconds: 40),
        ],
      );
}
