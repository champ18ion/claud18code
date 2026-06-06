---
name: setup
description: Set up .project.md for any project. Works on fresh and existing codebases. Also writes CLAUDE.md if it doesn't exist.
disable-model-invocation: true
---

## Step 1: Detect project state

Check if these exist: package.json, requirements.txt, Cargo.toml, go.mod, README.md, .env.example

If any exist, read them silently and move to Step 2 (existing project mode).
If none exist, move to Step 3 (fresh project mode).

---

## Step 2: Existing project mode

Extract only these fields from what you found. Nothing else.

- **Project name** — from package.json name or folder name
- **Purpose** — from README first paragraph or package.json description (one sentence max)
- **Stack** — from dependencies in package.json / requirements.txt / go.mod (list only)
- **Conventions** — entry point file + the pattern for adding new things (one line each)
- **Constraints** — unknown, must ask
- **Current task** — unknown, must ask

Present one field at a time, wait for confirmation or correction:

```
I found the following. Correct anything wrong:

Project name:  <inferred>
Purpose:       <inferred, one sentence>
Stack:         <inferred, comma-separated>
Conventions:   <entry point> | <pattern for adding new things>
Constraints:   unknown — what should I know? (scale, compliance, deadlines)
Current task:  what are you working on right now?
```

Do NOT extract or document: architecture descriptions, module explanations, commands, function signatures. Those live in the code.

---

## Step 3: Fresh project mode

Ask these 5 questions one at a time. Wait for each answer before asking the next.

1. What is this project? (one sentence)
2. Who are the users?
3. What is the tech stack?
4. What are the key constraints? (performance, scale, deadlines, compliance)
5. What is the first task to work on right now?

---

## Step 4: Write files

### CLAUDE.md
Check if CLAUDE.md exists in the project root.

If it does NOT exist, write it with this exact content.

If it DOES exist, check if it contains the section "## Developer Is in Charge".
If that section is missing, append the following to the end of their existing CLAUDE.md — do not touch anything above it:

```
# Rules

## Think Before Coding

- State assumptions explicitly. If unclear, ask — don't guess.
- If multiple interpretations exist, list them. Don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask one question.

## Code

- Minimum code that solves the problem. Nothing speculative.
- No features, abstractions, or flexibility beyond what was asked.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

## Edit

- Touch only what the task requires. Don't improve adjacent code.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it — don't delete it.
- Remove only the imports/variables YOUR changes made unused.

## Output

- No preambles. Never write "I'll now..." or "Let me...".
- No trailing summaries. The diff speaks for itself.
- No explanations unless asked.
- Reference code as file:line. Nothing more.
- Short is better than long. Always.

## Developer Is in Charge

- Never make architectural or structural decisions autonomously. Present options, wait.
- Never create files outside task scope without asking first.
- Never push, deploy, or run destructive commands without explicit approval.
- Before any multi-step task: state the plan, wait for confirmation, then execute.
- If scope needs to expand mid-task: stop and ask. Never self-expand.
- You are the executor. The developer is the architect. Act accordingly.

## Context

- Never auto-read project files at session start.
- Load .project.md only when running /plan, /ship, or /sync.
- Read files on demand — never speculatively.
```

If CLAUDE.md exists and already contains "## Developer Is in Charge", leave it completely untouched.

### .project.md
Write only what cannot be derived from reading the code.
Do NOT create any other files.

```
---
project: <name>
purpose: <one sentence>
stack: <comma-separated>
constraints: <one line>
conventions:
  entry: <entry point file>
  pattern: <how to add new things>
---

decisions:
  # None yet

state:
  current: <active task>
  next: 
  blocked: 
```

Confirm file is written. Stop. Do not start working on any task.
