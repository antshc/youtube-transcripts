### Strategic Decision-Making for Tech Leaders and Developers

**Speaker:** Stephen Sennett – NDC Melbourne 2025

---

## 1. Executive Summary (≈1 page)

Stephen Sennett’s talk explores how developers and technical leaders can make better, faster, and more strategic decisions in their daily work. He frames decision-making as a continuum between *risk*, *constraints*, and *reversibility*—core factors that determine whether a decision should be taken quickly or with deep deliberation. The key message: leaders should empower teams to act autonomously on reversible (two-way) decisions while reserving their attention for irreversible (one-way) decisions that carry high organizational impact.

He begins with **constraints**, showing how time, money, legal, and technical limits define real-world choices. By challenging surface-level constraints (e.g., “data must stay in Victoria”), teams can uncover the true business or risk drivers behind them and open new options. Then, Sennett examines **risk** as the intersection of likelihood and impact, using examples from cloud computing—like choosing between on-demand vs. reserved instances—to illustrate how cognitive biases distort judgment. Real strategy comes from quantifying risks and benefits rather than relying on intuition.

Next, he introduces **reversibility** through Amazon’s “two-way vs. one-way doors” metaphor. Two-way doors allow safe experimentation (e.g., building a small tool in Rust), while one-way doors—like rewriting an entire platform—demand caution, governance, and leadership involvement. Leaders should create conditions that favor experimentation while containing the blast radius of failure.

Finally, Sennett addresses **communication and alignment**, arguing that decision quality degrades when intent is lost between organizational layers. Using examples from both tech and emergency management, he stresses that clarity of vision must cascade downward so frontline teams can make aligned choices without waiting for top-down directives. The most effective organizations, he concludes, are those that empower distributed decision-making, minimize bureaucratic friction, and maintain clear communication between strategy and execution.

---

## 2. Core Theses – Deep Insights and Real-World Anchors

### Thesis 1 – “Constraints are not walls; they’re signals waiting to be decoded.”

*Central idea:* Constraints guide decision boundaries but often hide underlying assumptions.
*Meaning:* Instead of accepting organizational, legal, or technical limits as fixed, probe their origins. Many constraints stem from outdated rules or misinterpretations. Clarifying the real reason behind them can unlock better options.
*Mechanism:* Constraints reveal the organization’s *risk tolerance* or priorities (e.g., cost, compliance, latency). Understanding the real motivator allows reframing the problem.
*Examples:*

* A company’s “data must stay in Victoria” rule turned out to be a preference, not a legal requirement—enabling a wider range of cloud solutions.
* Teams refusing downtime for years realized that a short planned maintenance window made migrations faster and safer.
* Developers resisting specific frameworks (e.g., Angular vs. React) can learn why constraints exist—stability, support, or compliance.
  *Caution:* Some constraints are legitimate (e.g., grant or legal funding conditions). Always validate before challenging.

---

### Thesis 2 – “Risk is not danger—it’s uncertainty you can measure.”

*Central idea:* Risk is the effect of uncertainty on objectives, not just potential harm.
*Meaning:* The goal is not to eliminate risk but to *understand and quantify it*. Emotional or heuristic thinking often makes teams overreact to unlikely threats and ignore costly inefficiencies.
*Mechanism:* Assess both *likelihood* and *impact*. Quantify trade-offs explicitly to reveal the “hidden risk” of overpaying, overcommitting, or stagnating.
*Examples:*

* In AWS, sticking to on-demand pricing feels safe but results in overpaying thousands annually versus reserved instances.
* Avoiding new tooling out of fear of failure often carries a higher long-term cost—missed learning and innovation.
* Refusing downtime during a migration introduced complexity that exceeded the original risk of a short outage.
  *Caution:* Not all risks are easily measurable (e.g., reputational or human factors). Use judgment alongside data.

---

### Thesis 3 – “Velocity without reversibility is recklessness.”

*Central idea:* The speed of execution must be matched by the ability to recover.
*Meaning:* Reversible (two-way) decisions—like testing a new service or prototype—should be made fast and locally. Irreversible (one-way) decisions—like large-scale migrations—require deliberate evaluation and leadership involvement.
*Mechanism:* Identify whether the decision allows easy rollback. Empower teams to make two-way decisions autonomously; reserve executive focus for irreversible bets.
*Examples:*

* Building a small internal tool in Rust = two-way door; rewriting the entire platform = one-way door.
* Running a cloud pilot = two-way door; full migration to cloud = one-way door.
* Adding experimental APIs = two-way door; deprecating major public endpoints = one-way door.
  *Caution:* Over-indexing on caution kills innovation. Strive for balance: make small, frequent, reversible bets.

---

### Thesis 4 – “Communication is not transmission; it’s shared understanding.”

*Central idea:* Most decision failures are communication failures.
*Meaning:* Leaders often assume that their intent has been understood when it hasn’t. Context, urgency, and priorities can dilute through organizational layers unless explicitly reinforced.
*Mechanism:* Use iterative, bidirectional communication. Encourage questions upward (“What’s most important—speed or coverage?”). Reinforce intent through storytelling and repetition.
*Examples:*

* A CIO’s urgent audit requirement lost urgency through miscommunication; engineers focused on technical elegance, not audit timing.
* In fire response scenarios, ground crews act effectively only when the strategic priorities—life, property, containment—are clear.
* In product development, teams deliver misaligned features when leadership fails to specify strategic intent.
  *Caution:* Over-communication can slow progress; focus on *clarity*, not *volume*.

---

### Thesis 5 – “Empowered teams make faster, smarter decisions.”

*Central idea:* Decision authority should live as close as possible to the work.
*Meaning:* Senior leaders should remove bureaucratic friction so teams can innovate quickly within safe boundaries. Empowerment is not chaos; it’s structured autonomy.
*Mechanism:* Delegate reversible decisions downward; reserve leadership time for strategic, high-cost reversals. Create a culture that rewards experimentation and reflection.
*Examples:*

* Allowing developers to build proofs of concept without approval chains accelerates innovation.
* Integrating cross-functional teams (engineering, security, legal) avoids bottlenecks in high-stakes projects.
* Amazon’s two-way door principle allows teams to iterate quickly while leaders focus on company-defining bets.
  *Caution:* Empowerment without alignment can create silos. Always link autonomy to the broader vision.

---

## 3. Easy-Recall Section – Actionable Insights for Practice

### **Best Practices – What to Do**

* Challenge every constraint: ask *why* it exists and *what* it protects.
* Quantify risks: estimate cost, time, and impact instead of relying on instinct.
* Identify reversible vs. irreversible decisions early.
* Push decision-making down to those closest to the work.
* Communicate intent repeatedly and in plain language.
* Encourage experimentation through low-cost pilots.
* Build cross-functional teams to avoid late-stage surprises.

### **Common Pitfalls / Don’ts**

* Don’t rewrite large systems without a clear business driver.
* Don’t mistake busyness for strategic progress.
* Don’t rely on intuition alone for cost/risk assessments.
* Don’t assume communication has happened—verify it.
* Don’t centralize every decision at the leadership level.

### **Rules of Thumb / Quick Heuristics**

* *If you can reverse it easily, decide fast.*
* *If it takes months or millions to undo, decide slowly.*
* *If a constraint sounds absolute, test its origin.*
* *If a process repeats weekly, automate it.*
* *If a team can’t explain the “why,” alignment is missing.*

### **Pros / Cons Example – Cloud Commitments**

**Pros:** Cost savings, predictability, efficiency
**Cons:** Reduced flexibility, commitment risk
**Heuristic:** Use reserved instances for stable workloads; use on-demand for volatile ones.

### **Key Phrases / Mnemonics**

* “Constraints are clues.”
* “Velocity without reversibility leads to chaos.”
* “Communication fails in the illusion of clarity.”
* “Empower at the edge, decide at the core.”

---

## 4. Key Points with Timestamps

| Time            | Key Insight                                                                           |
| --------------- | ------------------------------------------------------------------------------------- |
| **00:00–03:00** | Introduction and setup – framing decision-making for developers and leaders.          |
| **05:00–10:00** | Constraints: recognizing and challenging organizational, technical, and legal limits. |
| **10:30–14:00** | Real-world constraint stories (data sovereignty, downtime trade-offs).                |
| **14:00–20:00** | Risk explained: impact vs. likelihood; cloud cost examples (reserved instances).      |
| **20:00–24:00** | Quantifying risk and breaking cognitive bias through numerical reasoning.             |
| **25:00–30:00** | Case study: Rust rewrite—engineering enthusiasm vs. management caution.               |
| **30:00–36:00** | Two-way vs. one-way doors – Amazon model of decision reversibility.                   |
| **37:00–41:00** | How to empower teams to make reversible decisions safely.                             |
| **41:00–47:00** | Communication failures – audit backup story, emergency response analogy.              |
| **47:00–49:00** | Empowerment and strategic clarity – freeing leaders from tactical noise.              |
| **50:00–57:00** | Q&A: balancing risk-taking with strategic focus, cross-functional collaboration.      |

---

**Summary Insight:**
Strategic decision-making in tech is about balancing *speed*, *risk*, and *reversibility*. Challenge constraints, measure risk, communicate intent, and empower teams to decide where it matters most.
