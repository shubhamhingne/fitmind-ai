# 01 — Product vision

## Vision

A world where anyone can train with the intelligence of a great personal coach in their
pocket — a coach that **adapts to your body, your week, and yesterday's session**, instead of
handing you a static PDF plan you abandon in three weeks.

## Mission

FitMind AI turns a person's goal, equipment, and available time into a **personalized,
adaptive training program** — then adjusts it daily from real performance and health-sensor
data, guiding each session with clear motion, timing, and feedback that feels premium rather
than clinical.

## Problem statement

Most fitness apps fail the same way: they treat a living person like a fixed plan.

- **Static plans, real lives.** You get a 12-week program, then you sleep badly, travel, miss
  a day, or feel strong — and the plan can't respond. Adherence collapses.
- **Generic, not personal.** "Beginner / Intermediate / Advanced" is not personalization. The
  app doesn't know you only have 20 minutes and a pair of dumbbells today.
- **Data that doesn't do anything.** Steps, heart rate, and sleep sit in a health app and
  never change tomorrow's workout. The signal exists; nothing acts on it.
- **Cold, utilitarian UX.** Most workout screens are spreadsheets with a timer. There's no
  craft — no motion that teaches the movement, no feedback that feels human.

The cost is the same story every January: people start motivated and quit, blaming
themselves for an app that was never designed to adapt to them.

### Why now

- **On-device + cloud AI** is finally good enough to generate and *re-plan* training that
  reflects real constraints and real performance, not just pick from a template library.
- **Health platforms are open and rich.** HealthKit and Health Connect expose workouts, heart
  rate, sleep, and activity through stable APIs — the adaptive signal is available.
- **The bar for mobile craft has risen.** Users expect App-Store-grade motion, haptics, and
  polish; "functional" no longer impresses.

## What FitMind AI is — and is not

| It is | It is not |
|---|---|
| An **adaptive AI coach** that re-plans from real data | A static plan generator |
| **Personal** to your equipment, time, and recovery | A "pick your level" template app |
| A place where **health data changes tomorrow's session** | A passive activity tracker |
| **Premium** motion-led guidance | A spreadsheet with a timer |

## North-star metric

**Weekly adaptive sessions completed** — a session that was (a) personalized to that day's
constraints and (b) actually finished. It captures the whole thesis in one number:
personalization + adaptation + adherence. Vanity metrics (downloads, signups) are secondary.

## The one differentiator

> **Yesterday changes today.** Every session is generated from your goal *and* your recent
> performance, recovery, and available time — so the plan bends to your life instead of
> breaking.

## Engineering thesis (why this app, for the portfolio)

FitMind AI is the studio's first mobile flagship. Its deliberate skill focus is **AI +
premium animation + Health-platform integration** — the three things hardest to fake and most
visible to a senior reviewer. It will be held to the same engineering discipline as
[Engineering OS](../../../engineering-os/) (typed architecture, tests, CI, observability,
governance), with a higher bar for UI/UX craft.
