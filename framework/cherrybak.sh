NUMBER_REGEXP='^[+-]?[0-9]+$'
if [[ $# -eq 0 || ! $1 =~ $NUMBER_REGEXP ]] ; then
  echo "please provide an integer argument"
else
  git log --oneline  $(git branch --show-current)-backup | sed -n $1p | awk '{print $1}' | xargs git cherry-pick
fi
echo
showbak