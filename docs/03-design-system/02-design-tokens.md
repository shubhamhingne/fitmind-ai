# 02 — Design tokens

The atomic visual language. Rooted in the personal-brand canon (dark base, blue→cyan, AI-forward)
and extended with **one warm energy accent** for effort and celebration — calm cool at rest, warmth
where it's earned. Tokens are the contract; screens compose from them, never ad-hoc values.

## Color

Dark-first (the app lives in a gym, often at night). The cool system carries calm, structure, and
AI; the single warm **ember** carries effort, streaks, and celebration — used sparingly.

| Token | Hex | Role |
|---|---|---|
| `bg` | `#0A0E14` | App background (deep ink, warmer than slate) |
| `surface` | `#141A23` | Cards, sheets, the player chrome |
| `surface-raised` | `#1C2430` | Elevated panels, modals |
| `border` | `#26303C` | Hairlines, dividers |
| `text` | `#FFFFFF` | Headlines, hero numerals |
| `text-body` | `#D8E0EA` | Body |
| `text-muted` | `#8A97A6` | Meta, captions |
| `primary` | `#2563EB` | Primary actions, links (brand blue) |
| `secondary` | `#38BDF8` | Emphasis, highlights |
| `ai` | `#06B6D4` | AI moments — generation, summary, focus rings |
| `ember` | `#FF6A3D` | **Energy** — effort, streaks, celebration (sparingly) |
| `ember-soft` | `#FFB089` | Warm gradient stop / glow |
| `success` | `#22C55E` | Set complete / status only |
| `warning` | `#F59E0B` | Status only |
| `danger` | `#EF4444` | Failure / destructive only |
| `ring-grad` | `#2563EB → #06B6D4 → #FF6A3D` | Progress ring sweep (calm → AI → effort) |

> **Ember is earned, never idle.** It is a *reward* color, not a brand color. The psychology:
> blue = trust, cyan = intelligence, **ember = effort / achievement** — so it must only appear at
> moments the user earned.
>
> - **Never** for: navigation, buttons, cards, backgrounds, body text, icons-at-rest.
> - **Only** for: set completion, heart-rate high zone, intensity/effort, calories, streaks,
>   achievement badges, celebration/particles. The structure stays cool; warmth marks the win.
>
> **One element, one job:** cool blues carry structure/AI/calm; never two accents competing in one
> view. Restraint is what makes the ember moments feel special.

## Typography

Two families. A tight, confident **display** for hero numerals (the time prompt, rest countdown,
set counts) and a clean humanist **body**. Both need excellent **tabular figures** — numbers are
everywhere and must never jitter.

| Token | Spec | Use |
|---|---|---|
| `display-hero` | 64 / 700 / -2% tracking, tabular | The "28 min", rest countdown |
| `display` | 34 / 700 / -1% | Screen titles, exercise name |
| `title` | 22 / 600 | Section headers, card titles |
| `body` | 16 / 400 / 1.5 line | Instructions, copy |
| `label` | 13 / 600 / +2% / uppercase | Set·rep·rest labels, chips |
| `mono-num` | tabular variant | Timers, counters |

Candidate fonts (Flutter `google_fonts`, swappable): display **Sora** or **Space Grotesk**; body
**Inter** (tabular figures). Final pairing chosen in the hi-fi pass; must align with the brand book.

## Spacing & layout

4-pt base scale: `2 · 4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 56 · 72`. Screen gutter `20`. Thumb-zone
band reserved for the primary action (bottom ~96 pt). Touch target minimum **48×48**.

## Radius & elevation

- Radius: `sm 10 · md 16 · lg 24 · pill 999`. Cards `md`; sheets/player `lg`; chips `pill`.
- Elevation is **light, not shadow-heavy** — surfaces separated by tone (`bg`→`surface`→
  `surface-raised`) and a subtle 1px `border`, plus soft ambient shadow only on floating actions.

## Motion (FitMind's signature)

Durations and curves are tokens so motion is consistent and *meaningful*.

| Token | Value | Use |
|---|---|---|
| `dur-fast` | 120 ms | State toggles, taps |
| `dur-base` | 240 ms | Transitions, card moves |
| `dur-slow` | 420 ms | Screen/player transitions |
| `dur-celebrate` | 900 ms | Completion celebration |
| `ease-standard` | `cubic(0.2, 0, 0, 1)` | Most motion |
| `ease-spring` | spring (damping ~0.8) | Rings, counters, playful affordances |
| `ease-decel` | `cubic(0, 0, 0, 1)` | Entrances |

Rules: motion always communicates a state change; **reduced-motion** replaces transforms with
cross-fades and disables celebratory motion (haptic + static badge instead).

## Haptics

| Event | Pattern |
|---|---|
| Set complete | medium impact |
| Rest ends | double tick |
| New personal best / streak | success notification + ember flash |
| Error / failed set | light warning |

## Theming

All tokens are CSS-variable-equivalent (a Dart `FitTheme` of `ColorScheme` + text/motion extensions).
Dark is primary; a light theme is defined from the same tokens but is **post-MVP** (the app is
dark-first by design).
