# 02 — Product requirements (PRD)

**Status:** Draft v0.1 · Phase 1 (Product Discovery) · scope is the **MVP**, deliberately small.

## Overview

FitMind AI is a Flutter mobile app (iOS + Android). The MVP is **not a fitness app — it is the
single best daily-workout experience**, end to end:

```
Open → beautiful onboarding → "How much time today?" → 28 min → AI generates (with motion)
     → premium workout player → finish → celebration → AI summary → tomorrow adapts
```

Every screen must answer one question: **does this help someone complete today's workout?** If
not, it is post-MVP. No settings, no profile editing, no dashboards, no graphs, no analytics, no
social. One magical loop, executed at App-Store quality. If people love *that*, we build the rest.

## Goals (MVP) — delight-first

1. A first-timer reaches their **first session in under 2 minutes**, and it feels *made for them*.
2. The daily prompt — **"how much time today?"** — visibly shapes the session (28 min ≠ 45 min).
3. The **workout player is the centerpiece**: motion-led guidance, haptics, calm timing — the
   screen a user remembers.
4. Finishing a workout **feels like an achievement** (celebration + a short, warm AI summary).
5. **Tomorrow adapts** from what you did today — the user feels the app learning.

## Non-goals (MVP) — deferred until evidence, not abandoned

- Progress dashboards, charts, analytics, history views.
- Settings / profile editing screens.
- Social: feed, friends, challenges, leaderboards.
- Nutrition / meal planning.
- Wearable apps (watchOS / Wear OS) — phone first.
- Injury-management UI and equipment libraries beyond the onboarding minimum.
- **Deep** health analytics. (A *light* health touch stays — see FR-4.)

## Functional requirements (MVP loop)

### FR-1 — Onboarding that feels designed
- ≤ 4 delightful steps: goal, rough experience, equipment-on-hand. No long forms.
- Ends by generating the first session live (animated) — the first "wow," not a "you're all set."

### FR-2 — Daily time prompt + adaptive generation
- Each day opens with **"How much time do you have today?"** — the session is generated to fit it.
- Generated from: goal + equipment + time-today + what you did recently. **Explainable** in one
  line ("shorter and sharper today").
- **Deterministic fallback** when AI/offline — never a blank screen.

### FR-3 — The workout player (the centerpiece)
- Full-screen, motion-led guidance per exercise; set/rep/rest timing; **haptics** at set
  completion and rest-end; live countdown and progress ring.
- One-tap logging of what actually happened (done / harder / failed) — minimal friction.
- Reduced-motion mode swaps animation for static, fully-labelled guidance.

### FR-4 — Light health touch (skill on show, not a dashboard)
- **Write** completed FitMind sessions back to HealthKit / Health Connect (one-way, consented).
- **Optionally read** a recovery signal (sleep / resting HR) to nudge intensity — gated behind
  consent, fully functional if declined. No health charts in the MVP.

### FR-5 — Celebration + next-day adaptation
- A genuine completion moment (celebration animation + haptic) and a short, warm **AI summary**.
- The user model updates so **tomorrow's session reflects today** — felt, not graphed.

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
