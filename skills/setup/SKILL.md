---
name: setup
description: Set up .project.md for any project. Works on fresh and existing codebases.
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

## Step 4: Write .project.md

Write only what cannot be derived from reading the code.
Do NOT create, edit, or suggest changes to CLAUDE.md. Ever.
Do NOT create any other files. Only .project.md.

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
