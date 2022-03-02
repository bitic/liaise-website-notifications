#!/bin/bash
# this script mirrors the website and commits any changes to github
site_url=https://www.hymex.fr/liaise/
indexfile=www.hymex.fr/liaise/index.html
mv $indexfile $indexfile.old # this way it checks all the child links, otherwise, if index.html doesn't change, the other links are not checked for changes.
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent $site_url 
if [ ! -e "$indexfile" ]; then # if there is no index, (wget has failed du to a network problem)
	mv $indexfile.old $indexfile
else
	rm -f $indexfile.old
fi
git add *.html
git commit -m "website update"
git push origin master

