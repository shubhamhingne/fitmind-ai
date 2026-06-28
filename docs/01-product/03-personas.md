# 03 — Personas

Three primary personas, chosen because they share the *same unmet need* — a plan that adapts —
from different starting points. FitMind AI is designed for the first one and must not actively
exclude the other two.

## Primary — "Time-starved Priya" (the design target)

- **Who:** 31, product manager, two gym-adjacent habits a week at best, owns dumbbells + a mat.
- **Context:** Wants to be strong and consistent but her week is unpredictable — some days 20
  minutes at home, some days a full hour at the gym.
- **Goal:** Feel strong and keep a streak without planning anything herself.
- **Pain:** Every plan she's tried assumes a fixed schedule she doesn't have; she quits when
  she falls "behind."
- **What success feels like:** Opens the app, it already knows she has 20 minutes and dumbbells
  today, and gives her a session worth doing.
- **Why she's the target:** Her need (adapt to *today's* constraints) is the product thesis.

## Secondary — "Returning Rohan"

- **Who:** 38, was fit years ago, intimidated by restarting, scared of injury.
- **Goal:** Rebuild safely without overdoing it.
- **Pain:** Generic plans push too hard; he needs the app to read recovery (poor sleep, high
  resting HR) and *back off*.
- **What he needs from us:** The adaptation must protect him on bad-recovery days, not just
  push harder on good ones.

## Secondary — "Plateaued Anika"

- **Who:** 26, trains 4×/week, progress has stalled, data-curious.
- **Goal:** Break the plateau with progressive overload she doesn't have to calculate.
- **Pain:** She tracks everything but nothing *uses* it; she wants the plan to respond to her
  actual performance trend.
- **What she needs from us:** Visible, explainable progression — "why today is harder than last
  week."

## Explicit non-target (for now)

- **Competitive athletes** with coaches and sport-specific periodization. FitMind AI is for
  the consistency gap, not elite programming. Saying no here keeps the product focused.

## What the personas demand of the engineering

| Persona | Forces this capability |
|---|---|
| Priya | Same-day re-planning from time + equipment |
| Rohan | Recovery-aware *de*-loading from sleep / resting-HR signals |
| Anika | Performance-trend progression with an explainable "why" |

All three trace back to one engine: **generate from goal + constraints + recent signal** —
which is why the architecture centers on an adaptive planning loop, not a static plan store.
