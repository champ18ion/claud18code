# claud18code

**Stop managing your AI. Start building.**

---

## How it feels right now

You open Claude Code. You explain the project. Again.
Claude starts coding before you finish the sentence.
You tap yes on a diff you half-read.
Three sessions later, the codebase has patterns you don't recognize.

You switch to Codex for a task. Start over. Explain everything. Again.

Your teammate opens the project. "What's the context here?" You spend 20 minutes on a call.

You come back after a week. Where were we?

---

## How it feels after

You open Claude Code.
Type `/plan`.
Claude already knows what you're building, your stack, your constraints, where you left off.
It shows you the steps. Waits for you to say go.

You finish a feature. Type `/ship`.
Claude checks your branch status. Finds you're 2 commits behind.
Asks if you want to rebase. Handles it.
Runs a security check. Finds a console.log you left in.
Generates the commit message. Generates the PR description.
Asks before doing any of it.

Your teammate opens the project. Reads `.project.md`. 25 lines. Knows everything they need.

You come back after a week. Type `/plan`. Still knows.

You switch to Codex. Drop in the same `.project.md`. Still knows.

**That's the difference.**

---

## What's inside

```
CLAUDE.md                 ← behavior rules, loaded every session automatically
.project.md               ← 25-line project brain, survives everything
skills/                   ← slash commands inside Claude Code
  ├── /setup              ← sets up .project.md, works on new and existing projects
  ├── /plan               ← steps defined, you approve before code is written
  ├── /ship               ← branch check → conflicts → security → commit → PR
  ├── /review             ← code review against your project's constraints
  ├── /debug              ← root cause before any fix is attempted
  ├── /ui                 ← interface + aesthetic direction, approved before code
  └── /sync               ← end-of-session brain update
hooks/
  └── session-start.sh    ← shows project state at every session open. Automatic.
```

---

## Token cost

You pay for every token. This is what that looks like:

| | Tokens per session |
|---|---|
| Most context systems | 1500–4000 (every session, before any work) |
| This package | ~400 (CLAUDE.md only, unless you run a skill) |
| With /plan or /ship | ~700 (context loads only when needed) |

Context on demand. Not context by default.

---

## The rules Claude follows

Every session, Claude operates under these rules:

- **Ask before assuming.** If a task has multiple interpretations, it lists them. Doesn't pick.
- **Plan before building.** Any task touching more than one file gets a step-by-step plan first. You approve it.
- **Touch only what's needed.** No cleaning up adjacent code. No adding unrequested features.
- **You decide, it executes.** No architectural decisions made alone. No files created outside task scope. No destructive commands without explicit approval.
- **Short answers.** No preambles. No summaries after the fact. No "I'll now...".

---

## The `.project.md` file

It's 25 lines. Plain text. Looks like this:

```yaml
---
project: BillingDash
purpose: SaaS billing dashboard for indie developers
stack: Next.js, Stripe, Postgres, Vercel
constraints: idempotent webhooks, sub-200ms API responses
---

decisions:
  2026-01-15: using Supabase Auth over custom — faster to ship, meets compliance
  2026-02-03: polling over websockets for now — premature optimization risk

state:
  current: webhook handler for failed payments
  next: retry logic with exponential backoff
  blocked:
```

Any AI reads this cold and is oriented in one message.
Any human reads this and understands the project without a call.
No lock-in. No tooling. Just a file you own.

---

## Install

```
/plugin marketplace add champ18ion/claud18code
/plugin install claud18code@champ18ion/claud18code
```

Then open your project in Claude Code and type `/setup`.

**New project** — 5 questions, `.project.md` written, done.
**Existing project** — scans your codebase, pre-fills what it finds, you confirm. Under a minute.

Or install manually:
```bash
git clone https://github.com/champ18ion/claud18code
cp claud18code/CLAUDE.md claud18code/.project.md your-project/
cp -r claud18code/skills claud18code/hooks your-project/
```

---

## The workflow

```
Day 1             →  /setup    five questions, context set, never repeat yourself
Every task        →  /plan    steps defined, you approve, then Claude executes
Every commit/PR   →  /ship    full git workflow, you make every decision
Any bug           →  /debug   hypothesis first, root cause confirmed, then fix
Code review       →  /review  critical issues flagged, nothing padded
Any UI work       →  /ui      design read + memorable detail approved before code
End of session    →  /sync    brain updated, project state preserved
```

---

## Works with any AI

`.project.md` is plain text. It works with Claude Code, Codex, Cursor, or whatever comes next.

You built the context once. You never rebuild it.

---

## Built on the shoulders of

- **Andrej Karpathy** — whose observations about LLM coding pitfalls shaped how developers think about AI behavior. Our CLAUDE.md goes further with one rule his doesn't have: developer stays in charge.
- **The token optimization community** — caveman, antigravity, and others who proved output verbosity is waste. We built that assumption in from the start.

---

MIT License
