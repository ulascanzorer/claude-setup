# claude-setup

The skills, plugins and global instructions I use with Claude Code.

## What's here

- `skills/`: skills stored directly in this repo.
- `vendor/`: skills that have their own upstream repos, added as git submodules and pinned to the version I use.
- `plugins.json`: the plugin marketplaces and plugins I have turned on. Claude Code downloads the plugins itself.
- `CLAUDE.md`: my global instructions for every project.
- `install.sh`: links all of it into `~/.claude`.

The repo has no credentials, history or session data. Those stay in `~/.claude` and never get copied here.

## Install

```bash
git clone --recurse-submodules https://github.com/ulascanzorer/claude-setup.git ~/claude-setup
~/claude-setup/install.sh
```

The script links each skill folder and `CLAUDE.md` into `~/.claude`. If a real file or folder is already there, the script first moves it to `~/.claude/backups/`. Then it adds the entries from `plugins.json` to `~/.claude/settings.json`. It never overwrites a setting you already have. Restart Claude Code after that, and it installs the plugins.

The script needs `git`, `bash` and `python3`.

## Day to day

Each link points into this repo. So when you edit a skill in `~/.claude/skills/`, you edit the repo. Commit and push as usual.

To add a new skill, create `skills/<name>/SKILL.md` and run `install.sh` again.

To update a vendored skill:

```bash
git submodule update --remote vendor/ste80-humanizer
git commit -am "chore: update ste80-humanizer"
```

When you turn a plugin on or off with `/plugin`, Claude Code only changes `settings.json`. Copy that change into `plugins.json` by hand if you want to keep it.
