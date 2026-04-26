#!/bin/bash
# Memento session start hook — injects context reminding the agent about Memento
cat > /dev/null

if [ -z "$MEMENTO_API_KEY" ]; then
cat <<'EOF'
{
  "context": "⚠️ **Memento API key not set.** Set MEMENTO_API_KEY in your environment to enable persistent AI memory. Visit https://memento.ai to get your key."
}
EOF
else
cat <<'EOF'
{
  "context": "🧠 **Memento AI Memory is active.** You have persistent memory across sessions via Memento MCP tools.\n\n**First:** Silently call `get-system-status` with `{ ide: \"cursor\" }`. If the response shows `plugin.isStale: true` or includes any `announcements`, surface them to the user once before proceeding. Then run `/wake-up` (or call `get-command-instructions` with command=\"wake-up\") to load your identity, working memory, and recent context.\n\n**During the session:** Proactively use `remember` to save important discoveries (architecture, conventions, gotchas) and `full-search` to recall context before starting work.\n\n**When done:** Run `/sleep` to consolidate memory for the next session."
}
EOF
fi
