---
name: memento-pre-task-recall
description: "Before starting any implementation, refactoring, debugging, or code review task, FIRST search Memento persistent memory using the `full-search` MCP tool. Search for the topic, the files involved, related conventions, and known gotchas. This prevents repeating past mistakes, violating established conventions, and wasting time rediscovering things that are already documented. Trigger: any time you are about to write code, modify files, or make architectural decisions."
user-invocable: false
---

# Pre-Task Recall — Search Before You Code

## Rule

**Before writing any code or making any technical decision, search Memento first.**

This is not optional. This is not "when you feel like it." Every time.

## When This Fires

- User asks you to implement something
- User asks you to fix a bug
- User asks you to refactor code
- User asks you to review code
- You're about to choose a pattern, library, or approach
- You're about to create a new file or module
- You're about to modify an existing system

## What to Search For

Run `full-search` with queries covering:

1. **The feature/topic**: "authentication flow", "payment processing", "user settings"
2. **The files you'll touch**: search by filename or module name
3. **Conventions**: "coding conventions", "testing patterns", "naming"
4. **Known issues**: "gotchas", "known bugs", topic-specific warnings

Pick the 1-2 most relevant queries. Don't search for everything — just what's needed
to avoid making a mistake.

## What to Do With Results

- If Memento has relevant context → read it, follow it
- If Memento has conventions → follow them exactly
- If Memento has gotchas → avoid the documented pitfalls
- If Memento has nothing → proceed, but remember what you learn afterward

## Why This Matters

Every session starts with a blank slate. Without recall, you'll:
- Reinvent patterns that already exist
- Violate conventions the user already taught you
- Hit gotchas that were already documented
- Waste time rediscovering what's already known

The user's trust depends on you not repeating mistakes.
