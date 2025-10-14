### Chapter: Navigating the Complexities of Big Refactors and Rewrites in Software Engineering

#### Introduction: The Significance of Refactors and Rewrites in Modern Software Development  
- [00:00:10 → 00:02:00]  
In this chapter, we explore the nuanced topic of **big refactors** and **rewrites**—major undertakings in software engineering that often evoke strong opinions and carry significant business risks. The speaker, Evette, draws from over a decade of experience in software development and public speaking to unpack why these processes matter, when they might be necessary, and how to approach them wisely.  
- Key vocabulary and concepts introduced include:  
  - **Refactoring:** The process of improving code structure without changing its external behavior, typically small and incremental.  
  - **Rewrite:** A larger-scale redevelopment, often involving rearchitecting the system without changing its intended functionality, generally riskier and more complex.  
  - **Code quality:** A critical factor influencing developer happiness and productivity, often degraded in legacy systems.  
  - **Technical debt (or technical neglect):** The accumulation of suboptimal code that requires eventual remediation.  
  - **Minimum Viable Product (MVP):** The simplest workable version of a product used to test market viability.  
- The importance of this topic stems from a surprising statistic: only about **20% of engineers report being happy at work**, with **bad code quality** cited as a top reason for dissatisfaction. This sets the stage for why refactors and rewrites matter, as they directly impact maintainability and developer morale.  

---

#### Section 1: The Code Quality Crisis and the Role of AI Assistance  
- [00:02:00 → 00:05:59]  
Software codebases have long struggled with quality issues, a problem exacerbated by the introduction of AI-assisted coding tools. While AI can speed up coding, it often produces code that is difficult to maintain, increasing the need for **automated refactoring** to keep quality high.  
- Relevant statistics from a quality assurance research study (with a note of bias due to the source):  
  - **75% of code lines rewritten within two weeks**  
  - **39% year-on-year churn in codebases**  
  - **25% increase in code duplication**  
  - **41% increase in failure rate** post-AI adoption  
- The speaker expresses skepticism about claims like “25% of Google’s codebase is AI-written,” comparing it humorously to autocomplete features, underscoring the need for critical evaluation of such statistics.  
- Implication: Despite AI’s assistance, human developers’ skill in **refactoring** remains crucial to maintain code quality and overall project health.  

---

#### Section 2: Refactor vs. Rewrite: Definitions and Common Misconceptions  
- [00:05:59 → 00:09:20]  
Evette clarifies the difference between **refactor** and **rewrite**, emphasizing the scale and intent:  
- **Refactor:** Small, localized improvements done during regular development, often invisible to others.  
- **Rewrite:** A large-scale architectural overhaul without changing external behavior, often called a “big refactor” when done in stages.  
- The speaker introduces the common industry advice “**never rewrite**,” warning of strategic risks such as losing market share, referencing a cautionary tale from Netscape’s failed rewrite attempt as told by Joiski.  
- The talk is structured in three parts:  
  1. Arguments against rewrites  
  2. Case studies where rewrites succeeded  
  3. A decision framework for when rewrites make sense  

---

#### Section 3: Why Rewrites Are Often Viewed as a Bad Idea  
- [00:09:20 → 00:16:28]  
The **Design Stamina Hypothesis** (Martin Fowler) is presented to illustrate why rewrites are risky:  
- Without design, velocity slows due to messy code.  
- Good design slows initial progress but improves long-term speed.  
- The **design payoff line** marks the point where investment in design begins to pay off.  
- Startups often launch their **MVP below this design payoff line**, favoring speed over perfect design to validate market demand.  
- Key insight: "Almost every successful company has a horrible legacy code base," because prioritizing rapid delivery over perfect design is a survival strategy.  
- The speaker references Kevlin Henney’s renaming of **technical debt** as **technical neglect**, emphasizing the importance of timely “paying back” this debt.  
- The danger of rewrites is that during the rewrite, **no new business value is delivered**, allowing competitors to advance and potentially overtake the market. This often leads to the rewrite being aborted — causing lost time and no improvement.  
- The speaker invites the audience to consider two **implicit assumptions** in this anti-rewrite argument, which will be revisited later.  

---

#### Section 4: Case Studies Challenging the “Never Rewrite” Doctrine  
- [00:16:28 → 00:31:18]  
Several real-world examples illustrate when rewrites can be not only necessary but successful:  

1. **Adobe Flash Migration Case:**  
   - A presentation software company’s entire product was built on discontinued Adobe Flash.  
   - Multiple failed attempts to translate Flash code to HTML5, JavaScript, and C++.  
   - Ultimately, they built a **new, simpler business-focused product** with minimal features but charged a premium price.  
   - Over time, they expanded functionality and unified the products into a single JavaScript-based offering.  

2. **Catastrophic Failure in Microservices Workflow Engine (Personal Story):**  
   - Transitioning a monolithic email marketing system to microservices caused unhandled errors due to flawed external calls.  
   - The team incrementally replaced problematic components (“boxes”) one by one, improving stability despite initial instability and on-call disruptions.  

3. **CSV Import Performance Issue (Personal Story):**  
   - A daily import process took 25 hours due to inefficient database queries executed for every field.  
   - A single optimized query reduced processing time to 5 seconds for that customer.  
   - Incremental rollout replaced old import logic for customers with similar configurations, gradually phasing out legacy code.  

4. **Microservices API Exposure for Plugin Platform:**  
   - Engineers resisted exposing internal microservice APIs fearing poor quality.  
   - Solution: incrementally implement new, well-designed API endpoints and migrate existing services to use them, ensuring continuous improvement and internal dogfooding.  

5. **Microsoft’s Visual Studio Code:**  
   - Microsoft created a lightweight editor (VS Code) from scratch targeting web developers, who traditionally disliked Microsoft’s heavier Visual Studio IDE.  
   - By addressing a new market and avoiding a full rewrite of Visual Studio, they gained widespread adoption and improved brand perception.  

6. **Speaker’s Own Product (Limp Poker platform):**  
   - Initial quick-and-dirty front-end implementation was messy and hard to modify.  
   - A partial rewrite replaced only key reactive UI components with React, keeping the rest intact, balancing progress with stability.  

---

#### Section 5: Revisiting Implicit Assumptions and Formulating a Rewrite Framework  
- [00:31:18 → 00:34:40]  
Evette reveals the two critical **implicit assumptions** in the typical “never rewrite” argument:  
1. **Rewrites do not deliver business value during the process.**  
2. **Rewrites are all-or-nothing projects.**  
- The presented case studies invalidate both assumptions: rewrites can be structured to deliver incremental user value and avoid all-or-nothing pitfalls.  
- The speaker advises **not to “sell” rewrites to business stakeholders** as rewrites but rather frame them as feature development, with the rewrite being an implementation detail.  
- This aligns with the **Agile Manifesto’s first principle**: “Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.”  

---

#### Section 6: Practical Strategies for Successful Rewrites  
- [00:34:40 → 00:41:47]  
Two main strategies emerge from the case studies:  

1. **Create Your Own Competition:**  
   - Build a new product or subsystem alongside the old one, targeting a different market segment or use case.  
   - Examples: Flash migration product, VS Code vs. Visual Studio, Limp Poker’s partial front-end rewrite.  
   - This approach can help break a cycle of increasing estimates caused by legacy code and enable innovation without blocking ongoing delivery.  

2. **Incremental Replacement with User Value:**  
   - Gradually replace backend components or APIs incrementally, focusing on small use cases to reduce failure rates and improve performance.  
   - This “strangler fig” pattern allows the old system to coexist until the new system fully takes over.  
   - Example: CSV import optimization, microservices API migration.  

- A question from the audience prompts exploration of rewrites that satisfy only one of two criteria: incremental delivery or user value.  
- A Shopify case study demonstrates that **incremental rewrites without immediate customer value** can succeed by motivating internal teams with transparent progress tracking and competition.  
- Conversely, **all-or-nothing rewrites with customer value** are likely to fail due to startup-like risks of building a large MVP from scratch.  

---

#### Section 7: The Role and Impact of AI in Rewrites  
- [00:44:22 → 00:45:35]  
- AI-assisted coding can speed development by roughly **30–40%** but does not eliminate the need for thoughtful refactoring.  
- AI tends to produce code similar in quality to the original, necessitating **conscious design improvements during rewrites**.  
- Currently, AI enables **faster rewrites** but may also increase the volume of low-quality code (“AI slop”), exacerbating the legacy code problem if unchecked.  
- The speaker emphasizes responsible use of AI as a tool, not a substitute for sound engineering judgment.  

---

#### Conclusion: Balancing Risk, Value, and Strategy in Rewrites  
- [00:45:35 → 00:48:30]  
- Rewrites are often maligned but can be powerful tools for technical and business renewal if approached with a clear framework prioritizing continuous value delivery and incremental progress.  
- Key takeaways:  
  - Avoid rewrites for their own sake; tie them to **business goals and feature delivery**.  
  - Use **incremental strategies** to reduce risk and maintain market competitiveness.  
  - Communicate rewrites as part of feature development to stakeholders rather than standalone projects.  
  - Recognize that **legacy code is often a sign of success**, not failure.  
  - Leverage AI judiciously, focusing on improving maintainability and design during rewrites.  
- Evette’s final encouragement is for engineers to engage in thoughtful conversations with product managers about the realities of legacy code and the strategic options available, fostering collaboration rather than conflict.  

---

### Summary Bullet Points  
- Only **20% of engineers are happy at work**, with **bad code quality** as a top contributor to dissatisfaction.  
- AI coding assistance increases productivity but often introduces **code that requires refactoring** to maintain quality.  
- **Refactoring** is small-scale, incremental improvement; **rewrites** are large-scale rearchitectures without changing system behavior.  
- The “**never rewrite**” rule hinges on assumptions that rewrites do not deliver value during execution and must be all-or-nothing—both challenged by real-world examples.  
- Successful rewrites often:  
  - Address **new business needs** or platform shifts (e.g., Flash discontinuation).  
  - Use **incremental replacement** patterns like strangler fig to avoid disruption.  
  - Create **internal competition** between old and new systems/products to manage risk.  
- Agile principles emphasize **early and continuous delivery of value**, which rewrites must align with to succeed.  
- AI tools currently provide modest productivity gains and require **human oversight to ensure improved design** and maintainability.  
- Engineers should **frame rewrites as feature development** to gain business support and avoid project shutdown risks.  

This chapter offers a balanced, experience-informed perspective on big refactors and rewrites, providing a practical framework to decide when and how to undertake them, turning potential liabilities into strategic advantages.
