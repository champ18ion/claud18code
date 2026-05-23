---
name: plan
description: Break a task into atomic steps with verify conditions. Waits for approval before anything is executed.
disable-model-invocation: true
---

0. Check if .project.md exists. If not: "Run /setup first — it takes 2 minutes." Stop.

1. Read .project.md
2. Use state.current as the task unless the user provided a different one
3. Break it into 2-5 atomic steps. Each step must have a verify condition:
   Step N: [action] → verify: [how to confirm done]
4. Output the plan. Stop. Do not write a single line of code until the user says go.
5. After approval: update state.current in .project.md, then execute step by step.

Rules:
- Max 5 steps. More than 5 means it's two tasks — split it.
- Each step must be completable in one session.
- If anything is unclear before planning, ask one focused question first.
- Explicitly say "Waiting for your go-ahead" after showing the plan.
