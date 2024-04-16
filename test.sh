#!/bin/bash

# Get the latest tag
latest_tag=$(git describe --tags --abbrev=0)

# Get list of commits since the latest tag
commit_messages=$(git log ${latest_tag}..HEAD --pretty=format:"%h - %s (%an, %ad)" --date=short)

# Check if there are any commits
if [ -z "$commit_messages" ]; then
  echo "No new commits since last tag."
  exit 0
fi

# Update the CHANGELOG.md file
echo "## Changelog since $latest_tag" >> CHANGELOG.md
echo "" >> CHANGELOG.md
echo "$commit_messages" >> CHANGELOG.md
echo "" >> CHANGELOG.md

echo "Changelog updated."
