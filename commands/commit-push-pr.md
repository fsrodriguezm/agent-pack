---
name: commit-push-pr
description: Create a commit, push to remote, and open a pull request in one command
---

Execute the following workflow to commit changes, push to remote, and create a pull request:

1. **Review Changes**:
   - Run `git status` to see all modified and untracked files
   - Run `git diff` to see the specific changes
   - Identify the scope and purpose of the changes

2. **Create Commit**:
   - Stage the relevant files using `git add <files>` (be specific, avoid `git add .`)
   - Never stage sensitive files (.env, credentials, secrets)
   - Create a commit with a clear, descriptive message following the format:
     ```
     <type>: <short description>

     <optional longer description if needed>

     Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
     ```
   - Common types: feat, fix, refactor, docs, test, chore
   - Use imperative mood ("add feature" not "added feature")

3. **Push to Remote**:
   - Check if current branch is tracking a remote branch
   - If not, push with `-u` flag: `git push -u origin <branch-name>`
   - If already tracking, just `git push`
   - Verify the push succeeded

4. **Create Pull Request**:
   - Use `gh pr create` with appropriate flags
   - Title should be concise (under 70 characters)
   - Body should include:
     - ## Summary section with 1-3 bullet points describing changes
     - ## Test plan section with steps to verify the changes
     - Footer: "🤖 Generated with [Claude Code](https://claude.com/claude-code)"
   - Format using heredoc:
     ```bash
     gh pr create --title "title" --body "$(cat <<'EOF'
     ## Summary
     - Change 1
     - Change 2

     ## Test plan
     - [ ] Test step 1
     - [ ] Test step 2

     🤖 Generated with [Claude Code](https://claude.com/claude-code)
     EOF
     )"
     ```

5. **Confirm Success**:
   - Display the PR URL
   - Confirm all steps completed successfully

**Important Notes**:
- Always review changes before committing
- Never commit sensitive files
- Ensure commit messages are clear and descriptive
- Follow the project's commit message conventions
- Verify tests pass before creating PR (run verify-app agent if needed)
