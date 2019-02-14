#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying Javascript API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/javascript-repo # this key should have push access
ssh-add $DIR/javascript-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-js.git
cd neblio-api-lib-js

echo "Copying files..."
rm -rf docs src test
cp -r ../swagger-out/docs .
cp -r ../swagger-out/src .
cp -r ../swagger-out/test .
cp ../swagger-out/package.json .
cp ../swagger-out/mocha.opts .
cp ../swagger-out/python/README.md .
cp ../swagger-out/python/.travis.yml .

git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
