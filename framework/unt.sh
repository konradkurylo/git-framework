FILE_TO_DIF=$(git status --porcelain | grep "^?? " | sed -e 's/^[?]* //' | sed -n $1p)
shift
cat $FILE_TO_DIF $@;