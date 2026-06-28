import 'package:flutter/foundation.dart';

import 'models.dart';

/// The phases the player moves through. The UI is a pure function of this — state-driven, not
/// widget-driven. (docs/03-design-system/05-workout-player.md, Deliverable 6.)
enum SessionPhase { entering, work, rest, paused, completed }

/// Single source of truth for a workout. A small state machine; transitions are explicit and the
/// only way state changes. A real app would back this with Riverpod/Bloc; [ChangeNotifier] keeps
/// the benchmark dependency-free and equally state-driven.
class WorkoutSession extends ChangeNotifier {
  WorkoutSession(this.plan);

  final WorkoutPlan plan;

  SessionPhase phase = SessionPhase.entering;
  SessionPhase _resumePhase = SessionPhase.work;
  int exerciseIndex = 0;
  int setNumber = 1; // 1-based within the current exercise
  int completedSets = 0;

  Exercise get current => plan.exercises[exerciseIndex];

  /// What's coming next — same exercise's next set, or the next exercise's first set, or null.
  Exercise? get upNext {
    if (setNumber < current.sets) return current;
    final nextIndex = exerciseIndex + 1;
    return nextIndex < plan.exercises.length ? plan.exercises[nextIndex] : null;
  }

  double get progress => plan.totalSets == 0 ? 0 : completedSets / plan.totalSets;

  bool get isLastSet =>
      exerciseIndex == plan.exercises.length - 1 && setNumber == current.sets;

  void begin() {
    if (phase == SessionPhase.entering) {
      phase = SessionPhase.work;
      notifyListeners();
    }
  }

  /// Log the current set as done. Last set → completed; otherwise → rest.
  void completeSet() {
    completedSets += 1;
    phase = isLastSet ? SessionPhase.completed : SessionPhase.rest;
    notifyListeners();
  }

  /// Leave rest and start the next set (advancing exercise when the current one is done).
  void advanceFromRest() {
    if (setNumber < current.sets) {
      setNumber += 1;
    } else {
      exerciseIndex += 1;
      setNumber = 1;
    }
    phase = SessionPhase.work;
    notifyListeners();
  }

  // Interruption is real life — pause/resume restores exactly where the user was.
  void pause() {
    if (phase != SessionPhase.paused) {
      _resumePhase = phase;
      phase = SessionPhase.paused;
      notifyListeners();
    }
  }

  void resume() {
    if (phase == SessionPhase.paused) {
      phase = _resumePhase;
      notifyListeners();
    }
  }
}
