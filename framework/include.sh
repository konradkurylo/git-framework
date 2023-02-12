FILE_TO_DIF=$(git status --porcelain | grep "^?? " | sed -e 's/^[?]* //' | sed -n "$1"'p')
shift
git add "$FILE_TO_DIF";