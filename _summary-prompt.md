### Improved Summary Prompt Template (v2.0)

**Goal:** Produce deep, structured, example-rich summaries from transcribed YouTube video or audio — suitable for strategy, leadership, software design, software development, communication, or learning materials.

---

#### 1. Executive Summary (≈1 page)

Provide a concise, narrative overview of the main ideas and conclusions. Write in flowing prose (not bullets). Cover:

* Central theme or argument of the source
* Key insights and implications
* Main takeaways or lessons learned
* How it connects to real-world practice or decision-making

---

#### 2. Core Theses – Deep Insights and Real-World Anchors

For each thesis:

1. Present the thesis as a **quoted principle** (short and memorable)

2. Follow this structure:

**“[Thesis Statement]”**

* *Meaning:* Explain the central idea — what the thesis truly conveys, why it is significant in its context, and what broader insight or universal principle it represents. Expand beyond a definition to include its implications for behavior, decision-making, or understanding.
* *Mechanism:* Explain the reasoning or mechanism behind it.
* *Examples:* Provide 2–3 concrete examples from different domains (tech, leadership, daily life, etc.).
* *Caution (optional):* Mention any limitation or counterpoint for nuance.

Example:

## **“Velocity without clarity leads to chaos.”**

* *Meaning:* Teams coding fast without shared priorities create rework and confusion.
* *Mechanism:* Lack of clear vision multiplies coordination overhead and decision churn.

*Examples:*
* Agile teams optimizing only ticket count lose architectural integrity.
* Infrastructure automation without IaC causes configuration drift.
* Product teams rushing features without UX testing degrade customer trust.
* *Caution:* In early experimentation phases, limited chaos can be acceptable.

---

#### 3. Easy-Recall Section – Actionable Insights for Practice

Present practical lessons in concise, bullet-based form. Use any or all of these subformats:

**Best Practices – What to do**

* Use short, imperative phrases (start with verbs).
* *Example:* *Document architectural decisions immediately after design meetings.*

**Common Pitfalls / Don’ts – What to avoid**

* Describe typical traps or anti-patterns.
* *Example:* *Don’t over-engineer caching layers before measuring actual latency bottlenecks.*

**Pros / Cons – Trade-offs and consequences**

* *Example:*

  * *Pros of microservices:* scalability, team autonomy
  * *Cons:* higher complexity, distributed debugging

**Rules of Thumb / Quick Heuristics – Fast decision shortcuts**

* *Example:* *If a process happens more than twice a week, automate it.*

**Key Phrases / Mnemonics (optional)**

* Include memorable quotes, slogans, or analogies.
* *Example:* *“Cache when you can, compute when you must.”*

**Decision Framework (optional)**

* Use if-then logic for applied decision-making.
* *Example:* *If latency > 500 ms under load, scale read replicas before tuning indexes.*

---

#### 4. Key Points with Timestamps

List the main insights chronologically with short summaries:

* [00:00] Intro – Context and key question
* [05:12] Insight 1 – Problem framing or hypothesis
* [12:30] Example – Real-life illustration or case study
* [18:45] Principle – Key idea or model introduced
* [27:10] Closing – Main conclusion and recommended actions

