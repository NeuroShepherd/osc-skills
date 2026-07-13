#!/usr/bin/env bash
#
# install-skill.sh — Install a Posit Assistant skill from the local repo
#
# Usage:
#   ./install-skill.sh [-f] <skill-directory>
#
# Copies the skill directory into
#   ~/.posit/assistant/skills/<skill-name>/
# Use -f or --force to overwrite an existing installation.

set -euo pipefail

usage() {
    echo "Usage: $0 [-f] <skill-directory>" >&2
    exit 1
}

force=false
skill_dir=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -f|--force) force=true; shift ;;
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
    if "$force"; then
        rm -rf "$target"
        echo "Removed existing '$target'"
    else
        echo "Error: '$target' already exists (use -f to overwrite)" >&2
        exit 1
    fi
fi

mkdir -p "$HOME/.posit/assistant/skills"

cp -R "$skill_dir" "$target"
echo "Installed '$skill_name' → $target"
