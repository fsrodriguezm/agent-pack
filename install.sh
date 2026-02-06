#!/bin/bash

set -e

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

echo "🚀 Installing Claude Code setup for this project..."

# Get the directory where this script lives
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create .claude directory
mkdir -p .claude

# Copy agents and commands
echo "📦 Copying agents and commands..."
cp -rv "$SCRIPT_DIR/agents" .claude/
cp -rv "$SCRIPT_DIR/commands" .claude/

# Copy other files
if [ -f "$SCRIPT_DIR/settings.local.json.example" ]; then
    cp -v "$SCRIPT_DIR/settings.local.json.example" .claude/
fi

if [ -f "$SCRIPT_DIR/verify.sh" ]; then
    cp -v "$SCRIPT_DIR/verify.sh" .claude/
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Run: claude init"
echo "  2. Tell Claude: 'Customize CLAUDE.md for this [language/framework] project'"
echo "  3. (Optional) Copy .claude/settings.local.json.example to settings.local.json and customize"
echo "  4. Your general agents will now understand this project's context!"
echo ""
echo "Your agents:"
echo "  🔍 explorer - Analyze and understand code"
echo "  📋 planner - Plan implementations"
echo "  🔨 implementer - Write code"
echo "  ✅ verifier - Test and validate"
echo "  📚 librarian - Document and log"
echo ""
echo "Commands:"
echo "  /commit-push-pr - Commit, push, and create PR"
