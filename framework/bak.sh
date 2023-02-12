git checkout -b $(git branch --show-current)-backup
git push --set-upstream origin $(git branch --show-current)
git branch --show-current | sed 's/\-backup//g' | xargs git checkout