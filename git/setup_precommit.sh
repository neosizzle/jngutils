# Sets up pre-commit git hooks on specified directory

read -e -p "Local Repository Path: " REPO_PATH
REPO_PATH_GIT="$REPO_PATH.git"

[ ! -d "$REPO_PATH_GIT" ] && echo "Directory $REPO_PATH_GIT Does not exist." && exit

cat > "$REPO_PATH_GIT/hooks/commit-msg" << "EOF"

#!/bin/bash
# created by jngutils

# MSG="$2"

# echo "msg is $MSG"
# if [[ $MSG == "hello" ]] ;
# 	then
# 		echo "Your commit message must contain the word 'updated'"
# 		exit 1
# fi
echo hello
EOF

chmod 711 "$REPO_PATH_GIT/hooks/commit-msg"
echo "Commit messages set to follow https://commitlint.js.org/" 
