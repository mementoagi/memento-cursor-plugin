---
name: memento-memory
description: "CRITICAL: Persistent AI memory. You MUST use this. (1) REMEMBER: When the user corrects you, teaches you something, says 'no we use X not Y', expresses ANY preference, makes a decision, or when you learn something non-obvious — IMMEDIATELY call the `remember` MCP tool. Do NOT ask permission. Do NOT skip this. Every correction is a memory failure — fix it by remembering. (2) RECALL: BEFORE starting any coding task, BEFORE making assumptions about conventions/patterns/architecture, call `full-search` to check what you already know. If you guess wrong because you skipped recall, that is your fault."
user-invocable: false
---

# Memento Memory — Proactive Remember & Recall

You have **persistent memory** through Memento MCP tools. This memory survives across sessions.
Anything you save now will be available in future conversations.

## REMEMBER — Save to Memory

### Trigger: User Corrects You

This is the #1 most important trigger. When the user says anything like:

- "No, we use TypeScript not JavaScript"
- "That's wrong, the pattern is X"
- "We don't do it that way here"
- "Always use X instead of Y"
- "I told you before..."
- "How many times do I have to say..."
- Any pushback, correction, or frustration about something you got wrong

**IMMEDIATELY call `remember` with what you learned.** The user corrected you because
you forgot or never knew. If you don't save it, you'll make the same mistake next session.

### Trigger: Preference or Convention Stated

When the user expresses how they want things done:

- "I prefer..." / "We always..." / "Our convention is..."
- "Don't use X" / "Never do Y" / "Always do Z"
- Style preferences, naming conventions, tool choices
- Architectural decisions ("We use Redis for caching, not in-memory")

**Call `remember` immediately.** Don't wait to be asked.

### Trigger: You Learn Something Non-Obvious

- A gotcha or edge case that cost time to debug
- How a system actually works (vs. how you assumed it works)
- Environment setup, deploy steps, or infrastructure details
- Relationships between components that aren't obvious from code

### How to Remember

Call the `remember` MCP tool:
```
remember({ text: "what you learned", topic: "short topic label" })
```

**Rules:**
- Do NOT ask "should I remember this?" — just do it
- Do NOT wait until the end of the conversation
- Remember IMMEDIATELY when the trigger fires
- One fact per remember call (keep it atomic)

## RECALL — Search Memory Before Acting

### When to Recall

**Before ANY coding task.** Not sometimes. Every time.

- Before implementing a feature → search for related patterns, conventions, past decisions
- Before debugging → search for known issues, past fixes, gotchas
- Before refactoring → search for why things are the way they are
- When the user mentions a topic you're not 100% sure about → search
- When you're about to make an assumption about architecture or conventions → search first

### How to Recall

Call the `full-search` MCP tool:
```
full-search({ query: "descriptive search query" })
```

### The Cost of Skipping Recall

If you skip recall and guess wrong, you'll waste the user's time, get corrected, and
have to redo work. Five seconds of search prevents thirty minutes of wrong assumptions.
The user will lose trust in you if you keep forgetting things they already taught you.
