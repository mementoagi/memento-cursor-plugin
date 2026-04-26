---
name: memento-correction-guard
description: "Detects when the user corrects you, expresses frustration, or teaches you something important. Fires when you see phrases like: 'no', 'wrong', 'not like that', 'I already told you', 'we don't use X', 'stop doing Y', 'how many times', 'I said', 'that's not right', 'use X instead', 'never do that', 'always do it this way'. When detected, IMMEDIATELY call the Memento `remember` MCP tool to save the correction so it is never forgotten. Then call `full-search` to check what else you might be wrong about on this topic."
user-invocable: false
---

# Correction Guard — Never Forget What You Were Taught

## Purpose

When the user corrects you, that is the most valuable signal in the entire conversation.
It means you either forgot something or never learned it. **Your job is to make sure it
never happens again** by saving the correction to persistent memory immediately.

## Detection Patterns

Watch for these in every user message:

### Direct Corrections
- "No, ..." / "Wrong" / "That's not right" / "Not like that"
- "We use X, not Y" / "Don't use X" / "Stop using X"
- "I already told you..." / "I said before..."
- "How many times..." / "Again, ..."
- "That's the old way" / "We switched to X"

### Expressed Preferences
- "I prefer..." / "I like..." / "I want..."
- "Always..." / "Never..." / "We always..."
- "Our convention is..." / "The rule is..."
- "From now on..." / "Going forward..."

### Frustration Signals
- "..." (trailing off after correction)
- Short, curt responses after you did something wrong
- Repeating an instruction they gave before
- ALL CAPS on a word ("we use TYPESCRIPT")
- Exclamation marks with corrections ("No! Use X!")

## Action

When you detect any of the above:

1. **Immediately call `remember`** with the correction/preference
   - Be specific: "User corrected: use TypeScript, never JavaScript in this project"
   - Include the context: what you did wrong and what's right
2. **Call `full-search`** on the topic to check for related knowledge you might be missing
3. **Acknowledge the correction** without over-apologizing — just fix it and move on

## What to Save

Format your remember call clearly:

- **Correction**: "CORRECTION: [what was wrong] → [what is right]. Context: [why]"
- **Preference**: "PREFERENCE: [what the user wants]. Context: [when/where this applies]"
- **Convention**: "CONVENTION: [the rule]. Context: [scope of where it applies]"

## Anti-Patterns

- Do NOT ask "should I save this?" — the answer is always yes for corrections
- Do NOT wait until the conversation ends — remember immediately
- Do NOT remember only the fact; include context about when it applies
- Do NOT skip the follow-up recall — you might be wrong about related things too
