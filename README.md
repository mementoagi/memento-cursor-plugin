# Memento: AI Memory for Cursor

Persistent, transparent, shareable memory for your AI coding assistant. Your AI remembers your codebase, conventions, and team knowledge across every session.

## What Memento Does

Every AI coding session starts from zero. Memento changes that.

- **Persistent memory** across sessions. Your AI remembers your architecture, conventions, and patterns.
- **Transparent markdown.** See, edit, and control everything your AI knows.
- **Team shared context.** Org-level memory so your whole team's AI shares knowledge.
- **Autonomous coding.** A memory-powered AGI loop that plans, builds, tests, reviews, and ships.
- **Cloud-native.** Works across machines, zero local setup.

## Memory Is Mostly Automatic

The `memento-memory` skill teaches your AI to recall context before starting work and save discoveries as they happen. Most of the time you won't need explicit commands.

When you want to drive it directly:

- `/mm/remember <thing>` to save something specific (a decision, a convention, a gotcha)
- `/mm/recall <topic>` to search memory for a topic
- `/mm/wake-up` at the start of a session to load your full context

## Setup

### 1. Install

Go to [mementoagi.com/getting-started](https://mementoagi.com/getting-started), sign in (or sign up free), and click **Install Memento in Cursor**. Cursor will open and ask you to confirm. Click Accept.

That's it. The plugin ships with all skills, commands, and hooks built in, and your API key is pre-configured.

### 2. Start your first session

In a new Cursor chat:

```
/mm/wake-up
```

Your AI comes with its own identity. The first session introduces it to you and begins building memory.

## Commands

### Core

| Command | What it does |
|---------|-------------|
| `/mm/wake-up` | Start a session: loads identity, memory, recent context |
| `/mm/remember` | Save information to persistent memory |
| `/mm/recall` | Search and load from memory |
| `/mm/sleep` | End session, consolidate memory |
| `/mm/frame` | Assess state, propose next action |
| `/mm/handoff` | Prepare context for a new thread |
| `/mm/investigate-and-cache` | Deep-dive a codebase area, save findings |

## How It Works

Memento uses the [Model Context Protocol (MCP)](https://spec.modelcontextprotocol.io/) to connect Cursor to cloud-hosted persistent memory.

**Skills** teach your AI behavioral patterns: when to remember, when to recall, how to manage sessions. They are auto-loaded by Cursor when relevant to your conversation.

**Commands** are thin stubs that fetch the latest logic from Memento Cloud at runtime, so your commands are always up to date.

**Hooks** fire at session start and end to remind your AI to load and consolidate memory.

Your AI's memory is stored as transparent markdown files:
- **Personal**: your identity, working memory, daily activity
- **Org**: team-shared codebase knowledge, conventions, projects
- **System**: AI capabilities, commands, meta-knowledge

---

For more information, visit [mementoagi.com](https://mementoagi.com).
