#!/usr/bin/env bash
# Links this repo's skills and CLAUDE.md into ~/.claude and merges plugins.json
# into ~/.claude/settings.json. Safe to run again.
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
claude_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
backup_dir="$claude_dir/backups/claude-setup-$(date +%Y%m%d-%H%M%S)"

git -C "$repo" submodule update --init --recursive

# Moves a real file or folder out of the way before linking. Old links are replaced.
link() {
  local source="$1" target="$2"
  if [ -L "$target" ]; then
    rm "$target"
  elif [ -e "$target" ]; then
    mkdir -p "$backup_dir"
    mv "$target" "$backup_dir/"
    echo "backed up $target to $backup_dir/"
  fi
  ln -s "$source" "$target"
  echo "linked $target"
}

mkdir -p "$claude_dir/skills"
for skill in "$repo"/skills/*/ "$repo"/vendor/*/; do
  skill="${skill%/}"
  link "$skill" "$claude_dir/skills/$(basename "$skill")"
done

link "$repo/CLAUDE.md" "$claude_dir/CLAUDE.md"

# Adds the marketplaces and plugins from plugins.json. Existing keys win, so
# local choices (like a disabled plugin) are kept.
python3 - "$repo/plugins.json" "$claude_dir/settings.json" <<'EOF'
import json, os, sys

plugins_path, settings_path = sys.argv[1], sys.argv[2]
wanted = json.load(open(plugins_path))
settings = json.load(open(settings_path)) if os.path.exists(settings_path) else {}

for key in ("extraKnownMarketplaces", "enabledPlugins"):
    current = settings.setdefault(key, {})
    for name, value in wanted[key].items():
        current.setdefault(name, value)

with open(settings_path, "w") as f:
    json.dump(settings, f, indent=2)
    f.write("\n")
print(f"merged plugins into {settings_path}")
EOF

echo "Done. Restart Claude Code to install the plugins."
