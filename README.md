# Claude Commands

A curated collection of slash commands, task definitions, and agent configurations for Claude Code to boost productivity and standardize workflows.

## Overview

Claude Code evolves rapidly with new features like slash commands, task agents, and skill integrations. This repository serves as a centralized library of useful commands, task definitions, and agent configurations that can be installed into any project.

**Purpose:**
- Collect and share proven Claude Code patterns
- Standardize workflows across projects
- Track useful commands as Claude Code evolves
- Provide ready-to-use automation for common tasks

## Available Commands

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

**Status:** Production-ready

---

### Future Commands

The following commands are planned for future releases:

- `/review` - Generate code review checklists based on project patterns
- `/test` - Analyze test coverage and identify gaps
- `/deploy` - Pre-deployment readiness checker
- `/audit` - Security audit command for common vulnerabilities
- `/docs` - Auto-generate documentation from code
- `/refactor` - Refactoring suggestions and safety checks

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

2. **Create sessions directory** (for /checkpoint command):
   ```bash
   mkdir -p /path/to/your/project/sessions
   ```

3. **Update .gitignore:**
   ```bash
   echo "# Session checkpoints (local only, not committed)" >> /path/to/your/project/.gitignore
   echo "sessions/" >> /path/to/your/project/.gitignore
   ```

4. **Update GitHub Actions** (if applicable):

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

At the end of your session:

```
/checkpoint
```

Claude Code will automatically create `./sessions/claude-checkpoint-YYYYMMDD-HHMMSS.md` with complete session context.

### Resuming from a Checkpoint

In your next session:

```
I'm resuming from a previous session. Please read ./sessions/claude-checkpoint-YYYYMMDD-HHMMSS.md
```

Claude Code will read the checkpoint and understand exactly where you left off.

## Requirements

- Claude Code CLI (claude.ai/code)
- Git repository (for commands that use git integration)
- Bash shell (for installation script)

## Project Structure

```
claude-commands/
├── commands/                   # Slash command definitions
│   └── checkpoint.md          # Session checkpoint command
├── tasks/                      # Task definitions (future)
├── agents/                     # Agent configurations (future)
├── install.sh                  # Automated installer
├── README.md                   # This file
└── LICENSE                     # Apache-2.0 license
```

## Repository Philosophy

Claude Code is evolving rapidly with new features and capabilities. This repository aims to:

1. **Track Useful Patterns**: As Claude Code introduces new features (slash commands, task agents, skills), we collect and share proven patterns
2. **Reduce Duplication**: Common workflows shouldn't be reinvented for each project
3. **Enable Quick Setup**: New projects can install battle-tested commands instantly
4. **Community Knowledge**: Learn from what works across different teams and projects

## Contributing

Contributions are welcome! To add a new command, task, or agent:

1. Fork this repository
2. Create a new file in the appropriate directory:
   - `commands/` for slash commands
   - `tasks/` for task definitions
   - `agents/` for agent configurations
3. Update this README with documentation
4. Submit a pull request

### Command Guidelines

- Use clear, descriptive names
- Provide comprehensive instructions for Claude Code
- Include examples in documentation
- Test the command in a real project
- Follow existing command structure
- Document any dependencies or requirements

### Quality Standards

- No emojis or unnecessary symbols
- Clear, professional documentation
- Tested in production environments
- Follows Claude Code best practices

## Benefits

### Before Claude Commands
- Manual checkpoint creation (tedious and error-prone)
- Reinventing workflows for each project
- Lost context between sessions
- No standardization across teams

### After Claude Commands
- One command installs all productivity tools
- Proven patterns from real projects
- Instant context restoration
- Team-wide standardization
- Community-contributed improvements

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
- GitHub Actions for Discord notifications

## Roadmap

### Short Term (Q1 2025)
- Add /review command for code review checklists
- Add /test command for coverage analysis
- Create task definitions library
- Document agent configuration patterns

### Medium Term (Q2 2025)
- Add /deploy readiness checker
- Add /audit security scanner
- Create agent marketplace
- Integration examples with popular frameworks

### Long Term (Future)
- Visual command builder
- Command dependency management
- Project-specific command customization
- Team command sharing platform

## Related Projects

- Claude Code: https://claude.com/claude-code
- Claude Code Documentation: https://docs.claude.com/en/docs/claude-code

## About

Created by the Wasmagents team to standardize Claude Code workflows and share productivity tools across projects.

This repository grows with Claude Code as new features are released. Check back regularly for new commands and patterns.

