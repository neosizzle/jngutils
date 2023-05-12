# Sets up pre-commit git hooks on specified directory

read -e -p "Local Repository Path: " REPO_PATH
REPO_PATH_GIT="$REPO_PATH.git"

[ ! -d "$REPO_PATH_GIT" ] && echo "Directory $REPO_PATH_GIT Does not exist." && exit

cat > "$REPO_PATH_GIT/hooks/commit-msg" << "EOF"
#!/bin/bash
# created by jngutils

MSG="$(cat $1)"

if [ $MSG != "feat:*" ] && [ $MSG != "chore:*" ] ;
	then
		echo "Your commit message type must be one of [build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test]"
		echo "Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint" 
		exit 1
fi
EOF

chmod 711 "$REPO_PATH_GIT/hooks/commit-msg"
echo "Commit messages set to follow https://commitlint.js.org/" 
