# 02 — Product requirements (PRD)

**Status:** Draft v0.1 · Phase 1 (Product Discovery) · scope is the **MVP**, deliberately small.

## Overview

FitMind AI is a Flutter mobile app (iOS + Android) that generates and continuously adapts a
personal training program from the user's goal, equipment, and available time — re-planning each
session from recent performance and health-sensor data. The MVP proves one loop end-to-end:
**onboard → generate today's session → train with premium guidance → sync health → adapt
tomorrow.**

## Goals (MVP)

1. A first-time user reaches a **personalized first session in under 2 minutes**.
2. Each session is **generated for today's constraints** (time + equipment + recovery), not
   pulled from a fixed plan.
3. Health data (workouts, heart rate, sleep) **measurably changes** the next session.
4. The training screen feels **App-Store premium** — motion-led, haptic, calm.
5. Everything works **offline-first**; AI re-planning syncs when connectivity returns.

## Non-goals (MVP)

- Social feed, friends, challenges, leaderboards.
- Nutrition/meal planning (a later flagship concern, not this one).
- Wearable-specific apps (watchOS / Wear OS) — phone first.
- Human-coach marketplace, video calls.
- Competitive/sport-specific periodization (see persona non-target).

## Functional requirements

### FR-1 — Onboarding & goal capture
- Capture goal (strength · consistency · fat-loss · mobility), experience, equipment, typical
  available time, and injury flags — in ≤ 6 lightweight steps.
- Request Health permission with a clear value explanation; the app must work if declined.

### FR-2 — Adaptive session generation
- Generate **today's** session from: goal + equipment + time-available-today + recent
  performance + recovery signal (sleep / resting HR).
- Each session is **explainable**: the user can see *why* (e.g. "shorter today — poor sleep").
- Deterministic fallback plan when AI is unavailable (offline / error) — never a blank screen.

### FR-3 — Guided training session
- Step-by-step execution with **motion-led exercise guidance**, set/rep/rest timing, and
  **haptic** cues for transitions and rest end.
- Log actual performance (reps, weight, RPE, skipped/failed) with one-tap interactions.

### FR-4 — Health integration
- Read: workouts, heart rate, sleep, activity (HealthKit / Health Connect).
- Write: completed FitMind sessions back as workouts.
- All health access gated behind explicit consent; degrade gracefully if denied.

### FR-5 — Adaptation & progress
- After each session, update the user model; next session reflects it.
- A progress view showing trend and a plain-language explanation of the current progression.

## Non-functional requirements

- **Performance:** cold start < 2s; training screen a sustained **60 fps** (120 where
  supported); jank-free animations.
- **Offline-first:** full training works with no network; AI re-planning is the only
  network-dependent step and has a deterministic fallback.
- **Accessibility:** WCAG AA — full screen-reader labels, dynamic type, sufficient contrast,
  reduced-motion mode that swaps animation for static guidance.
- **Privacy:** health data stays on device by default; any cloud call is explicit, minimal, and
  documented. No selling data, ever.
- **Quality bar:** dark mode, skeleton loading, empty/error states, haptics, tablet layout.

## Success metrics

| Metric | Target (MVP) |
|---|---|
| Time to first personalized session | < 2 min |
| Sessions where health data changed the plan | measurable & shown to the user |
| Training-screen frame rate | 60 fps sustained |
| Day-2 return (would-train-again signal) | tracked from the first testers |

(Adoption targets follow the [validation discipline](../../../engineering-os/docs/05-demo/validation-board.md)
established on Engineering OS — evidence before features.)

## Key risks & open questions

- **AI quality & safety:** generated training must never recommend unsafe progression after a
  bad-recovery signal. → Guardrails + deterministic fallback are first-class, not afterthoughts.
- **Health-API divergence:** HealthKit vs Health Connect differ; the app needs one internal
  health model with two adapters (a port/adapter seam, like Engineering OS's providers).
- **On-device vs cloud AI:** latency, cost, and privacy trade-offs — to be settled in the
  architecture phase, behind a provider abstraction so it's swappable.
- **Scope discipline:** the temptation is social + nutrition. The MVP is the adaptive loop only.
