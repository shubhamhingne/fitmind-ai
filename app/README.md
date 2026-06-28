# FitMind AI — app

The Flutter app. The build starts with the **signature screen** (the Workout Player) so the hardest
problems — custom rendering, shared-element transitions, gesture, performance — are solved first and
become the quality bar every other screen must meet.

> **Status:** the player's *architecture* is authored against the
> [spec](../docs/03-design-system/05-workout-player.md) — a custom-painted ring, a state-driven
> `WorkoutSession`, and a centralized `Haptics` service. It was written without a Flutter SDK in the
> authoring environment, so **it has not been compiled or profiled here.** Compile, run, and
> profile-to-60fps on-device. `TODO(build)` markers flag what comes next (rest countdown, the
> full completion animation, Rive guidance, the gyroscope detail).

## Run

```bash
cd app
flutter create .         # generate android/ ios/ platform folders for this package
flutter pub get
flutter run              # device or simulator
flutter run --profile    # then profile the Workout Player FIRST — target 60fps (120 where supported)
```

## What's here

```
lib/
  main.dart                         # runs the player standalone (sample plan)
  theme/fit_theme.dart              # design tokens (color · durations)
  core/haptics.dart                 # the haptic vocabulary, one service
  features/player/
    models.dart                     # Exercise · WorkoutPlan (+ sample)
    workout_session.dart            # state machine — single source of truth
    ring_painter.dart               # the 60fps CustomPainter ring
    workout_player_screen.dart      # state-driven WORK / REST / PAUSE / COMPLETE
```

## Skills this screen is meant to demonstrate

A 60fps custom-rendered ring (`CustomPainter` + `RepaintBoundary`) · clean animation ownership (no
scattered controllers) · **state-driven** UI (a `ChangeNotifier` state machine, not widget logic) ·
a centralized haptics service · accessibility and reduced-motion designed in · ready seams for Rive
guidance, gyroscope life, and voice intents.
