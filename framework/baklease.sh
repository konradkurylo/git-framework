git branch -d $(git branch --show-current)-backup --force
git checkout -b $(git branch --show-current)-backup
git push --set-upstream origin $(git branch --show-current) --force-with-lease
git branch --show-current | sed 's/\-backup//g' | xargs git checkout