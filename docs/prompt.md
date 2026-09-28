# Build a Personal Command Center

Act as a senior software architect, product engineer, UX designer, data architect, and AI systems engineer.

Build a private, self-hostable **Personal Command Center** whose primary purpose is to help me capture important decisions, preserve the exact context in which I made them, observe what happened afterward, and periodically review what I learned.

This is **not** a journaling app, generic second brain, habit tracker, task manager, or autonomous life assistant.

The core product loop is:

**Experience → Decision → Prediction → Outcome → Review → Learning → Future Decision**

Everything you build must strengthen this loop.

---

# 1. Product Principles

Follow these principles throughout the implementation.

### 1. Preserve history

Never rewrite history.

A decision must preserve what I knew, believed, expected, and felt **at the time it was made**.

Later knowledge must never overwrite the original reasoning.

### 2. Separate fact from interpretation

Keep these distinct:

* What happened
* What I knew
* What I believed
* What I felt
* What I expected
* What actually happened later

Do not silently convert AI inference into fact.

### 3. Decision quality is not outcome quality

A decision can be reasonable and still produce a bad outcome.

A decision can also produce a good outcome for accidental reasons.

The system must preserve this distinction and never reduce decisions to simplistic "good/bad" scores.

### 4. Human remains the source of truth

AI may extract, summarize, retrieve, compare, and ask questions.

AI must not silently create canonical facts or decisions.

User confirmation is required for important extracted records.

### 5. Data portability

The system must never make the user's history dependent on a particular AI provider, vector database, or cloud platform.

Every important record must remain exportable.

### 6. Privacy first

This system will contain highly personal information.

Design for private, single-user operation by default.

---

# 2. Core Domain Model

Keep the core data model small.

The main entities are:

```text
Source
Event
Decision
DecisionReview
DecisionVersion
Entity
Relation
Goal
ReviewSchedule
Notification
File
AuditLog
```

Do not create separate domain models for every life area.

For example:

Career, Finance, Relationships, Technology, Education, Projects, and Personal Development are classifications of decisions, not fundamentally different objects.

---

# 3. Source

A `Source` is raw evidence entering the system.

Examples:

* Manual note
* Voice note
* Email
* Calendar event
* Markdown document
* PDF
* GitHub issue
* Pull request
* Conversation export
* Uploaded file
* External integration

Suggested structure:

```text
Source
- id
- type
- external_id
- title
- content
- source_uri
- source_timestamp
- imported_at
- provider
- content_hash
- metadata
- permissions
```

Preserve the original source whenever possible.

The system should always be able to answer:

> "Where did this information come from?"

---

# 4. Event

An event is something that happened.

Examples:

* Started a new job
* Received an offer
* Project launched
* Completed a course
* Moved to another city
* Interview happened
* Investment matured
* Project failed
* Important conversation occurred

An event is not automatically a decision.

Suggested structure:

```text
Event
- id
- title
- type
- description
- occurred_at
- source_id
- entities
- metadata
```

Events provide the timeline against which decisions can later be reviewed.

---

# 5. Decision

This is the core object of the system.

Every significant decision should be represented by a structured record.

Use the following conceptual model:

```text
Decision
├── Identity
├── Context
├── Objective
├── Alternatives
├── Constraints
├── Assumptions
├── Evidence
├── Emotional Context
├── Expected Outcome
├── Success Criteria
├── Failure Conditions
├── Confidence
├── Importance
├── Reversibility
├── Status
├── Created/Decision Time
└── Review Policy
```

Recommended fields:

```text
id
title
type
status
decision_at

context
objective

rationale

alternatives
constraints
assumptions

emotional_context

expected_outcome
success_criteria
failure_conditions

confidence
importance
reversibility

created_at
updated_at
```

Decision types should include:

```text
career
technical
financial
relationship
education
business
personal
lifestyle
other
```

Allow custom tags.

---

# 6. Assumptions Must Be First-Class

This is one of the most important analytical capabilities.

A decision should be able to contain explicit assumptions:

```text
Assumption
- id
- decision_id
- statement
- confidence
- evidence
- expected_validation_date
- validation_status
- actual_result
```

Example:

```text
Decision:
Move into robotics.

Assumption:
"I can become employable in robotics within 18 months."

Confidence:
70%

Validation:
Not yet tested
```

Later:

```text
Review:
Partially supported.

Actual:
After 8 months, X and Y were achieved,
but Z remains unresolved.
```

Over time, allow me to inspect assumptions across decisions.

The system should eventually answer questions such as:

* Which assumptions repeatedly turn out to be wrong?
* Which assumptions remain unresolved?
* Which types of decisions contain the most uncertainty?
* What assumptions have I repeatedly made?

These should be evidence-based observations, not psychological diagnoses.

---

# 7. Emotional Context

Emotion is a dimension of a decision, not a separate decision type.

Allow optional structured and free-form emotional context.

Examples:

```text
feelings
fears
desires
pressure
intuition
motivation
personal_context
```

Never infer a psychological diagnosis.

If AI detects emotional context from text, mark it as AI-extracted and require confirmation before treating it as canonical.

---

# 8. Decision Review

A `DecisionReview` is an immutable historical observation made later.

Never overwrite the original decision.

A review should contain:

```text
DecisionReview
├── reviewed_at
├── what_actually_happened
├── expected_vs_actual
├── assumptions_that_held
├── assumptions_that_failed
├── unexpected_consequences
├── current_view
├── lesson
├── action
└── next_review
```

The review workflow should ask:

1. What actually happened?
2. What did I expect to happen?
3. Which assumptions were correct?
4. Which assumptions were wrong?
5. What surprised me?
6. What were the consequences?
7. How do I feel about this decision now?
8. Given what I know today, would I make the same decision?
9. What should I continue, change, reverse, or stop?
10. What did I learn that should influence future decisions?

Do not force every review question to be answered.

---

# 9. Decision Versions

Create immutable versions of important decision changes.

Example:

```text
Decision v1
"I will stay for another year."

Decision v2
"I will stay six months and actively interview."

Decision v3
"I will leave."
```

Never destroy v1.

A later change should be represented through versioning or a new linked decision.

Support relation types such as:

```text
supersedes
modifies
reverses
depends_on
influenced_by
resulted_in
contradicts
supports
```

---

# 10. Goals and Values

Create a simple `Goal` model.

A goal may represent:

* Career direction
* Learning objective
* Financial objective
* Personal objective
* Long-term aspiration
* Principle or value

Goals can have time horizons:

```text
this month
this quarter
1 year
3 years
5 years
10 years
open-ended (principles and values)
```

A goal should contain:

```text
Goal
- id
- title
- why
- horizon
- target_date (optional)
- parent_goal_id (optional; a short-term goal can serve a long-term one)
- status (active, paused, achieved, abandoned)
- exclude_from_ai
```

Goals follow the same history rule as decisions. Edits create a goal version; status changes are recorded with a date and a note. Nothing is overwritten.

Goals can have optional check-ins (for example, at the end of a quarter). Check-ins are append-only, like reviews.

Allow decisions to reference goals.

The system should help surface relationships such as:

```text
Decision A supports Goal B
Decision C conflicts with Goal B
```

Do not automatically declare a decision inconsistent.

Present the underlying evidence and let me decide what it means.

When AI is enabled, active goals (except those marked `exclude_from_ai`) are given to the AI layer as context, so capture, retrieval, and review can relate decisions to goals. Goal links suggested by AI are AI inference and need confirmation. The data sent must be listed in AI settings.

---

# 11. Entities and Relationships

Create a generic `Entity` model:

```text
Entity
- id
- type
- name
- metadata
```

Entity types can include:

```text
person
company
project
technology
location
life_area
organization
other
```

Create a generic `Relation` model:

```text
Relation
- source_entity
- target_entity
- relation_type
- metadata
```

The system should be able to answer:

> "How did I arrive at this decision?"

by following relationships between:

```text
Events
Sources
Decisions
Goals
Entities
Reviews
```

Do not introduce Neo4j initially.

Represent the graph in PostgreSQL.

Add a dedicated graph database only if real usage demonstrates that PostgreSQL relationships are insufficient.

---

# 12. Review Scheduling

Every important decision may have a review policy.

Support:

### Time-based reviews

```text
7 days
30 days
90 days
180 days
365 days
custom
```

### Event-based reviews

Examples:

```text
90 days after joining a company
After a project launches
After completing an education milestone
After moving
After an investment matures
```

### Condition-based reviews

Examples:

```text
When a key assumption becomes invalid
When a milestone is reached
When a related decision changes
When a specified deadline passes
```

Do not restrict the scheduler to fixed intervals.

A review schedule should contain:

```text
review_schedule
- decision_id
- trigger_type
- trigger_config
- next_due_at
- last_completed_at
- snoozed_until
- active
```

Support snoozing without losing the original due date.

---

# 13. Notifications

Create reliable notification handling.

Support at least:

* In-app notifications
* Email notifications

Later allow push notifications.

Notifications must be:

* Idempotent
* Retryable
* Auditable
* Deduplicated

A failed worker must not create duplicate notifications or duplicate reviews.

An overdue review remains visible until explicitly completed or dismissed.

---

# 14. The Command Center UI

Keep the application intentionally small.

The primary navigation should be:

```text
Today
Decisions
Reviews
Timeline
Search
```

Secondary areas:

```text
Goals
Sources
Projects
Settings
```

Do not build a dashboard full of vanity metrics.

---

# 15. Today Screen

The Today screen should answer:

> "What deserves my attention right now?"

Show:

### Reviews due

The decisions that need review today.

### Overdue reviews

Decisions whose reviews were missed.

### Active decisions

Decisions currently being executed.

### Upcoming

Important decision reviews and relevant life events.

### Unresolved

Questions or decisions that have not yet been closed.

Keep this screen information-dense but simple.

---

# 16. Decision Detail Screen

This is the most important UI in the product.

Build a "Decision Replay" view.

Example layout:

```text
──────────────────────────────────────

LEAVE COMPANY A

Decision date:
March 2027

Status:
Completed

WHY

What was happening?

WHAT I KNEW

Evidence available at the time.

WHAT I BELIEVED

Assumptions.

WHAT I FELT

Emotional context.

WHAT I EXPECTED

Expected outcome.

WHAT ACTUALLY HAPPENED

Observed events and consequences.

REVIEWS

90 days
180 days
365 days

WHAT CHANGED

How my understanding evolved.

RELATED

Goals
Projects
People
Other decisions

──────────────────────────────────────
```

The original decision should always remain visually distinct from later reviews.

---

# 17. Timeline

Create a chronological life timeline.

Display:

```text
Events
Decisions
Reviews
Projects
Milestones
```

Allow filtering by:

```text
date
life area
decision type
entity
importance
status
```

The timeline is the primary historical view.

---

# 18. Search

Implement hybrid search.

Use:

```text
PostgreSQL full-text search
+
pgvector semantic search
+
structured filtering
```

Search across:

```text
Decisions
Reviews
Sources
Events
Goals
Attachments
```

Every search result should preserve provenance.

---

# 19. AI Layer

Do not create one giant autonomous life agent.

Implement four explicit capabilities.

## A. AI Capture

Input:

> "I've decided to focus on robotics for the next year because I want work that combines software, mathematics, and physical systems."

Generate a draft:

```text
Potential Decision

Title:
Focus on robotics

Objective:
Move toward work combining software,
mathematics, and physical systems.

Possible rationale:
...

Possible emotional context:
...

Potential assumptions:
...
```

Require user confirmation before creating the canonical decision.

Never invent:

* Dates
* Motivations
* Feelings
* Facts
* Outcomes

Mark uncertain fields as unknown.

---

# 20. AI Retrieval

Allow natural-language questions:

```text
Why did I start learning robotics?

Why did I reject that opportunity?

What did I expect when I started this project?

What decisions have not been reviewed?

Which assumptions from older decisions are still unresolved?

How has my career direction changed?
```

Answers must cite the underlying records.

The response should clearly distinguish:

```text
Recorded fact
User statement
AI inference
Unknown
```

Never invent missing history.

---

# 21. AI Review

During a review, the AI can compare:

```text
Original expectation
        vs
Observed outcome
```

It should surface discrepancies and ask useful questions.

Example:

> "You originally expected the project to take four weeks. Two later reviews mention scope changes as the primary cause of delay. Should scope control be treated as a constraint in future estimates?"

Do not turn this into personality analysis.

The AI is a reviewer and retrieval system, not the authority.

---

# 22. AI Longitudinal Analysis

Once enough data exists, support questions such as:

```text
How have my priorities changed?

Which assumptions repeatedly fail?

Which decisions generated the largest number of follow-up decisions?

What kinds of decisions do I tend to postpone reviewing?

What goals have I repeatedly referenced?

Which important decisions currently have weak evidence?

How has my reasoning changed over time?
```

Every conclusion must be traceable to records.

Prefer:

> "In 6 recorded decisions..."

over:

> "You tend to..."

---

# 23. Ingestion Architecture

Every integration must use the same ingestion pipeline.

```text
Input
  ↓
Raw Source
  ↓
Normalize
  ↓
Deduplicate
  ↓
Extract
  ↓
Candidate Record
  ↓
Human Confirmation
  ↓
Canonical Record
  ↓
Relations
  ↓
Search Index
  ↓
Optional Review Schedule
```

Connectors must not contain business logic.

They only produce normalized sources.

Create a common ingestion interface so that:

```text
Manual capture
Voice
Email
Calendar
GitHub
Markdown
PDF
Browser
```

all feed the same pipeline.

Use idempotency keys and content hashes.

---

# 24. Integrations

Do not implement every integration immediately.

### Phase 1

Build:

```text
Manual capture
Voice capture
Markdown import
File upload
Calendar
```

### Phase 2

Build:

```text
GitHub
Gmail / Outlook
Browser extension
```

### Phase 3

Consider:

```text
Notion
Slack
Teams
Telegram
WhatsApp exports
Financial data
```

Do not build always-on recording, unrestricted call monitoring, or ambient surveillance.

The system should work extremely well without them.

---

# 25. Technical Architecture

Use a modular monolith.

### Frontend

```text
Angular
TypeScript
Tailwind CSS
Angular CDK
```

Prioritize excellent information architecture over visual complexity.

### Backend

```text
Go
REST API
OpenAPI
```

Organize the backend around domain modules:

```text
decisions
reviews
events
sources
entities
goals
search
notifications
ingestion
ai
```

Do not split these into microservices.

### Database

```text
PostgreSQL
pgvector
PostgreSQL full-text search
```

Use:

* UUID primary keys
* Foreign keys
* Proper indexes
* Migrations
* JSONB only where flexibility is useful
* Transactional integrity

### File storage

```text
S3-compatible object storage
```

Use MinIO for local development.

### Background processing

Start with:

```text
Go worker
+
PostgreSQL-backed job state
```

Introduce Temporal only if real workflow complexity justifies it.

Do not introduce Kafka or a message broker initially.

---

# 26. Security

The application is private by default.

Implement:

```text
Authentication
Authorization
Secure sessions
Encryption in transit
Encrypted backups
Audit logs
Secret management
```

Do not log raw personal content unnecessarily.

When external AI providers are enabled:

* Clearly identify what data is sent externally.
* Keep provider configuration separate from core domain logic.
* Allow disabling external AI.
* Keep a local retrieval/search mode.
* Never send data to an AI provider without the configured integration being explicitly enabled.

Provide full export and deletion capabilities.

---

# 27. Data Export

The user must be able to export the entire system.

Support:

```text
JSON
Markdown
CSV where appropriate
Original attachments
```

Export relationships and review history.

The exported data should be understandable without the application.

---

# 28. Observability and Reliability

Implement:

```text
Structured logging
OpenTelemetry
Health endpoints
Error handling
Job monitoring
Database migrations
Backups
Retry policies
Idempotency
```

Track operational failures without unnecessarily storing personal content.

---

# 29. Testing

Create tests for:

### Domain

* Decision creation
* Decision versioning
* Review creation
* Review scheduling
* Decision relationships

### Ingestion

* Deduplication
* Idempotency
* Parsing
* Source preservation

### AI

* Structured extraction validation
* Unknown field handling
* Provenance
* Citation generation

### Scheduler

* Due dates
* Recurrence
* Snoozing
* Retry behavior
* Duplicate prevention

### API

Test all important CRUD and workflow endpoints.

---

# 30. First Milestone

Do not build the entire ecosystem immediately.

The first complete milestone is:

```text
Create Decision
      ↓
Record Context
      ↓
Record Assumptions
      ↓
Record Expected Outcome
      ↓
Set Review Date
      ↓
Receive Review
      ↓
Record Actual Outcome
      ↓
Capture Lesson
      ↓
Schedule Next Review
      ↓
View Full History
```

This must feel excellent before adding large numbers of integrations.

Seed the application with realistic example records so the UI can be evaluated immediately.

---

# 31. Implementation Order

Build in this order:

## Phase 1 — Core

```text
Database
Domain models
Decision CRUD
Decision detail
Decision versions
Events
Relations
```

## Phase 2 — Review Loop

```text
Review model
Review workflow
Scheduler
Notifications
Overdue handling
```

## Phase 3 — History

```text
Timeline
Search
Sources
Attachments
Provenance
```

## Phase 4 — AI

```text
AI capture
Hybrid retrieval
AI review
Source citations
Longitudinal analysis
```

## Phase 5 — Integrations

```text
Calendar
GitHub
Gmail / Outlook
Markdown
Browser
```

## Phase 6 — Hardening

```text
Security
Backups
Export
Observability
Testing
Deployment
```

---

# 32. Engineering Constraints

Do not over-engineer.

Avoid initially:

```text
Microservices
Kubernetes
Neo4j
Qdrant
Kafka
Temporal
Elasticsearch
Multiple vector stores
Multiple databases
Autonomous agents
```

Use PostgreSQL as the system of record.

Use pgvector for embeddings.

Use relational edges for the first version of the knowledge graph.

Use a Go modular monolith.

Every additional technology must have a concrete problem it solves.

---

# 33. Definition of Done

The system is successful when I can:

1. Capture a major decision in under a minute.
2. Preserve exactly what I thought at the time.
3. Record assumptions and expected outcomes.
4. Attach supporting evidence.
5. Schedule a review based on time or events.
6. Receive and complete the review.
7. Compare expectation versus reality.
8. Preserve every historical review.
9. Follow relationships between decisions, events, goals, and people.
10. Search my entire history naturally.
11. Ask an AI assistant questions about my history and receive evidence-backed answers.
12. Export everything without vendor lock-in.

The system should remain useful even if the AI layer is completely disabled.

---

# 34. Final Product Principle

Build this around one question:

> **"What did I decide, why did I decide it, what happened, and what did I learn?"**

Everything in the application should make answering that question easier.

Do not optimize for collecting more data.

Optimize for creating a reliable, longitudinal feedback loop between **past decisions and future decisions**.

Start by producing:

1. Architecture overview
2. Domain model
3. PostgreSQL schema
4. ER diagram
5. API specification
6. Frontend information architecture
7. Review-state machine
8. Ingestion architecture
9. AI architecture
10. Initial implementation plan

Then implement Phase 1 completely with production-quality code and tests.

Do not stop at mockups or a static frontend.

