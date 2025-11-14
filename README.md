# Claude Code Commands

Collection of useful slash commands for Claude Code to enhance productivity and session management.

## Overview

This repository provides reusable Claude Code slash commands that can be installed into any project. The commands help automate common workflows and improve session continuity.

## Commands

### /checkpoint

Automatically generates comprehensive session checkpoint files for seamless handoff between sessions.

**What it does:**
- Gathers git state (branch, commits, changes)
- Summarizes session work (features, bugs, decisions)
- Lists all modified files with line numbers
- Documents technical decisions and rationale
- Captures deployment status and next steps
- Saves to `./sessions/claude-checkpoint-YYYYMMDD-HHMMSS.md`

**When to use:**
- At the end of a work session
- Before switching context to another project
- When handing off work to another developer
- When you need to resume work after a break

## Installation

### Quick Install

```bash
git clone https://github.com/wasmagents/claude-commands.git
cd claude-commands
./install.sh /path/to/your/project
```

### Manual Install

1. **Copy commands to your project:**
   ```bash
   mkdir -p /path/to/your/project/.claude/commands
   cp commands/*.md /path/to/your/project/.claude/commands/
   ```

2. **Create sessions directory:**
   ```bash
   mkdir -p /path/to/your/project/sessions
   ```

3. **Update .gitignore:**
   ```bash
   echo "# Session checkpoints (local only, not committed)" >> /path/to/your/project/.gitignore
   echo "sessions/" >> /path/to/your/project/.gitignore
   ```

4. **Update GitHub Actions (if applicable):**

   Add `sessions/**` to your workflow's `paths-ignore` section:

   ```yaml
   on:
     push:
       branches:
         - main
       paths-ignore:
         - 'docs/**'
         - '**.md'
         - 'sessions/**'  # Add this line
   ```

5. **Reload Claude Code** to enable the new commands

## Usage

### Creating a Checkpoint

At the end of your session, simply run:

```
/checkpoint
```

Claude Code will automatically:
1. Gather all git information
2. Summarize your session work
3. Document files changed with line numbers
4. Capture current state and next steps
5. Save checkpoint to `./sessions/claude-checkpoint-YYYYMMDD-HHMMSS.md`

### Resuming from a Checkpoint

In your next session, provide the checkpoint file:

```
I'm resuming from a previous session. Please read ./sessions/claude-checkpoint-YYYYMMDD-HHMMSS.md
```

Claude Code will read the checkpoint and understand exactly where you left off.

## Requirements

- Claude Code CLI (claude.ai/code)
- Git repository
- Bash shell (for installation script)

## Project Structure

```
claude-commands/
├── commands/
│   └── checkpoint.md       # Checkpoint slash command
├── install.sh              # Automated installer script
├── README.md               # This file
└── LICENSE                 # Apache-2.0 license
```

## Benefits

### Before Claude Commands
- Lost context between sessions
- Spent time re-learning previous work
- Made assumptions about past decisions
- Manual checkpoint files were tedious

### After Claude Commands
- Instant context restoration
- No time wasted re-learning
- Clear understanding of previous decisions
- Fully automated checkpoint creation

## Configuration

The checkpoint command stores files in `./sessions/` by default. This directory is:
- Ignored by git (not committed)
- Ignored by GitHub Actions (no deployment triggers)
- Local-only for your reference

You can customize the checkpoint template by editing `.claude/commands/checkpoint.md` in your project.

## Contributing

Contributions are welcome! To add a new command:

1. Fork this repository
2. Create a new command file in `commands/your-command.md`
3. Update this README with command documentation
4. Submit a pull request

### Command Guidelines

- Use clear, descriptive names
- Provide comprehensive instructions for Claude Code
- Include examples in documentation
- Test the command in a real project
- Follow existing command structure

## License

Apache-2.0

## Support

For issues, questions, or suggestions:
- Open an issue: https://github.com/wasmagents/claude-commands/issues
- Discussions: https://github.com/wasmagents/claude-commands/discussions

## Changelog

### v1.0.0 (2025-11-14)
- Initial release
- Added /checkpoint command for session management
- Automated installer script
- Comprehensive documentation

## Roadmap

Future commands under consideration:
- /review - Code review checklist generator
- /test - Test coverage analyzer and gap identifier
- /deploy - Deployment readiness checker
- /audit - Security audit command
- /docs - Documentation generator

## Related Projects

- Claude Code: https://claude.com/claude-code
- Claude Code Documentation: https://docs.claude.com/en/docs/claude-code

## Authors

Created by the Wasmagents team for the Claude Code community.
