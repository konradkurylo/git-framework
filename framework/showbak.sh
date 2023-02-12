FILE_TO_DIF=$(git diff --name-only | sed -n $1p)
git diff $FILE_TO_DIF;
konrad.kurylo@POL-E20012 bin % cat showbak
OUTPUT=$(git log --oneline $(git branch --show-current)-backup)
for INDEX in {1..10}
do
    echo "$OUTPUT" | sed -n $INDEX'p' | sed -e "s/^/$INDEX\t/"
done
echo
OUTPUT=$(git log --oneline $(git branch --show-current))
for INDEX in {1..10}
do
    echo "$OUTPUT" | sed -n $INDEX'p' | sed -e "s/^/$INDEX\t/"
done