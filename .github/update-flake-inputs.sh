#!/usr/bin/env bash
set -euo pipefail

# Get the base branch (current branch or default to master in CI)
BASE_BRANCH=$(git branch --show-current || echo "master")

# Get all flake inputs
INPUTS=$(nix flake metadata --json | jq -r '.locks.nodes | keys[]' | grep -v root | sort)

echo "Found the following inputs to update:"
echo "$INPUTS"
echo

for input in $INPUTS; do
	echo "=== Updating $input ==="

	# Create a new branch
	branch_name="update-$input"
	git checkout -b "$branch_name" "$BASE_BRANCH"

	# Update the specific input
	echo "Running: nix flake lock --update-input $input"
	if nix flake lock --update-input "$input" --log-format bar-with-logs; then
		# Check if there are changes
		if git diff --quiet flake.lock; then
			echo "No changes for $input, skipping..."
			git checkout "$BASE_BRANCH"
			git branch -D "$branch_name"
			continue
		fi

		# Get the changes for the commit message
		changes=$(git diff flake.lock | grep -E "^\+" | grep -E "(lastModified|narHash|rev)" | head -20)

		# Commit the changes
		git add flake.lock
		git commit -m "flake: update $input"

		# Push the branch (force push in case branch already exists)
		echo "Pushing branch $branch_name..."
		git push -f -u origin "$branch_name"

		# Wait a moment for GitHub to process the push
		sleep 2

		# Create the pull request (check if one already exists first)
		echo "Creating pull request for $input..."
		existing_pr=$(gh pr list --base master --head "$branch_name" --json number --jq '.[0].number' || echo "")

		if [ -n "$existing_pr" ]; then
			echo "Pull request #$existing_pr already exists for $input, skipping creation"
		else
			gh pr create \
				--title "flake: update $input" \
				--body "$(
					cat <<EOF
## Summary
- Updates the $input flake input to the latest version

## Changes
\`\`\`diff
$changes
\`\`\`
EOF
				)" \
				--base "master" \
				--label "dependencies"

			echo "Pull request created for $input"
		fi
	else
		echo "Failed to update $input, skipping..."
		git checkout "$BASE_BRANCH"
		git branch -D "$branch_name"
		continue
	fi

	# Go back to base branch
	git checkout "$BASE_BRANCH"
	echo
done

echo "All updates completed!"
echo "You can view all pull requests with: gh pr list"
