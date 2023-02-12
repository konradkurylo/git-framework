NUMBER_REGEXP='^[+-]?[0-9]+$'
if [[ $# -eq 0 || ! $1 =~ $NUMBER_REGEXP ]] ; then
  echo "please provide an integer argument"
else
  declare -i NUMBER_OF_FILES=$(git diff --name-only | wc -l)
  declare -i PROVIDED_NUMBER_RAW=$1
  declare -i PROVIDED_NUMBER_ABSOLUTE=${PROVIDED_NUMBER_RAW#-}
  if [[ $1 -eq 0 || $PROVIDED_NUMBER_ABSOLUTE -gt $NUMBER_OF_FILES ]] ; then
    echo "please provide a number of file from 1 to $NUMBER_OF_FILES"
  else
    if [[ $1 -lt 0  ]] ; then
      declare -i NUMBER_COUNTED_FROM_THE_TOP=$NUMBER_OF_FILES-$PROVIDED_NUMBER_ABSOLUTE+1
      FILE_TO_DIFF=$(git diff --name-only | sed -n $NUMBER_COUNTED_FROM_THE_TOP'p')
      echo $FILE_TO_DIFF
      shift
      git add $FILE_TO_DIFF -p $@;
    else
      FILE_TO_DIF=$(git diff --name-only | sed -n $1'p')
      shift
      git add $FILE_TO_DIF -p $@;
    fi
  fi
fi