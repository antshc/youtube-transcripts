# Pocock vs Pstack vs Osmani: Which Skill Pack Wins?

- Source: [Rob Shocks - Switch Dimension](https://www.youtube.com/watch?v=sU9MW8Ycq2M)
- Transcript: `Pocock vs Pstack vs Osmani_ Which Skill Pack Wins__transcript.md`
- Note: the automatic transcript garbles some names (for example "Addy" appears as "Maddy", "Pogox/Polcock" for Pocock, "Hiram's law" for Hyrum's law). Names are normalized here to Addy Osmani, Matt Pocock, and Lauren Tan (Pstack).

## Executive Summary

The video compares the three best-known agent "skill packs": Addy Osmani's lifecycle pack, Matt Pocock's skills, and Lauren Tan's Pstack. Rob's central claim is that they are not competitors but three angles on the same craft, each solving a different problem. Pocock's pack asks "do we agree on what we're building?", Pstack asks "can you prove it works?", and Osmani's asks "did we follow the whole process?".

Osmani's pack is the most traditional. It maps directly onto the software development lifecycle (spec, plan, build, verify, review, ship), with a slash command per stage, 25 skills, and four reviewer personas. It is the only one of the three that reaches through CI/CD, observability, deprecation and shipping, so it fits teams and enterprises best. Pocock's pack is deliberately small and composable. It front-loads alignment (interrogation, a shared glossary, decision records, specs and tickets) and is explicitly anti-framework. Pstack has no planning skills at all. Its weight is on investigation, verification and multimodal review after the fact, with swarms and "arenas" for hard, long-running problems.

The practical conclusion is that you should not run all three on every project. Too many or too long skill files bloat and confuse the context window, and skills can auto-trigger when you don't want them. Match ceremony to stakes: a button color change needs no PRD, while production or irreversible work warrants the full review. The deeper lesson is that these packs encode ordinary good engineering (TDD, thin vertical slices, agreed requirements, recorded decisions, proof against the real thing). Read them, take what works, and build your own skills, updating them whenever the agent makes a mistake.

## Core Theses: Deep Insights and Real-World Anchors

### "Three packs, three questions"

The packs are distinguished less by feature lists than by the question each one is organized around.

| | Matt Pocock | Lauren Tan (Pstack) | Addy Osmani |
|---|---|---|---|
| Core question | Do we agree on what we're building? | Can you prove it works? | Did we follow the whole process? |
| Emphasis | Alignment up front, before code | Verification after the build | Full lifecycle with quality gates |
| Planning | Specs and tickets, grilling, glossary, decision records | None by design: "the best spec is the code" | Spec (PRD) then plan into atomic tasks with acceptance criteria |
| Own vocabulary | Grilling, Wayfinder, fog of war | Potato mode, arenas | None; plain SDLC |
| Philosophy | Anti-framework; small, composable, hackable skills | Build pass does not count as evidence; investigate and verify | "SDLC done properly with an agent" |
| Scope | Design-focused | Narrow, hard problems | Only one covering CI/CD, observability, deprecation, shipping |
| Best fit | Fuzzy problems, long-lived codebases where design matters | Unreproducible bugs, migrations, overnight agent runs, Cursor multi-model setups | Teams shipping to production wanting a familiar, predictable process |

Each pack also reflects its author's background (as the video states): Osmani led Chrome developer experience and web performance at Google and wrote the design patterns book; Pocock credits The Pragmatic Programmer and domain-driven design; Tan draws on years of React and Meta experience.

### "Osmani: the SDLC, no metaphor required"

Osmani's pack has six stages (define, plan, build, verify, review, ship), each with a slash command. The video's examples of its specifics:

- **Spec and plan:** a proper PRD covering objectives, structure, code style, testing and boundaries before any code; then small atomic tasks with acceptance criteria; then one thin vertical slice at a time.
- **`/build auto`:** approve the plan once, then every task runs autonomously, each task still test-driven and committed on its own, stopping on failure. Rob's view: this is "the right way to do autonomy" because it removes the stepping-in, not the verification.
- **Specialized commands:** `/constraints` (an interview about your quality bar, written to `constraints.md`), `/web perf` (a performance audit), `/code simplify` (for code that works but nobody wants to touch).
- **Reviewer personas:** staff engineer, test engineer, security auditor, web performance auditor. Total: 25 skills plus four personas.
- **Anti-rationalization tables:** every skill lists the excuses an agent makes to skip a step ("too simple to test", "I tested it manually") next to a pre-written rebuttal.
- **Doubt-driven development:** for important decisions, a fresh-context reviewer whose only job is to doubt the claim (claim, extract, doubt, reconcile, stop). This is adversarial review during the build, not only at the end.
- **Named engineering principles baked in:** Hyrum's law (API design), the Beyoncé rule "if you liked it, you should put a test on it" (testing), Chesterton's fence (code simplification), trunk-based development, small atomic commits, code as a liability.

Portability point: it installs into roughly 70 different agents, which Rob cites as part of why it is the most team-friendly.

Caution (from the video): even Osmani's own adoption guide recommends a gradual, verification-first rollout on an existing codebase, not installing all 25 skills at once.

### "Pocock: agree first, then build"

Pocock's skills put effort before coding. The video names: `grill me` (the agent interrogates you before writing anything; Rob calls it the single best skill to install first), a shared-language glossary, decision records, specs and tickets. Pocock is openly against frameworks such as BMAD, Spec Kit and Superpowers because they take away control, so his skills are small, composable and meant to be hacked. Rob still places him within the traditional SDLC, "just approached in a different way". Example use: a fuzzy problem or a codebase you will live with for years where you care about the design.

### "Pstack: the best spec is the code"

Tan's pack deliberately has no planning skills. The weight falls on investigation, verification, and multimodal review after the fact; the build pass itself is not accepted as evidence, and the work must be proven out. The video lists its niche uses: a bug you can't reproduce, applying swarms and arenas to a problem, a migration, long-running or overnight agents you need to trust by morning, and Cursor users with several models (the skills work well as a Cursor plug-in). A five-axis arena review is mentioned as an example of its heavy machinery.

### "Ceremony should match the stakes"

Rob's own opinion is that running every pack on every project is "massive overkill". Skills are now more about "how I like to work" than teaching the model something new; long skill files and an excess of skills bloat and confuse the context window, and each installed skill is something the agent must consider and may auto-trigger by accident. His scale:

- Small tweak or visual/prototype work: just do it and check it yourself.
- Small feature: a quick grill or discovery session, then TDD.
- Big or fuzzy feature: spec and plan in phases, verifying each phase.
- Production, security-sensitive or irreversible: full review, doubt-driven development, security hardening.

Rob himself runs a mix, with light, medium and heavy versions of his own skill runtime. Counterpoint he gives: the overlap among the packs is not copying but convergence, because engineers converge on how software gets built.

### "Skills are good engineering, encoded"

The lesson is that learning these packs is learning practices: TDD, small vertical slices, agreeing on requirements before building, recording why a decision was made, not deleting a fence before knowing why it exists, and proving the work against the real thing (a green test does not mean the app works). None of it is new; the packs translate it into a form an agent can follow. Treat them like an O'Reilly textbook: steal what works and build your own on top.

## Easy-Recall: Actionable Insights for Practice

**Which pack when (per the video)**
- If the problem is fuzzy, or the codebase is long-lived and design matters, use Pocock's skills. Install `grill me` first.
- If you are on a team shipping to production and want a predictable, recognizable process or ready-made quality gates, use Osmani's.
- If the problem is narrow and hard (unreproducible bug, migration, swarms/arenas, overnight runs) or you use Cursor with several models, use Pstack.

**Mnemonic**
- Pocock = agree. Pstack = prove. Osmani = process.

**Rules of thumb**
- Don't install everything. Prune your `agents.md` and existing skills periodically; models are more capable than you expect.
- Adopt gradually, verification first, on an existing codebase.
- Autonomy should skip the human hand-offs, not the verification (`/build auto` pattern: approve once, test and commit per task, stop on failure).
- Write down in advance the excuses an agent will use to skip steps, with rebuttals (anti-rationalization table).
- For important decisions, get a fresh-context reviewer whose only job is to doubt the claim.
- Whenever the agent gets something wrong, update the skill instead of venting; that is how all three packs were built.

**Pitfalls**
- More skills does not mean a smarter agent; it adds context bloat and accidental auto-triggering.
- A green test suite is not proof the app works.
- Treating a pack as a religion rather than a reference.

## Key Points with Timestamps

- [00:00](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=0s) Intro: Osmani has open-sourced his agent skills (about 100k GitHub stars); he is the third of the "big three" after Pstack and Pocock.
- [00:29](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=29s) Promise: the packs solve different problems; you don't need all of them on all projects.
- [00:45](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=45s) Osmani's background and why his skills are "a seasoned engineer's brain compressed into markdown".
- [01:23](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=83s) Six-stage lifecycle with a slash command per stage; most traditional SDLC, fits teams and enterprise.
- [02:04](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=124s) Spec (PRD), plan (atomic tasks), build (thin vertical slices), verify, review, ship.
- [02:25](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=145s) `/build auto`: approve once, autonomous but still verified and committed per task.
- [02:48](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=168s) `/constraints`, `/web perf`, `/code simplify`.
- [03:22](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=202s) 25 skills plus four reviewer personas; overlap with Tan's and Pocock's skills.
- [03:42](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=222s) Anti-rationalization tables in every skill.
- [04:08](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=248s) Sponsor segment (Neon: branching database, storage, functions and auth for agents).
- [05:09](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=309s) Doubt-driven development: adversarial review during the build.
- [05:34](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=334s) Familiar principles inside: Hyrum's law, Beyoncé rule, Chesterton's fence, trunk-based development, code as a liability.
- [06:14](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=374s) Comparison begins: Pocock is about agreeing on what you build (`grill me`, glossary, decision records, specs, tickets); anti-framework.
- [07:04](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=424s) Pstack: "can you prove it works?"; no planning skills; "the best spec is the code".
- [07:22](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=442s) Osmani: "did we follow the whole process?"; only one covering CI/CD, observability, deprecation and shipping; installs into about 70 agents.
- [07:45](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=465s) Rob's own mix with light, medium and heavy runtimes.
- [07:56](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=476s) When to reach for each pack: Pocock for fuzzy or long-lived design, Osmani for team production work, Pstack for hard narrow problems and long-running agents.
- [08:49](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=529s) Overlap is convergence, not copying; three angles on one craft.
- [09:11](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=551s) Opinion: don't run all of them; prune `agents.md`; excess skills bloat context.
- [09:46](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=586s) Button-color example: no PRD, task breakdown, arena review or security auditor needed.
- [09:59](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=599s) Effort ladder: tweak, prototype, small feature, big feature, production/irreversible.
- [10:38](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=638s) Osmani's own advice: gradual verification-first rollout; skills can auto-trigger by accident.
- [11:03](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=663s) Real lesson: skills encode good practice (TDD, vertical slices, agreed requirements, decision records, real-world proof).
- [11:35](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=695s) The authors' influences (Pragmatic Programmer, DDD, Google engineering book, React/Meta experience).
- [11:48](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=708s) Don't treat packs as religion; steal what works and build your own harness.
- [12:15](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=735s) Update your skill each time the agent errs; that is how all three packs were built.
- [12:24](https://www.youtube.com/watch?v=sU9MW8Ycq2M&t=744s) Outro, course promo, and pointers to the earlier Pstack and Pocock videos.
