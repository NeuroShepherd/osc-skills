# OSC Skills

This is a collection of agent skills for working with LMU Open Science Center materials, primarily intended for an internal audience of staff, HiWis, and other developers of content and tutorials for our center.

## Install Script

Use the install script to add a new skill to your Posit Assistant from this repo:

```bash
chmod +x install-skill.sh
./install-skill.sh <skill-directory>
# ./install-skill.sh osc-tutorial-conversion
```

The script copies the skill directory (including `SKILL.md` and any `assets/`, `references/`, or `scripts/` subdirectories) into `~/.posit/assistant/skills/<skill-name>/`. Use `--link` to create a symlink instead — though Posit Assistant may not recognize symlinked skills.