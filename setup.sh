#!/bin/bash

set -e

echo "🚀 Agent Pack - One-Shot Setup"
echo "================================"
echo ""

# Get the directory where this script lives
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

# Step 1: Install agents and commands
echo "📦 Step 1: Installing agents and commands..."
"$SCRIPT_DIR/install.sh"

echo ""
echo "📝 Step 2: Initializing Claude Code..."
claude init

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Tell Claude: 'Customize CLAUDE.md for this [language/framework] project'"
echo "  2. (Optional) Customize .claude/settings.local.json for project-specific permissions"
echo ""
echo "Happy coding! 🎉"
