#!/bin/bash
# author: AD7six
# This code is excerpted from a work (https://stackoverflow.com/a/17902870/7868821) licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
git ls-files > keep-these.txt
git filter-branch --force --index-filter \
"git rm  --ignore-unmatch --cached -qr . ; \
cat $PWD/keep-these.txt | xargs git reset -q \$GIT_COMMIT --" \
--prune-empty --tag-name-filter cat -- --all