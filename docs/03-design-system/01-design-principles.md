# 01 — Design principles

FitMind's job in the portfolio is to prove **craftsmanship** (Engineering OS proved architecture).
The design system is mobile-first, iOS + Android from day one, and held to the
[UI/UX Pro Max standard](../../../engineering-os/docs/03-design-system/17-ui-ux-pro-max.md).

## The quality gate

> For every screen, ask: **"Would this look out of place next to Apple Fitness, Nike Training
> Club, or Whoop?"** If yes — redesign it. Functional is the floor; *App-Store premium* is the bar.

## The two standing rules

1. **No Generic Screen.** Every screen has a deliberate hierarchy and at least one **"wow" moment**
   — a small, *functional* interaction the user remembers (a personalized AI greeting, an animated
   generation, a satisfying set-complete haptic, a smooth progress ring, an earned celebration). A
   plain list, a naked form, or a bare spinner is *incomplete*, the same way an untested feature is.
2. **Does this help complete today's workout?** If a screen, control, or setting doesn't, it's
   post-MVP. The MVP is one magical loop, not a feature surface.

## Principles

1. **The workout player is the product.** Everything else exists to get the user into it and
   reward them out of it. It gets the most design budget.
2. **Motion is meaning, not decoration.** Animation teaches the movement, marks transitions,
   confirms completion. Motion that conveys nothing is removed. (This is FitMind's signature skill.)
3. **Calm, then energy.** The resting UI is dark, quiet, premium; energy appears at the moments
   that earn it — effort, streaks, celebration. One warm accent against cool calm.
4. **One-handed, in-motion, sweaty.** Targets are large, primary actions sit in the thumb zone,
   states are glanceable. The user is mid-workout, not at a desk.
5. **Offline and instant.** No spinner where a skeleton will do; the daily session works with no
   network. Latency is hidden behind motion that has a purpose.
6. **Accessible by construction.** WCAG AA, full screen-reader labels, dynamic type, and a genuine
   **reduced-motion** mode that swaps animation for static guidance — never a bolt-on pass.
7. **Honest numbers.** Timers, reps, and progress are precise and legible (tabular figures); we
   never fake data or celebrate nothing.

## States are first-class

Empty, loading, and error states are designed features, not defaults — a designed first-run, a
skeleton that matches the content, a recoverable error with a clear next step. (Detailed in the
states doc when we reach it.)

## Platform stance

- **Flutter, one codebase, two native feels.** Respect platform conventions where they matter
  (navigation gestures, haptics, share sheets, system fonts fallback) while keeping one design
  language. Material 3 and Cupertino are *substrates*, not the look — the look is FitMind's.
- **Premium animation** via purposeful Flutter motion (implicit/explicit animations, custom
  painters, and Rive/Lottie for exercise guidance where richer motion earns its weight).
