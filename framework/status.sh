RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'
STAGED=$(git diff --cached --name-status)
UNSTAGED=$(git diff --name-status)
UNTRACKED=$(git status --porcelain | grep "^?? " | sed -e 's/^[?]* //')
PREFIX=$(git status | sed -n 2p)

echo "BRANCH:\t$(git branch --show-current)\t$PREFIX"
echo "STAGED:"

if [[ $STAGED ]] ; then
	STAGED_FORMATTED=$(echo "$STAGED" | sed -e 's/^/\t/')
	echo "${GREEN}$STAGED_FORMATTED${NO_COLOR}"
else
	echo "\t(empty)"
fi

echo "UNSTAGED:"

if [[ $UNSTAGED ]] ; then
        UNSTAGED_FORMATTED=$(echo "$UNSTAGED" | sed -e 's/^/\t/')
        echo "${RED}$UNSTAGED_FORMATTED${NO_COLOR}"
else
        echo "\t(empty)"
fi

echo "UNTRACKED:"
if [[ $UNTRACKED ]] ; then
        UNTRACKED_FORMATTED=$(echo "$UNTRACKED" | sed -e 's/^/\tU\t/')
        echo "${RED}$UNTRACKED_FORMATTED${NO_COLOR}"
else
        echo "\t(empty)"
fi