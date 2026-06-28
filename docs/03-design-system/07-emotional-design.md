# 07 — Emotional design

The last 10% — the difference between a very good fitness app and one Apple features — is not
widgets or color. It's **how the user feels** at second 3, second 15, second 120. We design the
emotion first; the UI serves it.

## The Workout Player has emotional phases, not just UI states

| Phase | The user feels | The app's job | How |
|---|---|---|---|
| **1 · Open** | *I don't want to.* | remove friction; no pep talk | *"Today's session · 22 min · Just start. We'll handle the rest."* One action. |
| **2 · First exercise** | *Can I do this?* | radiate confidence; go silent | huge movement, huge number, huge DONE — nothing else |
| **3 · The middle** | *This is dragging.* (where people quit) | quietly escalate energy | ring grows brighter, background warms a touch, coach gets more encouraging, motion gains a little life — *"keep going"* without saying it |
| **4 · Last exercise** | — | build **anticipation**, not celebration | *"One set left."* ring begins to glow, a small haptic, a tiny sound — the body knows it's close |
| **5 · Completion** | *I did it.* | own the moment | full-screen; the ring **fills the screen**, particles appear **inside** it, then it collapses to reveal the line |

> Phase 3 is where the app is won or lost. A static UI feels longer the longer you're in it; FitMind
> feels like it's quietly rooting for you.

## The completion animation (worth days alone)

```
ring closes → expands → fills the entire screen → confetti INSIDE the ring (not above)
            → collapses → reveals:  "You trained.  Even on a busy day.
                                     That's how progress happens."
```

No dialog, no toast, no modal — the screen *becomes* the celebration. This is the GIF people share.

## Premium details nobody expects (but everyone feels)

- **Gyroscope life:** after a completed set, the ring reacts *very* subtly to the phone's tilt
  (accelerometer). No one notices consciously; everyone feels the app is alive.
- **Anticipation on open:** ~200ms of just the ring, *breathing*, before today's session fades in.
  A tiny delay reads as massive polish.
- **The coach remembers you:** never generic. *"Yesterday 18 min · today 22 · +4."* or *"You
  finished this one 40 seconds faster."* Tiny, personal, impossible for a static app.

## Silence is a feature

Most fitness apps never shut up — coach, music, badges, calories, HR, achievements all at once.
Remove half. A quiet interface reads as premium and lets the *earned* moments land. Default to
silence; speak only when it helps the next rep.

## Interruption is real life

Calls, doorbells, kids. Returning must never dump the user back cold:

> *"Welcome back. Ready to continue? Set 3 of 5."*

The `WorkoutSession` state machine persists exactly where they were; resuming is one tap. A tiny
detail that signals enormous quality.

## The through-line, again

Momentum. At every phase the easiest action is *forward*. The interface's quiet job is to make
continuing feel natural and stopping feel like the harder choice.
