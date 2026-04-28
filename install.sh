#!/usr/bin/env bash
# Memento Cursor plugin installer (macOS / Linux).
# Downloads the plugin tarball and extracts it into Cursor's local plugin directory.
# Uses only curl + tar, which are preinstalled on every modern Mac and most Linux distros.
# No git dependency.
#
# Usage:
#   curl -fsSL https://mementoagi.com/install-cursor-plugin.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/mementoagi/memento-cursor-plugin/main/install.sh | bash

set -euo pipefail

TARBALL_URL="https://github.com/mementoagi/memento-cursor-plugin/archive/refs/heads/main.tar.gz"
DEST="$HOME/.cursor/plugins/local/memento"

bold()  { printf '\033[1m%s\033[0m\n' "$*"; }
green() { printf '\033[32m%s\033[0m\n' "$*"; }
red()   { printf '\033[31m%s\033[0m\n' "$*" >&2; }

for cmd in curl tar; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    red "Error: $cmd is not installed. Please install it and retry."
    exit 1
  fi
done

# Wipe any prior install so the new tarball lands cleanly (handles stale .git, partial writes, etc).
if [ -d "$DEST" ]; then
  bold "Updating Memento Cursor plugin in $DEST ..."
  rm -rf "$DEST"
else
  bold "Installing Memento Cursor plugin to $DEST ..."
fi

mkdir -p "$DEST"

# --strip-components=1 peels off the "memento-cursor-plugin-main/" prefix from the tarball.
curl -fsSL "$TARBALL_URL" | tar -xz --strip-components=1 -C "$DEST"

if [ -d "$DEST/hooks" ]; then
  find "$DEST/hooks" -type f -name '*.sh' -exec chmod +x {} \;
fi

green "Memento Cursor plugin installed."
echo
bold "Next step:"
echo "  Start a new chat in Cursor and type:  /wake-up"
echo
echo "  (Cursor will match it to /mm/wake-up. If the command isn't"
echo "   recognized, restart Cursor and try again.)"
echo
echo "If you haven't yet installed the MCP server, visit https://mementoagi.com/getting-started"
