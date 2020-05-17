APIs for Interacting with NTP1 Tokens & The MacPuffins Blockchain [![Build Status](https://travis-ci.org/macpuffin/macpuffins-api-swagger-docs.svg?branch=master)](https://travis-ci.org/macpuffin/macpuffins-api-swagger-docs)
=============================

This is the project that _generates_ API clients for connecting to the public MacPuffins API. You can also use one of the clients that are pre-built in a language of your choice:

* [Python](https://github.com/macpuffin/macpuffins-api-lib-python)
* [JavaScript](https://github.com/macpuffin/macpuffins-api-lib-js)
* [Java](https://github.com/macpuffin/macpuffins-api-lib-java)
* [C#](https://github.com/macpuffin/macpuffins-api-lib-csharp)
* [Ruby](https://github.com/macpuffin/macpuffins-api-lib-ruby)
* [PHP](https://github.com/macpuffin/macpuffins-api-lib-php)
* [Obj-C](https://github.com/macpuffin/macpuffins-api-lib-objective-c)
* [Go](https://github.com/macpuffin/macpuffins-api-lib-go)


MacPuffins API Specifications
=============================

This repository contains the specifications for generating client SDKs with
[Swagger/OpenAPI](http://swagger.io/).

You can use the [Swagger UI](https://macpuffins.com/wiki/apidocs/) to interact with the APIs directly.

The canonical specification is defined in `swagger.json`. The templates for our
supported SDKs are located in `swagger-templates`. The configuration for each
SDK (e.g. name of the library, version number, etc.) are located in
`swagger-configs`.

We use [Travis CI](https://travis-ci.com/) to build each SDK and push it out the appropriate repository. To learn more about that process, look in the [travis-ci](travis-ci) directory.
