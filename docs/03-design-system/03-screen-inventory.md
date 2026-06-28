# 03 — Screen inventory (MVP)

The complete screen list for the delight-first loop — nothing more. Each screen names its
inspiration (understand, don't copy) and its **one required "wow" moment**. A screen without a
wow moment is incomplete (the *No Generic Screen* rule).

> Inspiration set: **Apple Fitness** (calm data, rings), **Nike Training Club** (bold, motion-led
> coaching), **Whoop** (recovery-aware, premium dark), **Gentler Streak / Oura** (warmth, kindness),
> **Linear** (restraint, hierarchy). We take patterns, not pixels.

## The loop

```
1 Onboard → 2 Today (time prompt) → 3 Session preview → 4 Workout player → 5 Celebration → (back to 2)
```

## Design order (not parallel)

Designed in order of leverage, so the surrounding screens inherit the player's language:

1. ⭐ **[Workout player](05-workout-player.md)** — the signature screen (40–50% of effort) ← *spec'd*
2. Today (the entry point)
3. Session preview
4. Celebration
5. Onboarding

The memorable [signature moments](04-signature-moments.md) are designed first; screens serve them.

## 1 · Onboarding — "made for me in 60 seconds"

- **Purpose:** goal · rough experience · equipment, in ≤ 4 steps. No long forms.
- **Inspiration:** Nike Training Club (warm, confident coaching tone) · Linear (one decision per
  screen, generous hierarchy).
- **Wow moment:** the final step **generates the first session live** — an animated build ("reading
  your goal… choosing your moves…"), not a static "You're all set." The first proof the app adapts.
- **States:** each step resumable; AI-unavailable → deterministic starter session, still animated.

## 2 · Today — the daily question

- **Purpose:** the home. One question: **"How much time do you have today?"** A few tappable
  options (15 / 28 / 45 min) + a dial for anything else.
- **Inspiration:** Apple Fitness (calm, single focus) · Whoop (today-first, no clutter).
- **Wow moment:** as the user changes the time, a **live session preview morphs** — block count and
  intensity re-shape with a spring, so they *see* the adaptation before committing.
- **States:** returning user greeted by name + a one-line, recovery-aware nudge; first session of
  the day vs already-trained-today differ.

## 3 · Session preview — "here's today, and why"

- **Purpose:** the generated session at a glance + the **one-line rationale** ("shorter and sharper
  — you trained hard yesterday"). Single primary action: **Start**.
- **Inspiration:** Nike (clear session cards) · Linear (quiet hierarchy, no noise).
- **Wow moment:** the rationale **types in** as if the coach is explaining, and the block cards
  stagger-in; tapping a block flips it for detail. Trust through transparency.
- **States:** offline badge if fallback was used; long sessions scroll without losing Start.

## 4 · Workout player — the centerpiece (most design budget)

- **Purpose:** execute one exercise at a time, hands-free-friendly: motion guidance, set/rep/rest,
  logging.
- **Inspiration:** Nike Training Club (full-bleed motion coaching) · Apple Fitness (rings, glanceable
  metrics) · Whoop (premium dark, effort color).
- **Wow moment(s):** **motion-led exercise guidance** (Rive/Lottie or video), a **progress ring**
  sweeping the calm→AI→ember gradient, a **rest countdown** that breathes, and a **set-complete
  haptic + ember flash**. The screen the user remembers.
- **States:** reduced-motion → static labelled guidance; pause/resume; one-tap *done / harder /
  failed*; auto-advance with an undo window.

## 5 · Celebration + summary — the earned moment

- **Purpose:** reward completion and close the loop with a short, warm **AI summary** + "tomorrow
  adapts."
- **Inspiration:** Gentler Streak (kind, human reward) · Apple Fitness (ring-close moment).
- **Wow moment:** an **earned celebration** (ember burst + success haptic, proportional to effort —
  never confetti for nothing), then an AI summary that names something specific ("first time you
  finished all 4 sets of these").
- **States:** partial completion is still honored warmly; writes the session to Health (if consented).

## Supporting (designed, not default)

- **Health priming:** a single, honest screen explaining *why* before the OS prompt — value first,
  fully functional if declined. (Inspiration: Oura's consent clarity.)
- **Skeletons:** every load matches the content it replaces (Today preview, player) — no bare spinner.
- **Offline / error:** a calm, recoverable state with a clear action and the deterministic session
  ready underneath.

## Not in the MVP (so it stays focused)

Dashboards · charts · history · settings/profile · social · nutrition · equipment library · injury
UI. Each returns only when the [validation board](../../../engineering-os/docs/05-demo/validation-board.md)
shows users ask for it.
