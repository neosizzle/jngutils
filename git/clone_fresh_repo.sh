# Clones a fresh repo in a directory
read -e -p "Clone destination: " CLONE_DEST

read -p "Clone repository: " CLONE_REPO

CLONE_DEST_EVALED=$(eval echo -e "$CLONE_DEST")
git clone $CLONE_REPO $CLONE_DEST_EVALED