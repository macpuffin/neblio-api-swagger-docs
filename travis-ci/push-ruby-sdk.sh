#!/bin/bash

set -e

DIR=$(dirname "$0")

echo "Deploying Ruby API lib..."

eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 $DIR/ruby-repo # this key should have push access
ssh-add $DIR/ruby-repo

git clone git@github.com:NeblioTeam/neblio-api-lib-ruby.git
cd neblio-api-lib-ruby

echo "Copying files..."
rm -rf docs lib
cp -r ../swagger-out/ruby/docs .
cp -r ../swagger-out/ruby/lib .
cp ../swagger-out/ruby/.rspec .
cp ../swagger-out/ruby/Gemfile .
cp ../swagger-out/ruby/Rakefile .
cp ../swagger-out/ruby/README.md .
cp ../swagger-out/ruby/neblio_api.gemspec .
cp ../swagger-out/ruby/.gitignore .


git add --all .
git commit -m "From neblio-api-specification: ${TRAVIS_COMMIT_MESSAGE}"
git push -u origin master
