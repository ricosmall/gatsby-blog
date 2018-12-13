#/usr/bin/env sh

gatsby build

cd public

git init

git add .

git commit -m "Update docs"

git push --force git@github.com:ricosmall/ricosmall.github.io.git master:master