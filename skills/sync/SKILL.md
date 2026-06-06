---
name: sync
description: Use when the user is wrapping up a session or wants to save progress. Trigger on: "we're done for now", "let's stop here", "save progress", "end of session", "pick this up later", "wrap up".
disable-model-invocation: true
---

0. Check if .project.md exists. If not: "Nothing to sync. Run /setup first." Stop.

Ask:
1. What was completed this session?
2. Any decisions made? (what + why — or "none")
3. What is next?

Then update .project.md:
- state.current → what's next
- state.next → clear or update
- state.blocked → clear if resolved
- decisions → append: YYYY-MM-DD: what — because why

Rules:
- Keep .project.md under 30 lines. Compress decisions older than 60 days if needed.
- Show only the lines that changed. Nothing else.
- Do not rewrite sections that didn't change.
