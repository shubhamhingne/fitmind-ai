# 06 — Haptic language

Most apps vibrate randomly. FitMind has a **vocabulary**: a small, consistent set of patterns the
user learns without looking, so events are felt, not read. Eyes-up training depends on this.

## The vocabulary

| Event | Pattern | Flutter primitive | Why this feel |
|---|---|---|---|
| Button acknowledged | tiny tap | `selectionClick` | the lightest confirmation |
| Rep logged | tiny tick | `selectionClick` | additive, unobtrusive |
| Rest ending (3·2·1) | three light ticks | `lightImpact` ×3 | a countdown you feel |
| Rest finished | soft pulse | `lightImpact` (long) | "go" without a sound |
| **Set complete** | **sharp click** | `mediumImpact` | the punctuation of effort |
| Failed set logged | light warning | `lightImpact` (×2 soft) | acknowledged, never shaming |
| Workout complete | double pulse | `heavyImpact` ×2 | unmistakable closure |
| Personal best / streak | celebration burst | success notification + ember | the earned peak |

## Rules

1. **One event, one pattern — always.** Consistency is the entire point; never reuse a pattern for
   two meanings.
2. **Escalation maps to significance.** selection → light → medium → heavy → celebration tracks
   "how big a deal is this." The body learns the gradient.
3. **Ember pairs only with the celebration burst** (and the high-HR zone) — the haptic and the color
   mark the same earned moment.
4. **Haptics back every state change**, so the screen is usable with eyes closed mid-rep, and so
   reduced-motion users lose nothing (motion off → haptics remain).
5. **Respect the system setting.** If the user disables haptics, the visual/auditory channel must
   still carry every signal (no haptic-only state).

## Implementation

A single `Haptics` service centralizes the vocabulary (`Haptics.setComplete()`, `Haptics.restEnd()`,
…) so no widget calls `HapticFeedback` directly — the vocabulary stays consistent and is the one
place to tune patterns or add a platform channel for richer waveforms.
