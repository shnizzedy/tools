git checkout master
git ls-files > keep-these.txt
git filter-branch --force --index-filter \
"git rm  --ignore-unmatch --cached -qr . ; \
cat $PWD/keep-these.txt | xargs git reset -q \$GIT_COMMIT --" \
--prune-empty --tag-name-filter cat -- --all