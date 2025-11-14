# Session Checkpoint Command

Generate a comprehensive session checkpoint file for seamless session handoff.

## Instructions for Claude Code

When this command is executed, create a detailed checkpoint file in `./sessions/claude-checkpoint-YYYYMMDD-HHMMSS.md` with the following:

### 1. Auto-Gather Session Context

**Git Information**:
- Run `git branch --show-current` to get current branch
- Run `git status --porcelain` to show uncommitted changes
- Run `git log -5 --oneline --decorate` to show recent commits
- Run `git log --since="24 hours ago" --pretty=format:"%h - %s (%an, %ar)" --no-merges` to show today's work

**File Changes**:
- List all modified files from git status
- Note any new files created
- Identify deleted files
- Check for files in docs/ that were updated

**Background Processes**:
- List any running background bash shells (if visible in session)
- Note any dev servers, builds, or tests running
- Include process IDs if available

**Project State**:
- Current working directory
- Any environment variables relevant to development
- Running services (frontend dev, backend, docker, etc.)

### 2. Summarize Session Work

**What We Accomplished**:
- Summarize the primary tasks completed in this session
- List features implemented or bugs fixed
- Note any migrations created or database changes
- Identify API endpoints added or modified
- Document configuration changes

**Documents Created/Modified**:
- List all documentation files touched
- Include line numbers for significant changes
- Note any TODO files updated
- List any new markdown files in docs/ or project root

**Key Technical Decisions**:
- Architectural choices made
- Libraries or dependencies added
- Design patterns implemented
- Security considerations addressed

**Commits Made**:
- List all commits from this session
- Include commit hashes and full messages
- Note which commits are pushed vs local only
- Identify any commits that haven't been deployed

### 3. Current State Analysis

**What We're Working On**:
- Current task or feature in progress
- Any incomplete work or work-in-progress branches
- Blockers or issues encountered
- Next immediate steps

**Pending Tasks**:
- Review any TODO.md files
- Check for in-progress items
- Note any planned features not started yet
- List dependencies or prerequisites

**Testing Status**:
- Note test coverage status
- List any failing tests
- Identify tests that need to be written
- Check e2e test completion

### 4. Deployment and Infrastructure

**Deployment Status**:
- Check recent GitHub Actions runs
- Note deployment success/failure
- Identify any infrastructure changes
- List environment variables added/changed

**Build Status**:
- Current build state (success/failure)
- Docker image status
- Any build errors or warnings

### 5. Next Steps and Handoff

**Immediate Next Actions**:
- Exact commands to resume work
- Files to review or edit
- Tests to run
- Deployments to check

**Context for Next Session**:
- Why we made certain decisions
- What problems we solved and how
- Any technical debt incurred
- Known issues or workarounds in place

**How to Resume**:
- Branch to checkout
- Services to start
- Commands to verify state
- First task to tackle

### 6. Important File Locations

Document all important file locations with line numbers:
- Code files modified (e.g., `app/services/service.py:123-456`)
- Documentation files (e.g., `docs/REQUIREMENTS.md:1-460`)
- Configuration files (e.g., `.github/workflows/deploy.yml:7-14`)
- Test files (e.g., `tests/test_feature.py:1-350`)

## Output Format

Save the checkpoint to:
```
./sessions/claude-checkpoint-YYYYMMDD-HHMMSS.md
```

Use this exact template structure:

```markdown
# Claude Code Session Checkpoint - [DATE/TIME]

Last Updated: YYYY-MM-DD HH:MM:SS

## Project Context

**Project**: [Project Name]
**Working Directory**: [full path]
**Current Branch**: [branch name]
**Session Date**: [date]

## Current Git State

### Branch Information
[git branch output]

### Uncommitted Changes
[git status output]

### Recent Commits (Last 5)
[git log output]

### Today's Work (Last 24 Hours)
[commits from today with details]

## Session Summary

### What We Accomplished

[Detailed summary of work completed]

#### Features Implemented
- [Feature 1 with file locations]
- [Feature 2 with file locations]

#### Bugs Fixed
- [Bug 1 with file locations]
- [Bug 2 with file locations]

#### Database Changes
- [Migration files created]
- [Schema changes made]

#### API Changes
- [Endpoints added/modified]
- [Breaking changes if any]

### Documents Created/Modified

#### Documentation Files
- `path/to/file.md:line-numbers` - [description of changes]
- `path/to/file2.md:line-numbers` - [description of changes]

#### Code Files
- `path/to/code:line-numbers` - [description of changes]
- `path/to/code2:line-numbers` - [description of changes]

### Key Technical Decisions

#### Architectural Decisions
[Decision 1]: [Rationale]
[Decision 2]: [Rationale]

#### Dependencies Added
- [package name]: [reason]

#### Configuration Changes
- [config file]: [what changed and why]

### Commits Made This Session

```
[hash] - [commit message]
[hash] - [commit message]
```

**Push Status**:
- [X] commits pushed to remote
- [ ] X commits local only

**Deployment Status**:
- Last deploy: [success/failure]
- Deployed commits: [list]

## Current Work in Progress

### Active Task
[Description of what we're currently working on]

**Status**: [in-progress/blocked/pending]
**Files Involved**:
- `file1:lines` - [description]
- `file2:lines` - [description]

### Blockers and Issues

#### Blockers
1. [Blocker description]
   - Impact: [description]
   - Workaround: [if any]

#### Known Issues
1. [Issue description]
   - Location: `file:lines`
   - Workaround: [if any]
   - TODO: [how to fix]

## Testing Status

### Test Coverage
- Overall: X%
- Modified files: X%

### Test Files
- `tests/test_file` - [status: passing/failing/new]

### Tests Needed
- [ ] Test 1 description
- [ ] Test 2 description

## Deployment and Infrastructure

### GitHub Actions Status
- Last run: [success/failure]
- Run ID: [id]
- Deployment: [deployed/failed]

### Environment Changes
- Added: [env var] = [description]
- Modified: [env var] = [description]

### Infrastructure Updates
- [Any infrastructure changes]

## Background Processes Running

### Active Processes
- Process 1: [description, how to check status]
- Process 2: [description, how to check status]

### How to Clean Up
```bash
# Commands to stop background processes
```

## Next Steps

### Immediate Actions (Next 5 Minutes)
1. [Action 1 with exact commands]
2. [Action 2 with exact commands]

### Short Term (This Session/Today)
1. [Task 1]
2. [Task 2]

### Pending Tasks (TODO)
1. [Task 1 from TODO.md if exists]
2. [Task 2 from TODO.md if exists]

## How to Resume This Session

### 1. Verify Environment
```bash
cd [project directory]
git status
git branch --show-current
```

### 2. Start Services (if needed)
```bash
# List exact commands to start dev servers, etc.
```

### 3. Verify State
```bash
# Commands to check current state
```

### 4. Continue Work
- Branch: [branch name]
- File: [file to open]
- Line: [line number to check]
- Task: [exact next task]

## Important File Locations

### Code Files Modified
- `path/to/file:start-end` - [description]

### Documentation
- `path/to/doc:start-end` - [description]

### Tests
- `path/to/test:start-end` - [description]

### Configuration
- `path/to/config:start-end` - [description]

## Context and Rationale

### Why We Made These Decisions
[Detailed explanation of key decisions and their rationale]

### Problems Solved
1. [Problem]: [Solution approach]
2. [Problem]: [Solution approach]

### Technical Debt Created
1. [Debt description]: [Why it was necessary, how to fix later]

### Lessons Learned
- [Lesson 1]
- [Lesson 2]

## Session Metadata

- Start Time: [approximate]
- End Time: [current time]
- Duration: [approximate]
- Commits: [count]
- Files Changed: [count]
- Lines Added: [approximate from git]
- Lines Removed: [approximate from git]
```

## Final Steps

After creating the checkpoint file:
1. Inform the user of the exact filename created
2. Provide a one-line summary of the session
3. Confirm the checkpoint is ready for next session handoff
