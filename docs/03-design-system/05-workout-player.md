# 05 — The Workout Player (signature screen)

**The identity of FitMind.** If this is exceptional, the rest of the app almost designs itself. It
gets **40–50% of the design budget** and carries [Moments 2 and 3](04-signature-moments.md). The
goal: a 20-second clip that makes a reviewer stop and ask *"how did you build that?"*

*Inspiration:* Nike Training Club (full-bleed motion) · Apple Fitness (rings, glanceability) · Whoop
(premium dark, effort color). Patterns, not pixels.

## Principle for this screen: remove 40%

When someone is breathing hard, they don't read. The screen should look almost **empty** — the
movement, one number, one action. Everything else is hidden until the moment it's needed.

```
WORK                                  REST
┌──────────────────────────┐          ┌──────────────────────────┐
│  ◖◗ 2/4            ⏸      │          │  ◖◗ 2/4                   │
│                          │          │                          │
│   [ motion guidance ]    │          │          0:42            │   ← celebrity number
│                          │          │         breathe          │     (the ring breathes)
│       PUSH-UPS           │          │                          │
│                          │          │     Next · Push-ups       │   ← conversational,
│          12              │  ← hero  │         set 3            │     no "AI"
│         reps             │          │                          │
│                          │          │                          │
│  ╭────────────────────╮  │          │  ╭────────────────────╮  │
│  │        DONE         │  │  ← one  │  │     Skip rest  →    │  │
│  ╰────────────────────╯  │   giant  │  ╰────────────────────╯  │
└──────────────────────────┘  action  └──────────────────────────┘
       ring = the perimeter                +20s (tiny, forgiving)
```

Hidden by default, revealed only on demand: weight (tap the number), heart-rate (appears **only** in
the high zone, in ember), tips/form (swipe up), set list (the top counter). The default is calm.

## The progress ring is the operating system

One ring component, one visual language, rendered at different **scopes** — never decorative:

| Scope | What the ring shows |
|---|---|
| In-player (work) | progress through the current set / session, sweeping `calm → AI` |
| Set complete | snaps full, **ember** flash, then collapses to rest |
| Today screen | the day's session, a smaller instance of the same ring |
| Streak / month (post-MVP) | week and month consistency — same DNA |

It is built once (`CustomPainter`) and reused everywhere, so the app has a single spatial sense.

## Invisible AI + microcopy that makes people smile

No "AI Generated Workout" anywhere. The coach is conversational and specific. Examples:
- Entry (Today): *"Morning, Shubham. You slept well — let's push a little today. 32 minutes."*
- Rest "next": *"Next · Push-ups, set 3"* (not "AI-selected exercise").
- Partial finish: *"You had 4 minutes. You still trained. That's consistency. Tomorrow starts here."*
- Full finish: *"First time you finished all 4 sets of these."* — names the real win.

---

## Deliverable 1 · Interaction map

| Trigger | Where | Result | Haptic |
|---|---|---|---|
| Tap **DONE** | WORK | log set, advance to REST | set-complete (sharp) |
| Tap the number | WORK | reveal inline weight/rep adjuster | button (tiny) |
| Swipe **up** on guidance | WORK | form tips sheet (peek) | — |
| Swipe **down** | WORK / REST | pause (dim) | button |
| Long-press DONE | WORK | "skip exercise" confirm | warning |
| Tap **⏸** (top) | WORK | pause | button |
| Tap **Skip rest →** | REST | end rest, start next set | rest-finished (soft) |
| Tap **+20s** | REST | extend rest | button |
| (auto) rest hits 0:00 | REST | auto-advance to next set | rest-finished (soft) |
| (auto) last set DONE | WORK | hand off to celebration (Moment 3) | workout-complete (double) |
| **Voice** "done" / "next" | any | log + advance | per event |
| **Voice** "pause" / "repeat" | any | pause / replay guidance | button |

Voice is a future feature, but every primary action already declares a **voice intent** and a
spoken label, so the UI leaves room for it (no redesign later).

## Deliverable 2 · Motion storyboard (0–15s, one continuous object)

Motion *is* navigation — nothing "pushes"; the same object transforms.

```
0.00s  Today: session preview card is tapped
0.00→0.42  card EXPANDS (shared element) into the player canvas; chrome + status fade;
           the world darkens; ring draws 0 → set-start; one confident haptic as it seats
0.42  guidance loop begins; "PUSH-UPS" + "12" spring in (celebrity number)
0.5→… reps happen; each logged rep ticks the number with a spring + tiny haptic
t      DONE tapped → ring snaps to full → EMBER flash + sharp click → card collapses to REST
+0.0   REST countdown appears and breathes (ring inhales/exhales, ~4s cycle)
−3s    light ticks at 3·2·1
0:00   soft pulse → next exercise rises as the previous descends (no page change)
…      final set DONE → ring closes → morphs directly into the full-screen celebration
       (ember burst, numbers count up, coach line types, tomorrow's teaser)
```

The marketing GIF is this unbroken transformation: **preview → player → celebration, one living
object.** (The other signature interaction — the **Time Dial** on Today, where rotating a circular
dial morphs the session live — is designed when we build Today; it reuses this ring.)

## Deliverable 3 · Animation timing

| Transition | Duration | Easing | Notes |
|---|---|---|---|
| Enter (shared-element expand) | 420ms | `ease-decel` | from Today's card |
| Ring sweep (work) | continuous | `ease-standard` | tied to set progress, not a fixed loop |
| Number spring (rep/enter) | 240ms | `ease-spring` | tabular, no layout shift |
| Set complete | 240ms + ember flash 180ms | `ease-standard` | ring snap → collapse |
| Rest breathe | ~4000ms cycle | sine | inhale/exhale, calming |
| Exercise change | 420ms | `ease-standard` | rise/descend, not push |
| Hand-off to celebration | 900ms | `ease-decel` | ring morphs, doesn't dismiss |
| Reduced-motion | cross-fade 200ms | linear | no sweep/breathe; haptics remain |

## Deliverable 4 · Haptics

Per the [haptic language](06-haptic-language.md): button=tiny, rep=tick, rest-end=soft pulse,
**set complete=sharp click**, workout=double pulse, PB/streak=celebration burst, failed=light
warning. One event, one pattern — learnable without looking.

## Deliverable 5 · Accessibility

- **Targets:** primary (DONE / Skip) ≥ **64pt** in the thumb band; secondary ≥ 48pt.
- **Glanceable:** the hero number readable at arm's length, comprehensible in < 1s; no paragraph in
  WORK/REST.
- **Screen reader:** focus order = exercise → set/rep → primary action; live-region announces set
  complete, rest start/end, next exercise.
- **Dynamic type:** body scales fully; hero numerals scale within a capped range so they never break
  the layout.
- **Reduced motion:** sweep/breathe/burst off; cross-fades + haptics carry the state.
- **No color-only signals:** every signal is backed by shape **and** haptic (ember + flash + sharp
  click together), so it survives color-blindness and haptics-off.
- **Contrast:** WCAG AA on the dark canvas, validated for the number, labels, and ring.

## Deliverable 6 · Flutter implementation notes

- **State:** a `WorkoutSession` notifier (Riverpod/Bloc) is the single source of truth, a state
  machine: `entering → work(setIndex) → rest(→next) → paused → completing`. The UI is a pure
  function of state; transitions emit haptics through the `Haptics` service.
- **Animation architecture:** one `AnimationController` for the ring (sweep), one for rest-breathe;
  `Hero` for the enter expansion; `flutter_animate` for micro-interactions; a custom
  `AnimatedSwitcher` for exercise change. Keep controllers in the notifier/owning widget, not
  scattered.
- **Ring:** a `RingPainter extends CustomPainter`, wrapped in a `RepaintBoundary`, repainting only on
  its own ticker — the rest of the tree must not rebuild per frame.
- **Guidance:** Rive controller (preferred — vector, interactive, tiny) with a static labelled SVG
  fallback for reduced-motion.
- **Haptics:** centralized `Haptics` service mapping events → the vocabulary (one place to tune).
- **Performance:** sustained **60fps** (120 where supported); profile this screen *first*; isolate
  repaints; precache the next exercise's guidance during rest so transitions never hitch.

## Definition of done

A 20-second screen recording makes a Flutter reviewer think **"I want to build apps like this"** and
ask *how* it was built. If it doesn't, it isn't done — we iterate, we don't move on.
