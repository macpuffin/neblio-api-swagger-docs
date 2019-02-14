#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying CSharp API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/csharp-repo # this key should have push access
ssh-add $DIR/csharp-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-csharp.git
cd neblio-api-lib-csharp

echo "Copying files..."
rm -rf docs src/Neblio.API
cp -r ../swagger-out/csharp/docs .
cp -r ../swagger-out/csharp/src/Neblio.API ./src/Neblio.API
cp ../swagger-out/csharp/.travis.yml .
cp ../swagger-out/csharp/.gitignore .
cp ../swagger-out/csharp/README.md .
cp ../swagger-out/csharp/Neblio.API.sln .
cp ../swagger-out/csharp/build.sh .
cp ../swagger-out/csharp/mono_nunit_test.sh .

git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
