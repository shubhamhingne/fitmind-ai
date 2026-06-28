import 'package:flutter/material.dart';

import 'features/player/models.dart';
import 'features/player/workout_player_screen.dart';
import 'features/player/workout_session.dart';
import 'theme/fit_theme.dart';

void main() => runApp(const FitMindApp());

class FitMindApp extends StatelessWidget {
  const FitMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitMind AI',
      debugShowCheckedModeBanner: false,
      theme: FitTheme.dark(),
      // The signature screen runs standalone (sample plan) for profiling and the demo.
      home: WorkoutPlayerScreen(session: WorkoutSession(WorkoutPlan.sample())),
    );
  }
}
