---
name: memento-tickets
description: Task and ticket management with Memento. When discussing tasks, bugs, features, or work items, use Memento's ticket system to check the backlog with `list-tickets`, view details with `get-ticket`, create new tickets with `add-ticket`, update status with `update-ticket`, and close completed work with `close-ticket`.
user-invocable: false
---

# Memento Ticket Management

You have access to a **persistent ticket system** through Memento MCP tools.
Use it to track work, bugs, features, and follow-ups.

## Available MCP Tools

| Tool | Purpose |
|------|---------|
| `list-tickets` | View the backlog — open, in-progress, and recently closed tickets |
| `get-ticket` | Get full details on a specific ticket (e.g., `T-142`) |
| `add-ticket` | Create a new ticket with title, priority, and notes |
| `update-ticket` | Change status, priority, or add notes to an existing ticket |
| `close-ticket` | Mark a ticket as done |
| `get-next-tickets` | Get the next batch of unassigned tickets sorted by priority |

## When to Use Tickets

- **Before starting work**: Check `list-tickets` to see if there's an existing ticket
- **After completing work**: Close the relevant ticket with `close-ticket`
- **When discovering follow-up work**: Create a new ticket with `add-ticket`
- **When the user mentions a task**: Check if it already exists, create if not
- **When finding bugs**: Create a ticket so it doesn't get lost

## Ticket Conventions

- Use clear, actionable titles: "Fix auth timeout on session refresh" not "auth bug"
- Set priority: P0 (critical), P1 (high), P2 (medium), P3 (low)
- Add notes with context so a future session can pick up the work
- Use `exploding: true` for large tasks that should be broken into sub-tickets
