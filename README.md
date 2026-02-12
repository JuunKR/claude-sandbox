# Claude Sandbox

A Docker-based execution environment for **Claude Code CLI**.

## Prerequisites

- [Docker](https://docs.docker.com/engine/install/)

## Usage

1. Run the start script:
   ```bash
   bash run.sh
   ```
2. Enter the **absolute path** for your project when prompted.

## Predefined Aliases

| Alias | Command | Description |
| :--- | :--- | :--- |
| `c` | `claude` | Run Claude Code |
| `cc` | `claude --continue` | Continue last session |
| `cr` | `claude --resume` | Resume task |
| `ch` | `claude --chrome` | Run with Chrome |
| `cdg` | `claude --dangerously...` | Skip permissions |

## Included Tools

- **Languages**: Rust, Python (uv), Node.js (nvm)
- **Utilities**: git, tmux, vim
- **OS**: Ubuntu 24.04
