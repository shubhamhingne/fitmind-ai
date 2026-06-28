# 04 — Signature moments

We design **moments before screens**. These three are the ones a user should remember and describe
to a friend. Every screen exists to serve one of them. Ember appears only where earned.

## Moment 1 — "It already knows my day"

*Where:* app open / Today. *Feeling:* a coach who was expecting you.

```
Open → "Good morning, Shubham." (types in, calm)
     → "You've got 28 minutes." (the number the app remembers / asks)
     → today's session is ALREADY prepared, not "tap to generate"
```

- **Beats:** greeting types in (240ms) → the time the user has surfaces → the prepared session
  cards stagger in beneath it. No spinner, no "generate" button as the first impression.
- **Motion:** warm decel entrance; the recovery state subtly tints the greeting (calm blue today).
- **Ember:** only if a streak is live ("🔥 day 5") — earned.
- **Why it lands:** most apps open to a menu. FitMind opens to *readiness*.

## Moment 2 — The transformation into training

*Where:* tap **Start**. *Feeling:* not navigation — a state change of the whole app.

```
Tap Start → the session card EXPANDS to full-screen (shared-element)
          → chrome recedes, the world darkens, the first exercise rises
          → a single confident haptic
          → "You're training now."
```

- **Beats (≈ `dur-slow` 420ms):** card scales + morphs into the player canvas; nav/status fade;
  the progress ring draws from 0; haptic lands as the ring seats. It must feel like the room dimmed.
- **Motion:** shared-element expansion (not a push); everything else cross-fades out so attention
  collapses onto the work.
- **Ember:** none yet — effort hasn't happened. Cool, focused.
- **Why it lands:** the boundary between "browsing" and "training" is *felt*, so the user commits.

## Moment 3 — The earned finish

*Where:* final exercise complete. *Feeling:* you did something; the coach noticed.

```
Last set done → full-screen celebration (not a dialog)
              → ember particle burst + success haptic, scaled to real effort
              → calories · consistency streak · the set you beat
              → AI line, specific: "First time you finished all 4 sets of these."
              → tomorrow's teaser: "Based on today, tomorrow leans into recovery."
```

- **Beats (≈ `dur-celebrate` 900ms):** ring closes → burst → numbers count up (spring) → AI summary
  types → teaser. Honors partial completion warmly (smaller burst, kind copy) — never confetti for
  nothing.
- **Motion + haptic:** the one place celebratory motion is allowed; success-notification haptic with
  an ember flash.
- **Ember:** full permission here — this is the earned moment.
- **Why it lands:** it closes the loop emotionally and seeds tomorrow, so the user wants to return.

## The through-line

Calm readiness → a felt transformation → an earned reward that points at tomorrow. Cool blues hold
the structure; **ember marks only the win**. Build the [workout player](05-workout-player.md) first —
it carries Moments 2 and 3 and is the signature of the app.
