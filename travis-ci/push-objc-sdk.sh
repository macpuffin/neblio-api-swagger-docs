#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying Objective-C API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/objc-repo # this key should have push access
ssh-add $DIR/objc-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-objective-c.git
cd neblio-api-lib-objective-c

echo "Copying files..."
rm -rf docs NeblioAPI
cp -r ../swagger-out/objc/docs .
cp -r ../swagger-out/objec/NeblioAPI .
cp ../swagger-out/objc/NeblioAPI.podspec .
cp ../swagger-out/objc/README.md .
#cp ../swagger-out/objc/.travis.yml .
cp ../swagger-out/objc/.gitignore .


git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
