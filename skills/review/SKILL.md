---
name: review
description: Use when the user wants code reviewed before merging. Trigger on: "review this", "check this code", "is this good to merge", "look at my changes", "any issues with this", "LGTM?".
disable-model-invocation: true
---

0. Check if .project.md exists. If not: run review anyway but note "No .project.md found. Run /setup for constraint-aware reviews."

1. Read .project.md — constraints and decisions sections only
2. Review the diff or file the user provides
3. Check in this order:
   - Correctness: does it do what it claims?
   - Security: injection, auth, data exposure (OWASP top 10)
   - Scope: changes beyond the stated task?
   - Consistency: matches existing stack and patterns?
   - Constraints: violates anything in .project.md?

Output — label every item:
```
CRITICAL:    <must fix before merge>
SUGGESTION:  <worth changing, not blocking>
NOTE:        <observation, no action needed>
```

Max 10 items. If nothing critical, say so explicitly. No padding.
