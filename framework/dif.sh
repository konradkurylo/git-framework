FILE_TO_DIF=$(git diff --name-only | sed -n $1p)
git diff $FILE_TO_DIF;