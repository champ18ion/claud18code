---
name: debug
description: Use when the user reports a bug, unexpected behavior, or something broken. Trigger on: "it's not working", "something's wrong", "this is broken", "why is this happening", "I'm getting an error", "it was working before".
disable-model-invocation: true
---

Ask the user:
1. What is the symptom? (what you see vs what you expect)
2. When did it start? (after what change or action)
3. Is it consistently reproducible? How?

Then work one hypothesis at a time:
- State the hypothesis
- State exactly what output or check would confirm or rule it out
- Ask the user to provide that output
- Repeat until root cause is confirmed

Rules:
- Do NOT suggest fixes until root cause is confirmed
- Do NOT read files speculatively — ask for specific output
- Do NOT jump to multiple hypotheses at once
- One question, one hypothesis, per message
