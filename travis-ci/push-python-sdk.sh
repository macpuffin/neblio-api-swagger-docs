#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying Python API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/python-repo # this key should have push access
ssh-add $DIR/python-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-python.git
cd neblio-api-lib-python

echo "Copying files..."
rm -rf docs neblio-api
cp -r ../swagger-out/python/docs .
cp -r ../swagger-out/python/neblio-api .
cp -r ../swagger-out/python/test .
cp ../swagger-out/python/requirements.txt .
cp ../swagger-out/python/test-requirements.txt .
cp ../swagger-out/python/setup.py .
cp ../swagger-out/python/tox.ini .
cp ../swagger-out/python/README.md .
cp ../swagger-out/python/.travis.yml .

git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
