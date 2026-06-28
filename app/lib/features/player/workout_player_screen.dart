import 'package:flutter/material.dart';

import '../../core/haptics.dart';
import '../../theme/fit_theme.dart';
import 'ring_painter.dart';
import 'workout_session.dart';

/// The signature screen. The UI is a pure function of [WorkoutSession.phase]; animation controllers
/// are owned here (not scattered). Authored against the spec
/// (docs/03-design-system/05-workout-player.md); compile/profile/record on-device.
class WorkoutPlayerScreen extends StatefulWidget {
  const WorkoutPlayerScreen({super.key, required this.session});

  final WorkoutSession session;

  @override
  State<WorkoutPlayerScreen> createState() => _WorkoutPlayerScreenState();
}

class _WorkoutPlayerScreenState extends State<WorkoutPlayerScreen>
    with TickerProviderStateMixin {
  static const _haptics = Haptics();

  late final AnimationController _breathe; // rest ring inhale/exhale (~4s)
  late final AnimationController _flash; // earned ember on set complete

  WorkoutSession get s => widget.session;

  @override
  void initState() {
    super.initState();
    _breathe = AnimationController(vsync: this, duration: const Duration(seconds: 4))
      ..repeat(reverse: true);
    _flash = AnimationController(vsync: this, duration: FitDurations.base);
    s.addListener(_onChange);
    // Moment 2: after the shared-element settle, begin the first set.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future<void>.delayed(FitDurations.slow, () {
        if (mounted) s.begin();
      });
    });
  }

  void _onChange() {
    if (s.phase == SessionPhase.completed) _haptics.workoutComplete();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    s.removeListener(_onChange);
    _breathe.dispose();
    _flash.dispose();
    super.dispose();
  }

  void _done() {
    _haptics.setComplete();
    _flash.forward(from: 0).whenComplete(() => _flash.reverse());
    s.completeSet();
  }

  double get _glow {
    if (s.phase == SessionPhase.rest) return _breathe.value;
    return s.isLastSet ? 0.6 : 0.15; // Phase 4: anticipation glow on the last set
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitColors.bg,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: RepaintBoundary(
                child: AnimatedBuilder(
                  animation: Listenable.merge([_breathe, _flash]),
                  builder: (_, __) => CustomPaint(
                    painter: RingPainter(
                      progress: s.progress,
                      glow: _glow,
                      emberFlash: _flash.value,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(child: _content()),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    switch (s.phase) {
      case SessionPhase.rest:
        return _RestView(
          session: s,
          onSkip: () {
            _haptics.restFinished();
            s.advanceFromRest();
          },
        );
      case SessionPhase.completed:
        return const _CompleteView();
      case SessionPhase.paused:
        return _PausedView(onResume: s.resume);
      case SessionPhase.entering:
      case SessionPhase.work:
        return _WorkView(
          session: s,
          entering: s.phase == SessionPhase.entering,
          onDone: _done,
          onPause: s.pause,
        );
    }
  }
}

/// WORK — remove 40%: the movement, one number, one giant DONE.
class _WorkView extends StatelessWidget {
  const _WorkView({
    required this.session,
    required this.entering,
    required this.onDone,
    required this.onPause,
  });

  final WorkoutSession session;
  final bool entering;
  final VoidCallback onDone;
  final VoidCallback onPause;

  @override
  Widget build(BuildContext context) {
    final e = session.current;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text('${session.setNumber}/${e.sets}',
                  style: const TextStyle(
                      color: FitColors.textMuted, fontSize: 16, fontWeight: FontWeight.w600)),
              const Spacer(),
              IconButton(
                onPressed: onPause,
                icon: const Icon(Icons.pause, color: FitColors.textMuted),
              ),
            ],
          ),
          const Spacer(),
          // TODO(build): replace with Rive motion guidance (static fallback for reduced-motion).
          Text(
            e.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: FitColors.text, fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.5),
          ),
          const SizedBox(height: 8),
          // Celebrity number. TODO(build): tabular figures via the chosen display font.
          Text(
            '${e.reps}',
            style: const TextStyle(
                color: FitColors.text, fontSize: 96, fontWeight: FontWeight.w800, height: 1),
          ),
          const Text('reps', style: TextStyle(color: FitColors.textMuted, fontSize: 16)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: entering ? null : onDone, // disabled during the entrance settle
              style: FilledButton.styleFrom(
                backgroundColor: FitColors.primary,
                minimumSize: const Size.fromHeight(64),
                shape: const StadiumBorder(),
              ),
              child: const Text('DONE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 1)),
            ),
          ),
        ],
      ),
    );
  }
}

/// REST — calm; one number, what's next, one forgiving action.
/// TODO(build): drive a real countdown (Ticker) that breathes the ring and auto-advances at 0.
class _RestView extends StatelessWidget {
  const _RestView({required this.session, required this.onSkip});

  final WorkoutSession session;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final next = session.upNext;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Spacer(),
          const Text('rest', style: TextStyle(color: FitColors.textMuted, fontSize: 16)),
          if (next != null) ...[
            const SizedBox(height: 24),
            Text('Next · ${next.name}',
                style: const TextStyle(
                    color: FitColors.text, fontSize: 22, fontWeight: FontWeight.w600)),
          ],
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onSkip,
              style: FilledButton.styleFrom(
                backgroundColor: FitColors.surfaceRaised,
                minimumSize: const Size.fromHeight(64),
                shape: const StadiumBorder(),
              ),
              child: const Text('Skip rest  →',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

/// COMPLETE — own the screen. TODO(build): the ring expands to fill the screen, confetti *inside*
/// it, then collapses to reveal this copy (docs/03-design-system/07-emotional-design.md).
class _CompleteView extends StatelessWidget {
  const _CompleteView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          'You trained.\nEven on a busy day.\nThat’s how progress happens.',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: FitColors.text, fontSize: 26, height: 1.4, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _PausedView extends StatelessWidget {
  const _PausedView({required this.onResume});

  final VoidCallback onResume;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitColors.bg.withValues(alpha: 0.7),
      alignment: Alignment.center,
      child: FilledButton(
        onPressed: onResume,
        style: FilledButton.styleFrom(
          backgroundColor: FitColors.primary,
          minimumSize: const Size(200, 64),
          shape: const StadiumBorder(),
        ),
        // Interruption: resume exactly where they were.
        child: const Text('Resume', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
