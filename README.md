# Claude Code Setup

My personal portable Claude Code configuration - general-purpose agents, commands, and settings that adapt to any project.

## What's Inside

### Agents (`/.claude/agents/`)
```
explorer    - Autonomous codebase exploration and analysis
planner     - Strategic planning with flexible execution
implementer - End-to-end implementation with quality assurance
verifier    - Comprehensive testing and validation
librarian   - Documentation and knowledge management
```

All agents are **language-agnostic** and follow the **Boris approach**: flexible, autonomous, and pragmatic.

### Commands (`/.claude/commands/`)

**commit-push-pr** - One command to commit, push, and create PR

## Quick Start (Per Project)

### One-Shot Setup (Recommended)

```bash
# In your project directory
cd ~/my-project

# Run the one-shot setup (installs agents + runs claude init)
bash <(curl -s https://raw.githubusercontent.com/fsrodriguezm/agent-pack/main/setup.sh)

# Or if you've cloned the repo locally:
~/agent-pack/setup.sh

# Then tell Claude: "Customize CLAUDE.md for this React/Python/Go project"
```

### Manual Setup

```bash
# In your project directory
cd ~/my-project

# Install agents and commands
~/agent-pack/install.sh

# Initialize project-specific CLAUDE.md
claude init

# Customize for your project
# Tell Claude: "Customize CLAUDE.md for this React/Python/Go project"
```

## How It Works

1. **General Agents** - Work with any language/framework
2. **CLAUDE.md** - Project-specific instructions (created by `claude init`)
3. **Agents read CLAUDE.md** - They adapt to your project context

### Example

```bash
# React project
cd ~/my-react-app
~/claude-setup/install.sh
claude init
# Claude customizes CLAUDE.md with React/TypeScript conventions

# Python project
cd ~/my-python-api
~/claude-setup/install.sh
claude init
# Claude customizes CLAUDE.md with Python/FastAPI conventions
```

Same agents, different context = project-specific behavior!

## 📝 Per-Project Workflow

1. **Install**: Copy `.claude/` into your project
2. **Init**: Run `claude init` to create `CLAUDE.md`
3. **Customize**: Tell Claude to adapt `CLAUDE.md` to your stack
4. **Work**: Agents now understand your project's patterns
5. **Commit**: The `.claude/` directory is now part of your project repo

## 🔄 Updating Your Setup

```bash
# Update the base setup
cd ~/claude-setup
# Make changes to .claude/agents/ or .claude/commands/
git add .
git commit -m "Update agents"
git push

# Apply to existing projects
cd ~/my-project
cp -r ~/claude-setup/.claude .
# Review and commit the changes
```

## Customization

### Project-Specific Agents

If a project needs special agents, add them to that project's `.claude/agents/`:

```bash
cd ~/my-project
# Your general agents are in .claude/agents/
# Add project-specific ones:
touch .claude/agents/project-specific-agent.md
```

### Project-Specific Commands

```bash
cd ~/my-project
touch .claude/commands/project-deploy.md
```

## Philosophy

- **General-purpose base** - Agents work with any language
- **CLAUDE.md for specifics** - Project context in version control
- **Flexible & autonomous** - No strict workflows
- **Portable** - Clone once, use everywhere
- **Per-project** - Each repo gets its own `.claude/` setup
