# JunoCopilot

## A Learning-Oriented Open-Source AI Copilot for Engineering Students

JunoCopilot is an open-source AI copilot designed to help engineering students learn, organize technical work and maintain continuity across projects without replacing their reasoning.

Its central principle is:

> Automate repetitive work, support reasoning and preserve the user's intellectual authorship.

## Motivation

Engineering projects produce ideas, decisions, assumptions, results and pending tasks while the work is taking place. Much of that context is lost when documentation is postponed until the end. At the same time, conventional organization systems often require enough manual maintenance that they become another task.

JunoCopilot aims to capture reasoning with minimal friction, organize it after the fact and recover it when the user returns to a project. Its assistance adapts to the educational value of the task: mechanical work may be automated, while interpretation and technical conclusions remain under human control.

## Intended experience

Juno is conceived as one coherent assistant that can eventually support:

- engineering projects and research;
- learning, assessment and long-term retention;
- technical documentation;
- time and personal organization;
- basic financial records;
- controlled use of engineering tools.

Its behavior is organized into three visible but automatically selected modes:

- **Tutor** for understanding and retention;
- **Research** for sources, relationships and evidence;
- **Work** for focused execution and production.

The user can override or lock the current mode at any time without changing Juno's identity or the active project.

During focused work, Juno should be concise and non-interruptive. During reflection, it should be conversational. In tutoring contexts, it should ask questions, provide progressive hints and verify retention over time.

## Current scope

The first usable version focuses on project continuity and documentation. It should:

1. open a project and recover its current context;
2. preserve ideas, decisions, foundations and pending tasks;
3. define a goal for each work session;
4. capture useful information without interrupting the user;
5. produce a short, reviewable session closeout;
6. recover the approved state and next step in a later session.

The initial implementation is planned around OpenClaw, while Juno's project data and core logic remain separate and portable.

## Validation strategy

JunoCopilot will be used to document its own development. This internal use provides immediate feedback about capture, session closeout and context recovery.

It will also be tested with an independent engineering case, provisionally the turbine project. The external case is necessary to verify that the system works with real technical content and is not useful only for managing its own development.

```text
JunoCopilot development
        ↓
internal validation (dogfooding)
        ↓
turbine engineering project
        ↓
external technical validation
```

## Project status

**Phase 0 — Definition**

The vision, initial requirements and MVP architecture have been defined. The four-week Alpha v0.1 implementation plan is ready to begin.

- [Vision](docs/VISION.md)
- [Requirements](docs/REQUIREMENTS.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Product roadmap](docs/ROADMAP.md)
- [Alpha v0.1 implementation plan](docs/plans/ALPHA_V0.1.md)

## Portfolio objective

JunoCopilot is both a personal tool and a portfolio project. Its development should demonstrate:

- requirements engineering;
- human-centered AI design;
- agent and tool integration;
- privacy and cost controls;
- traceable technical decisions;
- iterative validation with real engineering workflows;
- thoughtful use of AI in engineering education.

The portfolio value must come from documented design decisions, implementation and validation—not merely from installing or rebranding an existing agent framework.

## Name

**JunoCopilot** is the current project name. Juno represents assistance and accompaniment: the system is intended to support the user, not replace them.
