MSG="zasdd"

if [[ $MSG == z* ]] ;
	then
		echo "Your commit message must contain the word 'updated'"
		exit 1
fi