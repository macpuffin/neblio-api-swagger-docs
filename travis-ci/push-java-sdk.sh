#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying Java API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/java-repo # this key should have push access
ssh-add $DIR/java-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-java.git
cd neblio-api-lib-java

echo "Copying files..."
rm -rf docs src/main
cp -r ../swagger-out/java/docs .
cp -r ../swagger-out/java/src/main ./src/
rm -f ./src/main/AndroidManifest.xml
cp ../swagger-out/java/build.gradle .
cp ../swagger-out/java/build.sbt .
cp ../swagger-out/java/gradle.properties .
cp ../swagger-out/java/pom.xml .
cp ../swagger-out/java/settings.gradle .
cp ../swagger-out/java/README.md .

git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
