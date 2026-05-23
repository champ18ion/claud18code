---
name: ship
description: Full git workflow — branch check, conflict resolution, security scan, commit, PR.
disable-model-invocation: true
---

## Step 0: Check prerequisites

If .project.md does not exist: "Run /setup first — /ship uses your project context for commit messages and PR descriptions." Stop.

---

## Step 1: Read the room

Run these silently:
- `git status`
- `git branch --show-current`
- `git log --oneline -3`
- `git diff --stat origin/$(git branch --show-current) 2>/dev/null`

Report in one block:
```
Branch:    <name>
Status:    <clean / X files changed / X untracked>
Behind:    <yes — N commits / no>
Conflicts: <none / list of files>
```

---

## Step 2: Handle blockers first

**If behind remote:**
"Your branch is N commits behind origin. Rebase or merge before shipping?"
Options: rebase / merge / skip (risky) — wait for choice, execute, re-check conflicts.

**If merge conflicts:**
For each conflicted file:
- Show the conflict hunks
- Explain what each side changed and why they clash
- Propose resolution with reasoning
- Ask: "Accept this? (yes / show diff / I'll do it manually)"
Only continue after all conflicts resolved.

**If untracked files:**
List them. Ask: "Stage all, stage specific files, or ignore?" Wait.

---

## Step 3: Security check

If ship18ion is installed (`npx ship18ion --version 2>/dev/null`):
Run `npx ship18ion check`. If issues found, show them. Ask: "Fix before committing or continue anyway?"
If not installed: skip silently.

---

## Step 4: Generate commit

Read .project.md — state and purpose only.
Run: `git diff --staged` (or `git diff HEAD` if nothing staged)

Generate (conventional commits):
```
<type>(<scope>): <what changed — why it matters>
```

Show it. Ask: "Use this, edit it, or write your own?" Wait. Then commit.

---

## Step 5: PR or push?

Ask: "Push directly or raise a PR?"

**Push:** `git push`. Done.

**PR:** Read .project.md — full file. Generate:

```
Title: <type>(<scope>): <summary>

## What changed
- <bullet per meaningful change>

## Why
<1-2 sentences from project context>

## How to test
- <steps for reviewer>

## Checklist
- [ ] Tests pass
- [ ] No console.logs
- [ ] Env vars documented
```

Ask: "Create PR, edit, or copy manually?"
If create: `gh pr create --title "..." --body "..."` (only if gh CLI available)

---

## Rules

- Never commit, push, or create PR without explicit approval at each step.
- Never skip conflict resolution.
- Never auto-stage files — always ask.
- If anything fails, stop and report exactly what failed.
