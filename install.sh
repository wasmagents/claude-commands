#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PROJECT_DIR="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}Claude Code Commands Installer${NC}"
echo -e "${BLUE}==============================${NC}"
echo ""

# Check if project directory exists
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${YELLOW}Error: Project directory '$PROJECT_DIR' does not exist${NC}"
    echo "Usage: ./install.sh [project-directory]"
    exit 1
fi

cd "$PROJECT_DIR"
echo -e "${GREEN}Installing to: $(pwd)${NC}"
echo ""

# Step 1: Create .claude/commands/ directory
echo -e "${BLUE}[1/5] Creating .claude/commands/ directory...${NC}"
mkdir -p .claude/commands
echo -e "${GREEN}Created .claude/commands/${NC}"

# Step 2: Copy commands
echo -e "${BLUE}[2/5] Installing commands...${NC}"
for cmd in "$SCRIPT_DIR/commands"/*.md; do
    if [ -f "$cmd" ]; then
        cmd_name=$(basename "$cmd")
        cp "$cmd" .claude/commands/
        echo -e "${GREEN}  Installed: $cmd_name${NC}"
    fi
done

# Step 3: Create sessions directory
echo -e "${BLUE}[3/5] Creating sessions/ directory...${NC}"
mkdir -p sessions
echo -e "${GREEN}Created sessions/${NC}"

# Step 4: Add sessions/ to .gitignore
echo -e "${BLUE}[4/5] Updating .gitignore...${NC}"
if [ -f .gitignore ]; then
    if ! grep -q "^sessions/" .gitignore; then
        echo "" >> .gitignore
        echo "# Session checkpoints (local only, not committed)" >> .gitignore
        echo "sessions/" >> .gitignore
        echo -e "${GREEN}  Added sessions/ to .gitignore${NC}"
    else
        echo -e "${YELLOW}  sessions/ already in .gitignore${NC}"
    fi
else
    echo "# Session checkpoints (local only, not committed)" > .gitignore
    echo "sessions/" >> .gitignore
    echo -e "${GREEN}  Created .gitignore with sessions/${NC}"
fi

# Step 5: Update GitHub Actions workflows
echo -e "${BLUE}[5/5] Checking GitHub Actions workflows...${NC}"
if [ -d .github/workflows ]; then
    workflow_updated=false
    for workflow in .github/workflows/*.yml .github/workflows/*.yaml; do
        if [ -f "$workflow" ]; then
            # Check if workflow has paths-ignore section
            if grep -q "paths-ignore:" "$workflow"; then
                # Check if sessions/** is already in paths-ignore
                if ! grep -A 10 "paths-ignore:" "$workflow" | grep -q "sessions/\*\*"; then
                    # Add sessions/** to paths-ignore section
                    # This is a simple approach - may need manual review
                    echo -e "${YELLOW}  Found workflow: $(basename "$workflow")${NC}"
                    echo -e "${YELLOW}  Please manually add 'sessions/**' to paths-ignore section${NC}"
                    workflow_updated=true
                fi
            fi
        fi
    done

    if [ "$workflow_updated" = false ]; then
        echo -e "${YELLOW}  No workflows updated (may already be configured or no paths-ignore found)${NC}"
        echo -e "${YELLOW}  If you have GitHub Actions, manually add 'sessions/**' to paths-ignore${NC}"
    fi
else
    echo -e "${YELLOW}  No .github/workflows/ directory found${NC}"
fi

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo -e "${BLUE}Installed Commands:${NC}"
for cmd in .claude/commands/*.md; do
    if [ -f "$cmd" ]; then
        cmd_name=$(basename "$cmd" .md)
        echo -e "  /${cmd_name}"
    fi
done
echo ""
echo -e "${BLUE}Next Steps:${NC}"
echo "1. Review .gitignore to confirm sessions/ is ignored"
echo "2. If you use GitHub Actions, manually add 'sessions/**' to paths-ignore"
echo "3. Reload Claude Code to enable new commands"
echo "4. Run /checkpoint at end of session to create checkpoint file"
echo ""
echo -e "${GREEN}For more information, see: https://github.com/wasmagents/claude-commands${NC}"
