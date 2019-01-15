# django-vue
A dockerized end-to-end application development setup with multistage deployment Dockerfile.

## Development
The app consists basically out of 3 components. A rest api, a static fileserver and a frontend-framework that builds the statics and assets. Each of them has its own development environment. One possible worklow is the following:
* Build the api
  - spin up the django development image and mount the project repository
  - run the api
* build the statics
  - spin up the vue development image and use the development server
  - build the frontend and make test calls to the api

* build the static server
  - spin up a gin development container and mount the project directory as well as the dist folder from the vue project
  
## Build
In the build porcess, the multi stage Dockerfile for the gin-vue frontend gets used to build a slim static file server.
The Django Rest API gets build into an optimized image as well. Both services are ready for testing.


## Meta
**Author:** Nico Braun – [@littlebluebrown](https://twitter.com/littlebluebrown) – nico-braun@live.de


## Contributing
1. Fork it (<https://github.com/bluebrown/vim-alpine/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki
