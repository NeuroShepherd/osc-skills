#!/usr/bin/env bash
#
# install-skill.sh — Install a Posit Assistant skill from the local repo
#
# Usage:
#   ./install-skill.sh <skill-directory>
#   ./install-skill.sh --link <skill-directory>
#
# Defaults to copying the skill directory into
#   ~/.posit/assistant/skills/<skill-name>/
# Use --link to symlink instead (Posit Assistant may not recognize symlinks).

set -euo pipefail

usage() {
    echo "Usage: $0 [--link] <skill-directory>" >&2
    exit 1
}

link_mode=false
skill_dir=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --link) link_mode=true; shift ;;
        -h|--help) usage ;;
        -*)
            echo "Unknown option: $1" >&2
            usage
            ;;
        *)
            if [[ -n "$skill_dir" ]]; then
                echo "Error: multiple directories specified" >&2
                usage
            fi
            skill_dir="$1"
            shift
            ;;
    esac
done

if [[ -z "$skill_dir" ]]; then
    echo "Error: no skill directory specified" >&2
    usage
fi

if [[ ! -d "$skill_dir" ]]; then
    echo "Error: '$skill_dir' is not a directory" >&2
    exit 1
fi

if [[ ! -f "$skill_dir/SKILL.md" ]]; then
    echo "Error: '$skill_dir' does not contain a SKILL.md file" >&2
    exit 1
fi

skill_name=$(basename "$skill_dir")
target="$HOME/.posit/assistant/skills/$skill_name"

if [[ -e "$target" ]]; then
    echo "Error: '$target' already exists" >&2
    exit 1
fi

mkdir -p "$HOME/.posit/assistant/skills"

if "$link_mode"; then
    abs_path=$(cd "$skill_dir" && pwd)
    ln -s "$abs_path" "$target"
    echo "Installed '$skill_name' (symlink) → $target → $abs_path"
    echo "Note: Posit Assistant may not recognize symlinked skills; use a copy if it doesn't show up."
else
    cp -R "$skill_dir" "$target"
    echo "Installed '$skill_name' (copy) → $target"
fi
