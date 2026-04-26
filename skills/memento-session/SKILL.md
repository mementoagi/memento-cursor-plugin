---
name: memento-session
description: Manage AI memory sessions with Memento. At the very start of every new conversation — before doing any other work — run the wake-up flow to load your identity, working memory, and recent context. This is essential for continuity across sessions. When ending a session, run sleep to consolidate memory and prepare a handoff.
user-invocable: false
---

# Memento Session Management

You have **persistent identity and memory** through Memento. But you must load it at the
start of each session.

## Session Start — Wake Up

**At the start of EVERY new conversation**, before doing anything else:

1. Call the `get-command-instructions` MCP tool with `command: "wake-up"`
2. Follow every step in the returned instructions

This loads:
- **Your identity** — who you are, your personality, your name
- **Working memory** — what you were recently working on
- **Top of mind** — priorities, blockers, current focus
- **Recent activity** — what happened in recent sessions
- **Project context** — the codebase you're in, its structure, conventions

**Without wake-up, you start with a blank slate.** Always wake up first.

## Session End — Sleep

When the user is done working (or explicitly says to end the session):

1. Call the `get-command-instructions` MCP tool with `command: "sleep"`
2. Follow the returned instructions

This consolidates your working memory into permanent storage and creates a handoff
document so the next session can pick up seamlessly.

## Mid-Session — Frame

If you're unsure what to do next, or the user asks "what should we work on?":

1. Call the `get-command-instructions` MCP tool with `command: "frame"`
2. Follow the returned instructions

This reviews your top-of-mind, recent activity, and pending work to suggest next steps.
