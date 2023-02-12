RESULT=$(git diff $(git branch --show-current) $(git branch --show-current)-backup --numstat)
if [ $RESULT ] ; then
  echo "$RESULT"
else
  echo "Cherry-pick process completed, branches are identical"
fi