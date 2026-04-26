#!/usr/bin/env bash
# Memento Cursor plugin installer.
# Clones (or updates) the plugin into Cursor's local plugin directory and
# prompts the user to reload Cursor so it picks up the new skills/commands/hooks.
#
# Usage:
#   curl -fsSL https://mementoagi.com/install-cursor-plugin.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/mementoagi/memento-cursor-plugin/main/install.sh | bash

set -euo pipefail

REPO_URL="https://github.com/mementoagi/memento-cursor-plugin.git"
DEST="$HOME/.cursor/plugins/local/memento"

bold()   { printf '\033[1m%s\033[0m\n' "$*"; }
green()  { printf '\033[32m%s\033[0m\n' "$*"; }
yellow() { printf '\033[33m%s\033[0m\n' "$*"; }
red()    { printf '\033[31m%s\033[0m\n' "$*" >&2; }

if ! command -v git >/dev/null 2>&1; then
  red "Error: git is not installed. Install git first, then re-run this script."
  exit 1
fi

mkdir -p "$(dirname "$DEST")"

if [ -d "$DEST/.git" ]; then
  bold "Updating Memento Cursor plugin in $DEST ..."
  git -C "$DEST" fetch --quiet origin main
  git -C "$DEST" reset --quiet --hard origin/main
else
  if [ -d "$DEST" ] && [ -n "$(ls -A "$DEST" 2>/dev/null)" ]; then
    yellow "$DEST exists and is not a git checkout. Moving aside to ${DEST}.backup.$(date +%s)"
    mv "$DEST" "${DEST}.backup.$(date +%s)"
  fi
  bold "Installing Memento Cursor plugin to $DEST ..."
  git clone --quiet --depth 1 "$REPO_URL" "$DEST"
fi

if [ -d "$DEST/hooks" ]; then
  find "$DEST/hooks" -type f -name '*.sh' -exec chmod +x {} \;
fi

green "Memento Cursor plugin installed."
echo
bold "Next steps:"
echo "  1. Reload Cursor:  Cmd+Shift+P  ->  'Developer: Reload Window'"
echo "  2. Start a new chat and type:  /mm/wake-up"
echo
echo "If you haven't yet installed the MCP server, visit https://mementoagi.com/getting-started"
