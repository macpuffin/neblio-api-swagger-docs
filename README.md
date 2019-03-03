APIs for Interacting with NTP1 Tokens & The Neblio Blockchain [![Build Status](https://travis-ci.org/NeblioTeam/neblio-api-swagger-docs.svg?branch=master)](https://travis-ci.org/NeblioTeam/neblio-api-swagger-docs)
=============================

This is the project that _generates_ API clients for connecting to the public Neblio API. You probably want to just use one of the clients that are pre-built in a language of your choice:

* [Python](https://github.com/NeblioTeam/neblio-api-lib-python)
* [JavaScript](https://github.com/NeblioTeam/neblio-api-lib-js)
* [Java](https://github.com/NeblioTeam/neblio-api-lib-java)
* [C#](https://github.com/NeblioTeam/neblio-api-lib-csharp)


Neblio API Specifications
=============================

This repository contains the specifications for generating client SDKs with
[Swagger/OpenAPI](http://swagger.io/).

You can use the [Swagger UI](https://learn.nebl.io/apidocs/) to interact with the APIs directly.

The canonical specification is defined in `swagger.json`. The templates for our
supported SDKs are located in `swagger-templates`. The configuration for each
SDK (e.g. name of the library, version number, etc.) are located in
`swagger-configs`.

We use [Travis CI](https://travis-ci.com/) to build each SDK and push it out the appropriate repository. To learn more about that process, look in the [travis-ci](travis-ci) directory.
