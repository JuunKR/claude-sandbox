#!/usr/bin/env bash
set -e

read -p "Enter absolute path for workspace (e.g. /home/user/project): " WORKSPACE_DIR

if [[ -z "$WORKSPACE_DIR" ]]; then
  echo "Workspace path cannot be empty."
  exit 1
fi

if [[ "$WORKSPACE_DIR" != /* ]]; then
  echo "Please provide an absolute path."
  exit 1
fi

if [[ ! -d "$WORKSPACE_DIR" ]]; then
  echo "Directory does not exist: $WORKSPACE_DIR"
  exit 1
fi

docker build -t claude-sandbox .

docker run -it --rm \
  -v "$WORKSPACE_DIR:/workspace" \
  claude-sandbox
