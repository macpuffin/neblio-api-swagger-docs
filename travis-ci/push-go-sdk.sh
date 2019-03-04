#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying Go API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/go-repo # this key should have push access
ssh-add $DIR/go-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-go.git
cd neblio-api-lib-go

echo "Copying files..."
rm -rf docs *.go
cp -r ../swagger-out/go/docs .
cp ../swagger-out/go/*.go .
cp ../swagger-out/go/.travis.yml .
cp ../swagger-out/go/.gitignore .
cp ../swagger-out/go/README.md .

git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
