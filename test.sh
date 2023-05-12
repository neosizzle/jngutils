#!/bin/bash
# created by jngutils

MSG="chore: 123"
#  [ $MSG != "ci:*" ] && [ $MSG != "chore:*" ] && [ $MSG != "docs:*" ] \
# && [ $MSG != "fix:*" ] && [ $MSG != "perf:*" ] && [ $MSG != "refactor:*" ] && [ $MSG != "revert:*" ] && [ $MSG != "style:*" ] && [ $MSG == "test:*" ] \

if [ $MSG != "feat:*" ] && [ $MSG != "chore:*" ] ;
        then
                echo "Your commit message type must be one of [build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test]"
                echo "Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint" 
                exit 1
fi