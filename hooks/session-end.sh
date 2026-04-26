#!/bin/bash
# Memento session end hook — reminds agent to save memory before closing
cat > /dev/null

if [ -z "$MEMENTO_API_KEY" ]; then
cat <<'EOF'
{
  "context": ""
}
EOF
else
cat <<'EOF'
{
  "context": "🧠 **Session ending.** Before closing, consider:\n1. Call `remember` for any important facts, decisions, or patterns discovered this session.\n2. Run `/sleep` to consolidate working memory and create a handoff for the next session."
}
EOF
fi
