#!/bin/bash
site_url=https://www.hymex.fr/liaise/
rm -f www.hymex.fr/liaise/index.html # this way it checks all the child links, otherwise, if index.html doesn't change, the other links are not checked for changes.
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent http://example.org $site_url 
git add *.html
git commit -m "website update"

