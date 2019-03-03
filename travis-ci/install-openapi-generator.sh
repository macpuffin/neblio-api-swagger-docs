#!/bin/bash

SWAGGER_DIR=./openapi-generator
SWAGGER_PATCHES_DIR=`pwd`/travis-ci/swagger-codegen-patches
SWAGGER_CODEGEN_SHA=24df02a191220d4093655dd58bee55fd8e05eec1

# download from swagger-codegen from github
git clone https://github.com/openapitools/openapi-generator.git $SWAGGER_DIR
cd $SWAGGER_DIR
if [ -n "${SWAGGER_CODEGEN_SHA+1}" ]
then
    echo "Using openapi-generator version \`${SWAGGER_CODEGEN_SHA}\`."
    git checkout -f $SWAGGER_CODEGEN_SHA
    SWAGGER_CODEGEN_PATCH_FILE="$SWAGGER_PATCHES_DIR/$SWAGGER_CODEGEN_SHA.patch"
    if [ -f $SWAGGER_CODEGEN_PATCH_FILE ]
    then
        echo "Applying patch $SWAGGER_CODEGEN_PATCH_FILE"
        git apply $SWAGGER_CODEGEN_PATCH_FILE
    fi
else
    echo "Using lastest openapi-generator verion."
fi

# build
echo "Building openapi-generator cli..."
mvn -q clean package -Dmaven.test.skip=true

# set $SWAGGER_CMD
export SWAGGER_CMD="java -jar $SWAGGER_DIR/modules/openapi-generator-cli/target/openapi-generator-cli.jar"

cd ..

