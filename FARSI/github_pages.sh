#!/bin/bash

mdbook build
mv book /tmp
cd ..
git checkout gh-pages
mv /tmp/book/* .
git add -A
git commit -m "Update book"
git push origin gh-pages
git checkout master
cd FARSI || exit
mdbook clean
