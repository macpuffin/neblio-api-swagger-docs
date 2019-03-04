#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying PHP API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/php-repo # this key should have push access
ssh-add $DIR/php-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-php.git
cd neblio-api-lib-php

echo "Copying files..."
rm -rf docs lib
cp -r ../swagger-out/php/docs .
cp -r ../swagger-out/php/lib .
cp ../swagger-out/php/composer.json .
cp ../swagger-out/php/README.md .
cp ../swagger-out/php/.travis.yml .


git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
