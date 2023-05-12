#!/bin/bash
# created by jngutils

MSG="fisadsad123"
#  [[ $MSG != "ci: "* ]] && [[ $MSG != "chore: "* ]] && [[ $MSG != "docs: "* ]] \
# && [[ $MSG != "fix: "* ]] && [[ $MSG != "perf: "* ]] && [[ $MSG != "refactor: "* ]] && [[ $MSG != "revert: "* ]] && [[ $MSG != "style: "* ]] && [[ $MSG == "test: "* ]] \
echo $MSG
if [[ $MSG != "feat: "* ]] &&  [[ $MSG != "chore: "* ]] && [[ $MSG != "ci: "* ]] && [[ $MSG != "chore: "* ]] && [[ $MSG != "docs: "* ]] && [[ $MSG != "fix: "* ]] && [[ $MSG != "perf: "* ]] &&
[[ $MSG != "refactor: "* ]] && [[ $MSG != "revert: "* ]] && [[ $MSG != "style: "* ]] && [[ $MSG != "test: "* ]] ;
        then
                echo "Your commit message type must be one of [build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test]"
                echo "Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint" 
                exit 1
fi

echo $MSG
