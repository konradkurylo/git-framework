FILE_TO_DIF=$(git diff --cached --name-only | sed -n $1p)
shift
git reset $FILE_TO_DIF $@;