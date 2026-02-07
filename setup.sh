#!/bin/bash

set -e

REPO_URL="https://raw.githubusercontent.com/fsrodriguezm/agent-pack/main"

echo "🚀 Agent Pack - One-Shot Setup"
echo "================================"
echo ""

# Check if we're in a project root
if [ ! -d ".git" ] && [ ! -f "package.json" ] && [ ! -f "pyproject.toml" ] && [ ! -f "go.mod" ]; then
    echo "⚠️  Warning: This doesn't look like a project root directory."
    echo "   Make sure you're in the right place!"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create .claude directory
echo "📦 Creating .claude directory..."
mkdir -p .claude/agents
mkdir -p .claude/commands

# Download agents
echo "📦 Downloading agents..."
curl -sS "$REPO_URL/agents/explorer.md" -o .claude/agents/explorer.md
curl -sS "$REPO_URL/agents/implementer.md" -o .claude/agents/implementer.md
curl -sS "$REPO_URL/agents/librarian.md" -o .claude/agents/librarian.md
curl -sS "$REPO_URL/agents/planner.md" -o .claude/agents/planner.md
curl -sS "$REPO_URL/agents/verifier.md" -o .claude/agents/verifier.md

# Download commands
echo "📦 Downloading commands..."
curl -sS "$REPO_URL/commands/commit-push-pr.md" -o .claude/commands/commit-push-pr.md

# Download other files
echo "📦 Downloading configuration files..."
curl -sS "$REPO_URL/settings.local.json.example" -o .claude/settings.local.json.example
curl -sS "$REPO_URL/verify.sh" -o .claude/verify.sh
chmod +x .claude/verify.sh

echo ""
echo "✅ Files installed successfully!"
echo ""

# Check if we're already in a Claude session
if [ -n "$CLAUDE_SESSION_ID" ] || [ -n "$CLAUDE_CONVERSATION_ID" ]; then
    echo "📝 Detected you're in a Claude session."
    echo "   Tell Claude: 'Run claude init and customize CLAUDE.md for this [language/framework] project'"
else
    echo "📝 Step 2: Initializing Claude Code..."

    # Check if claude command exists
    if ! command -v claude &> /dev/null; then
        echo "⚠️  Claude CLI not found. Please install it first:"
        echo "   npm install -g @anthropic-ai/claude-code"
        exit 1
    fi

    claude init

    echo ""
    echo "Next steps:"
    echo "  1. Tell Claude: 'Customize CLAUDE.md for this [language/framework] project'"
    echo "  2. (Optional) Customize .claude/settings.local.json for project-specific permissions"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Your agents:"
echo "  - explorer: Analyze and understand code"
echo "  - planner: Plan implementations"
echo "  - implementer: Write code"
echo "  - verifier: Test and validate"
echo "  - librarian: Document and log"
echo ""
echo "Commands:"
echo "  - /commit-push-pr: Commit, push, and create PR"
