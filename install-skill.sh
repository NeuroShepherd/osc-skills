#!/usr/bin/env bash
#
# install-skill.sh — Install the SKILL.md of a Posit Assistant skill
#
# Usage:
#   ./install-skill.sh <skill-directory>
#   ./install-skill.sh --copy <skill-directory>
#
# Installs only the SKILL.md file (not assets/) into
#   ~/.posit/assistant/skills/<skill-name>/SKILL.md
#
# By default, creates a symlink so edits in-place propagate;
# use --copy for a standalone copy.

set -euo pipefail

usage() {
    echo "Usage: $0 [--copy] <skill-directory>" >&2
    exit 1
}

copy_mode=false
skill_dir=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --copy) copy_mode=true; shift ;;
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

source_file="$skill_dir/SKILL.md"

if [[ ! -f "$source_file" ]]; then
    echo "Error: '$skill_dir' does not contain a SKILL.md file" >&2
    exit 1
fi

skill_name=$(basename "$skill_dir")
target_dir="$HOME/.posit/assistant/skills/$skill_name"
target_file="$target_dir/SKILL.md"

if [[ -e "$target_file" ]]; then
    echo "Error: '$target_file' already exists" >&2
    exit 1
fi

mkdir -p "$target_dir"

if "$copy_mode"; then
    cp "$source_file" "$target_file"
    echo "Installed '$skill_name' (copy) → $target_file"
else
    # Resolve the source file to an absolute path for a reliable symlink
    abs_source="$(cd "$(dirname "$source_file")" && pwd)/$(basename "$source_file")"
    ln -s "$abs_source" "$target_file"
    echo "Installed '$skill_name' (symlink) → $target_file → $abs_source"
fi
