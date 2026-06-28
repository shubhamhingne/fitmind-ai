# 04 — User stories

Stories for the MVP loop only, grouped by epic. Format: *As a … I want … so that …*, with
acceptance criteria that are testable. Priority: **P0** = MVP-critical, **P1** = MVP-desirable.

## Epic A — Onboarding & goal capture

- **US-A1 (P0)** — As a new user, I want to set my goal, equipment, and usual available time in
  a few quick steps, so that my very first session already fits me.
  - *Accept:* ≤ 6 steps; resumable; a personalized first session is produced at the end.
- **US-A2 (P0)** — As a privacy-conscious user, I want to understand why FitMind wants Health
  access before I grant it, so that I can decide with confidence.
  - *Accept:* value explained before the OS prompt; declining still yields a working app.
- **US-A3 (P1)** — As a returning user, I want to flag an injury or limitation, so that the plan
  avoids aggravating it.
  - *Accept:* flagged movement patterns are excluded/substituted in generation.

## Epic B — Adaptive session generation

- **US-B1 (P0)** — As Priya, I want today's session to match the time and equipment I actually
  have today, so that I don't have to adapt a plan myself.
  - *Accept:* changing today's available time/equipment changes the generated session.
- **US-B2 (P0)** — As any user, I want to see *why* today's session looks the way it does, so
  that I trust it.
  - *Accept:* each session shows a one-line rationale tied to a real input (time / recovery /
    progression).
- **US-B3 (P0)** — As an offline user, I want a sensible session even with no connectivity, so
  that the app never leaves me with a blank screen.
  - *Accept:* a deterministic fallback session is produced when AI is unavailable.
- **US-B4 (P0)** — As Rohan, I want the plan to ease off after poor sleep or elevated resting
  heart rate, so that I don't get hurt restarting.
  - *Accept:* a bad-recovery signal measurably reduces session intensity/volume vs baseline.

## Epic C — Guided training

- **US-C1 (P0)** — As a user mid-workout, I want clear motion guidance and timing for each
  exercise, so that I know exactly what to do without reading a wall of text.
  - *Accept:* each exercise has motion-led guidance + set/rep/rest timing; transitions are
    haptic-cued.
- **US-C2 (P0)** — As a user, I want to log what I actually did in one tap, so that tomorrow
  adapts to reality.
  - *Accept:* reps/weight/RPE and skip/fail captured with minimal friction; persists offline.
- **US-C3 (P1)** — As a reduced-motion user, I want static guidance instead of animation, so
  that the app respects my accessibility setting.
  - *Accept:* with reduce-motion on, animations are replaced by static, fully-labelled guidance.

## Epic D — Health integration

- **US-D1 (P0)** — As a user, I want my completed FitMind sessions to appear in Apple
  Health / Health Connect, so that my data lives in one place.
  - *Accept:* a finished session writes back as a workout (when consented).
- **US-D2 (P0)** — As a user, I want yesterday's strain and last night's sleep to influence
  today, so that the app actually uses my data.
  - *Accept:* recent workouts + sleep are read and demonstrably feed generation.

## Epic E — Adaptation & progress

- **US-E1 (P0)** — As Anika, I want the plan to progress from my real performance trend, so that
  I keep improving without doing the math.
  - *Accept:* sustained successful sessions increase load/volume; failed sessions hold/reduce it.
- **US-E2 (P1)** — As any user, I want a progress view with a plain-language explanation, so that
  I can see I'm moving and understand why today is harder than last week.
  - *Accept:* trend view + a sentence explaining the current progression.

## Traceability

Every story above traces to a PRD functional requirement and a persona need. When engineering
begins, each implementation PR will cite the story it satisfies — the same evidence-to-commit
discipline used on Engineering OS.
