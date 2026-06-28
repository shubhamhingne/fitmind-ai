# 05 — The Workout Player

**The signature screen.** If this is exceptional, average settings are forgiven; if this is average,
nothing saves the app. It gets **40–50% of the design budget** and carries
[Moments 2 and 3](04-signature-moments.md). Designed *for sweat* — usable at a heart rate of 150,
one-handed, eyes-up.

*Inspiration:* Nike Training Club (full-bleed motion coaching) · Apple Fitness (rings, glanceable
metrics) · Whoop (premium dark, effort color). We take patterns, not pixels.

## Two states that matter: WORK and REST

### WORK — doing the set

```
┌──────────────────────────────┐
│  ◖ 2/4 sets        ⏸  ✕      │   top: tiny progress + pause/quit (out of the way)
│                              │
│      [ motion guidance ]      │   exercise animation (Rive/Lottie/video) — the focus
│        Goblet Squat           │   display: exercise name
│                              │
│         ⟳  12 reps            │   the number, huge, tabular (display-hero)
│         @ 20 kg               │   label: load
│                              │
│   ░░░░░░░░░░░  ring grows     │   progress ring sweeps calm→AI (not ember yet)
│                              │
├──────────────────────────────┤
│        ✓  Done set            │   thumb-zone primary — one giant target
│     Harder · Failed (small)   │   secondary log options, smaller
└──────────────────────────────┘
```

### REST — recovering between sets

```
┌──────────────────────────────┐
│  ◖ 2/4 sets               ✕  │
│                              │
│           0:42                │   rest countdown, display-hero, *breathing*
│        breathe               │   the ring contracts/expands slowly (calm)
│                              │
│     Next: Goblet Squat        │   what's coming — read in a glance
│         set 3 · 12 @ 22.5     │   note the +load (progression, explained on tap)
│                              │
├──────────────────────────────┤
│        Skip rest  →           │   thumb-zone; auto-advances at 0:00 with a tick haptic
│        +20s                   │   forgiving, one tap
└──────────────────────────────┘
```

## Anatomy

- **Exercise guidance (the focus):** looped motion that *teaches the movement* — not a static
  image. Reduced-motion → a clean static diagram with the same labels.
- **The number:** reps or countdown in `display-hero`, tabular — never jitters, readable at a glance.
- **Progress ring:** one continuous sweep across the whole session; gradient `calm → AI` during
  work, **ember only as a set closes**. The ring is the spatial sense of "how much is left."
- **Primary action:** a single oversized thumb-zone target (*Done set* / *Skip rest*). Secondary
  logs (*Harder*, *Failed*) are present but visually quiet.

## Motion (No Static Screen, here above all)

| Element | Motion | Token |
|---|---|---|
| Ring (work) | grows continuously toward set completion | `ease-standard` |
| Ring (rest) | slow breathe in/out (≈4s cycle) | custom |
| Rep number | spring tick on each logged rep | `ease-spring` |
| Set complete | ring snaps full → **ember flash** → collapses to rest | `dur-base` + haptic |
| Exercise change | current card slides out, next rises | `dur-slow` |
| Enter player | shared-element expand (Moment 2) | `dur-slow` |
| Last set done | hands off to celebration (Moment 3) | `dur-celebrate` |

## Haptics

| Event | Pattern |
|---|---|
| Set complete | medium impact + ember flash |
| Rest 3-2-1 | light ticks |
| Rest ends / auto-advance | double tick |
| New PR / streak | success notification |
| Failed set logged | light warning (no shame) |

## Logging — one tap, no friction

- **Done set** (primary) advances and starts rest.
- **Harder** / **Failed** are one-tap and feed adaptation (tomorrow eases or holds). Neutral,
  non-judgmental copy — *Failed* is data, not blame.
- **Undo window:** a 4s subtle bar after auto-advance to correct a mistap (sweat-proofing).

## States (designed, not default)

- **Paused:** dims, large Resume; timers hold; nothing lost.
- **Last set:** the *Done* transitions directly into the celebration — no "Workout Complete" dialog.
- **Reduced-motion:** static guidance + cross-fades; ring updates without sweep; haptics still fire.
- **Offline / AI-less:** the deterministic session runs identically; a quiet badge, no degraded feel.
- **Interrupted (call/lock):** resumes exactly where it left off.

## Design-for-sweat checklist (the gate for this screen)

- [ ] Primary action reachable one-handed, ≥ 64pt, in the thumb band.
- [ ] The number is legible at arm's length, glanceable in < 1s.
- [ ] No paragraph of text anywhere in WORK or REST.
- [ ] Every state change has a haptic (eyes can be closed mid-rep).
- [ ] Contrast passes WCAG AA on the dark canvas at a glance.
- [ ] Voice-guidance-ready: each step has a spoken-label string (future TTS hook).

## Accessibility

Full screen-reader labels for exercise, set/rep, countdown, and actions; dynamic type without
breaking the hero numerals; reduced-motion honored; targets ≥ 48pt; no color-only state (haptic +
shape back every signal).

## Build notes (Flutter)

- Ring: `CustomPainter` driven by an `AnimationController` (sweep + breathe); no heavy widget.
- Guidance: Rive (preferred — small, crisp, interactive) or Lottie; static SVG/Image fallback for
  reduced-motion.
- Motion: `flutter_animate` / implicit animations; shared-element via `Hero` for Moment 2.
- Haptics: `HapticFeedback` + platform channel for richer patterns where available.
- Keep the WORK frame at a sustained **60fps** (120 where supported) — the ring and number must
  never drop frames; profile this screen first.

## Definition of done

A reviewer watching a 20-second clip of this screen should think *"I want to build apps like this."*
If they don't, it isn't done.
