FILE_TO_ABORT=$(git diff --name-only | sed -n $1p)
git checkout $FILE_TO_ABORT;