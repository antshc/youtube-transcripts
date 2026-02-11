= AI Coding Maturity Ladder
:toc:
:toclevels: 3
:sectnums:

== Overview

This document describes the AI Coding Maturity Ladder and provides a structured learning plan for senior software engineers.

Levels (bottom → top):

. Chat
. Mid-loop generation
. In-the-loop agentic coding
. On-the-loop agentic coding
. Multi-agent coding

The core principle: master each level before moving up. Skills compound.

---

== Level 1: Chat

=== What It Is

Using LLMs via chat interfaces. Copy-paste workflows. Interactive Q&A. Generating code or documents manually.

=== Core Competencies

* Prompt engineering fundamentals
* Context window management
* Structured output control
* Reducing hallucinations with constraints
* Asking for reasoning and trade-offs

=== What Mastery Looks Like

* High-quality output on first or second attempt
* Consistent formatting and structure
* Controlled verbosity
* Clear architectural reasoning when requested

=== Skills to Develop

==== Context Engineering

* Include interfaces, constraints, examples
* Exclude noise and outdated code
* Define output format explicitly

==== Structured Prompting Pattern

[source]
----
Role: Senior .NET architect
Goal: Implement feature X
Constraints:
- Must compile in .NET 8
- Must include unit tests
- Follow Clean Architecture
Output:
- Code
- Tests
- Explanation of trade-offs
----

==== Deterministic Framing

* “If uncertain, ask clarification instead of guessing.”
* “If code does not compile, revise.”

=== Exercises (2 Weeks)

* Generate ADRs from bullet notes
* Rewrite PR descriptions
* Generate unit tests for legacy modules
* Compare 3 architectural alternatives and critique them

---

== Level 2: Mid-Loop Generation

=== What It Is

AI embedded in IDE. Autocomplete-on-steroids. Suggesting implementations as you code.

=== Core Shift

From:
“Generate full solution.”

To:
“Co-create incrementally.”

=== Skills to Develop

==== Critical Evaluation

* Never accept first suggestion blindly
* Check architectural alignment
* Check testability and layering

==== Design Comparison

Evaluate alternatives by:

* Complexity
* Performance
* Coupling
* Maintainability

==== Type-Driven Development

Strong types improve AI suggestions.

* Records
* Value objects
* Clear interfaces
* Result<T> patterns

=== Exercises (2–3 Weeks)

* Implement a service using only incremental suggestions
* Ask for 3 alternative designs for:
  * Caching strategy
  * Retry logic
  * Repository abstraction
* Select best option deliberately

---

== Level 3: In-the-Loop Agentic Coding

=== What It Is

Assign larger tasks to an agent.
Observe.
Intervene.
Babysit.

This stage teaches failure patterns.

=== Core Competencies

* Detecting doom loops
* Guardrail design
* Prompt reuse extraction
* Failure analysis

=== Guardrails

Agent is NOT done until:

* Code compiles
* Tests pass
* Linter passes
* Security scan passes

==== Deterministic Completion

Use compile + test automation loops as stopping condition.

=== Prompt Library

Create reusable prompts:

[source]
----
/prompts
  refactor.md
  architecture-review.md
  async-safety.md
  security-scan.md
----

Extract reusable meta-prompts from interactive sessions.

=== Debugging Failures

When agent loops:

* Is spec unclear?
* Is architecture inconsistent?
* Is task too large?
* Is context insufficient?

=== Exercises (2–3 Months)

* Assign medium-sized features
* Observe failure patterns
* Extract 10 reusable prompts
* Automate compile-test loop

This stage is mandatory.

---

== Level 4: On-the-Loop Agentic Coding

=== What It Is

You spec work.
You hand it off.
You walk away.
You return to validated artifacts.

No babysitting.

=== Required Competencies

* Deterministic verification
* Strong automated tests
* Clean architecture
* Task decomposition mastery

=== Work Packaging Skill

You must clearly define:

* Acceptance criteria
* Constraints
* Output format
* Architectural boundaries

Example:

[source]
----
Implement feature X.

Must:
- Compile in .NET 8
- Include unit tests
- Follow Clean Architecture
- No EF in controllers
----

=== Task Decomposition (Elephant Carpaccio)

Break large work into:

* Vertical slices
* Independent subtasks
* Parallelizable components

Without this skill, agents fail.

=== Parallel Session Management

Run multiple agent sessions:

* Backend agent
* Infra agent
* Test agent
* Refactor agent

Maintain quality and control.

=== Exercises (2–3 Months)

* Run 3 parallel autonomous feature branches
* Validate via CI only
* Intervene only post-completion
* Track pass-rate without human correction

---

== Level 5: Multi-Agent Coding

=== What It Is

Orchestrated agent teams:

* Lead agent
* Backend agent
* Frontend agent
* Database agent
* Test agent
* Security agent

Tasks persist externally.
Agents operate on dependency graphs.

=== Required Skills

==== System Design Mastery

Agents replicate patterns.
Weak architecture → chaos scales.

==== Orchestration Thinking

* Dependency graphs
* Task state persistence
* Failure recovery
* Re-queuing mechanisms

==== Agent Harness Engineering

* Tool calling
* Sandbox environments
* Secure isolation
* Deterministic validation loops

This level is workflow architecture, not code generation.

---

== Fading Skills

* Memorizing syntax
* Writing boilerplate manually
* Manual refactoring in mature systems

---

== Evergreen Skills

* System design
* Architecture clarity
* Walking skeleton creation
* Vertical slicing
* Breaking fuzzy problems into specs
* Code judgment
* Ownership mindset

AI cannot replace these.

---

== New Critical Skills

* Prompt engineering
* Context engineering
* Agent harness debugging
* Guardrail design
* Workflow orchestration
* Deterministic automation loops
* AI cost management

---

== 6-Month Learning Plan (Senior Engineer Track)

=== Month 1 – Chat + Mid-Loop

* Build structured prompt library
* Integrate AI into IDE
* Practice design comparison
* Improve type-driven code quality

=== Month 2–3 – In-the-Loop

* Automate compile/test loop
* Extract reusable prompts
* Identify failure patterns
* Implement deterministic completion checks

=== Month 4–5 – On-the-Loop

* Run autonomous feature generation
* Parallelize sessions
* Add CI enforcement
* Refine task decomposition

=== Month 6 – Multi-Agent

* Implement persistent task board (JSON/Git)
* Assign subtasks to separate agents
* Enforce dependency graph
* Add security + test agents

---

== Final Shift

From:

Code Producer

To:

AI Workflow Architect

The higher you climb, the less you write code manually.
The more you design systems that agents can scale safely.

This is the real leverage.
