# The great software factory debate

- Source: [YouTube](https://www.youtube.com/watch?v=8fqTBWWnK3Y), LinearB / Dev Interrupted roundtable
- Panel: Luke/"Alok" (Warp), Dan Lines (LinearB), Dex (HumanLayer), host Andrew Ziegler (names as rendered in the auto-transcript)
- Transcript: `The great software factory debate_transcript.md`

## Executive Summary

The panel argues that the "software factory" is already here in partial form, and that the real question is not how dark (human-free) it can get but how well it runs and where humans sit in it. A poll at the start showed most attendees have only a step or two of their SDLC running without a human.

On measurement, the panel puts business outcomes first (predictable delivery, capacity, customer impact), then leading indicators such as cost per effective merged PR, merge rate per developer, rework rate, and PR maturity. Token counts are treated as the lowest rung of a ladder, not a success metric. Dex warns, via *The Goal*, against optimizing one station (for example, code generation or review) instead of end-to-end throughput. He adds that software differs from physical goods because every shipped change compounds into future work, so slop accumulates.

On ownership, every piece of work needs a human owner. A "too many PRs" problem is really a "too many bad PRs" problem. Practical levers include ownership policies, risk-tiered review, and tightly defined auto-merge gates that also change developer behavior toward small, safe PRs. The panel prefers "night vision" (visibility, monitoring, feedback from production) to blind darkness, and expects tools for fast human understanding of changes. They see incident management and the "what to build" step as least ready for automation, mostly because of trust, permissions, and the need for human product thinking. They close by recasting engineers as maintainers and improvers of the factory, who apply hard-won judgment that models do not yet learn.

## Core Theses: Deep Insights and Real-World Anchors

### "Measure the whole line, not one station"
Success is throughput up and cost per item down, plus quality, but not at the expense of end-to-end flow. Dex cites *The Goal*: MBAs optimized individual stations in factories and neglected overall throughput; today's equivalents are maximizing tokens spent or over-optimizing review in isolation.
- Stated in transcript: cost per effective PR merge, merge rate per developer, rework rate, assisted PRs (LinearB's APEX framework); GitLab's practice of giving engineers customer problems rather than tickets; token-maxing as the first rung of a three-rung ladder (tokens, outputs, outcomes).
- Caution: Dex says that if customer outcomes can't be measured, fall back through features, PRs, lines, tokens, but each fallback is a weaker proxy.

### "Software leaves the factory and keeps compounding"
Unlike cars on a truck, shipped code affects every later change, so low-quality output creates a "slop loop."
- Stated: Dex's team ran a lights-off factory for four to five months and then decided rebuilding on good patterns was faster than evolving the tangled frontend; Dex's two-zone codebase idea (a core with a high quality bar, a pragmatic zone with a lower one, no cross-dependencies).
- Extrapolation (not stated): a rising rollback rate or rework rate is an early signal that compounding is happening.

### "Every piece of work needs a human owner"
Agentic PRs go unmerged when nobody owns them; LinearB cites 37% of agentic PRs merged for less mature organizations. Ownership can be automated by code area or feature area, with governance.
- Stated: risk-tiered review (high-risk gets a human, docs-only does not); Luke's view that agents assigning specs or PRs to humans is a feature, not a bug.
- Caution: Dex notes that senior engineers can be burned out by colleagues who push slop onto them.

### "You don't have too many PRs, you have too many bad PRs"
A good PR (under roughly 5% rework) is a joy to review; the pain is bad PRs and the social cost of correcting them.
- Stated: three CTOs created narrow auto-merge gates (code areas, size under about 200 lines, deterministic or small-classifier checks). PR counts rose and slop dropped because incentives aligned with both developer and business.
- Caution: Dex says the downside risk of harder-to-maintain code slipping through is still unproven.

### "Not dark versus lit, but night vision"
Dark factories come from manufacturing (no lights because no humans). The panel prefers autonomy scores and visibility.
- Stated: Warp tracks an autonomy score (about 80% of work needing no human to commit code); Dan's "night vision" (monitor quality, feed incidents back to agents); Dex's `/show-me` skill that distills diffs into readable snippets and diagrams; "you cannot outsource the understanding."
- Disagreement: Luke considers frontend lower-stakes and Rust lower-risk to verify; Dex finds frontend (React effects) a place agents are unreliable and notes Factory AI banned `useEffect`.

### "Trust is lowest where you are most afraid"
The least automatable SDLC areas are incident response (permissions, trial-and-error loops, latency) and deciding what to build (human product thinking). Early adopters fear PR merging; mature ones fear production incidents.
- Stated: automated policy and risk assessment as a way to extend trust; context (such as live incident status) fed to agents.
- Extrapolation: pausing merges during an incident is Dan's example of context-driven policy.

### "Engineers maintain the factory"
Alignment starts with showing that humans stay in the right places and focus on thinking, architecture, and product. Engineers become dev-productivity engineers who improve the factory, and keep supplying lessons (such as "up at 3 a.m. debugging") that models don't yet absorb.

## Easy-Recall: Actionable Insights for Practice

- Start with business impact (predictable delivery, capacity), then add leading indicators (cost per merged PR, rework rate, PR maturity).
- Do not treat token spend as success; climb to outputs and outcomes.
- Have an explicit plan for agentic PRs: ownership policy, governance, risk tiers.
- If docs-only or low-risk, skip human review; if high-risk or touching core code, require a human.
- If PRs are piling up, check PR quality first, not volume.
- Use narrow, deterministic auto-merge gates to steer developers to small, safe changes.
- Track autonomy (how often a human must step in), not "darkness."
- Keep humans at gates: ambiguous specs up front, code review at the end.
- When a bad PR is merged, fix the system (skills, specs, model, harness), not just the PR.
- Do not let two codebase zones (core, pragmatic) depend on each other; promote shared code into the core.
- Feed production incidents and risk context to agents in real time.
- Invest in tools for fast human comprehension of agent output.
- Pitfall: optimizing one station (generation or review) without end-to-end throughput.
- Pitfall: aiming for a dark factory without team alignment.

## Key Points with Timestamps

- [00:02](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2s) Introduction and poll; most attendees have one or two steps without a human.
- [06:33](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=393s) Measuring success: throughput, cost per item, quality.
- [08:46](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=526s) Predictable delivery, capacity, and APEX leading indicators.
- [11:38](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=698s) *The Goal*: do not optimize single stations.
- [12:49](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=769s) Software compounds; slop affects future work.
- [14:00](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=840s) Token-maxing and the three-rung ladder.
- [15:39](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=939s) Ownership of agentic PRs; 37% merge figure; risk-tiered review.
- [19:02](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=1142s) Factories keep humans at gates; engineers improve the factory.
- [22:03](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=1323s) "Too many PRs" really means too many bad PRs.
- [23:12](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=1392s) Auto-merge gates change developer behavior.
- [25:59](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=1559s) PR maturity score.
- [28:33](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=1713s) Autonomy score instead of dark vs. not dark.
- [31:54](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=1914s) Core versus pragmatic code zones.
- [33:22](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2002s) Frontend agent unreliability; lights-off factory rebuilt.
- [35:12](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2112s) Dark factory origin and the "night vision" idea.
- [37:17](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2237s) Tools for human understanding (`/show-me`).
- [39:37](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2377s) Least-prepared SDLC area: incident management.
- [41:17](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2477s) Trust is lowest where fear is highest; context for agents.
- [43:15](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2595s) Deciding what to build remains human-led.
- [44:51](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2691s) Dex's whiteboard: unified home for specs, plans, sessions, and code.
- [48:31](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2911s) Role of engineers and developer alignment.
- [49:39](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=2979s) Humans in the loop; everyone maintains the factory.
- [50:55](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=3055s) Human lessons not yet in model weights.
- [53:07](https://www.youtube.com/watch?v=8fqTBWWnK3Y&t=3187s) Panelist product pitches (LinearB, Warp Factories, HumanLayer) and close.
