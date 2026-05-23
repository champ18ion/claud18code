#!/bin/bash
# claud18code — session start hook
# Shows project state if .project.md exists. Silent otherwise.

if [ -f ".project.md" ]; then
  PROJECT=$(grep "^project:" .project.md | sed 's/project:[[:space:]]*//')
  CURRENT=$(grep "[[:space:]]current:" .project.md | sed 's/.*current:[[:space:]]*//')
  BLOCKED=$(grep "[[:space:]]blocked:" .project.md | sed 's/.*blocked:[[:space:]]*//')

  if [ -n "$PROJECT" ]; then
    echo "┌─ claud18code ──────────────────────────┐"
    echo "│ Project: $PROJECT"
    [ -n "$CURRENT" ] && echo "│ Current: $CURRENT"
    [ -n "$BLOCKED" ] && echo "│ Blocked: $BLOCKED"
    echo "└────────────────────────────────────────┘"
  fi
fi
