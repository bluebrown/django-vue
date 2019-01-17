# django-vue
A dockerized full stack application - Django API, connected to a Postgres instance, as backend and a lightweight Gin fileserver that serves statics and assets compiled by the vue builder image.

## Development
The app is build is mainly two places. The django backend and the vue builder:
* Build the api
  - spin up the django development image and mount the project repository
  - develop and run the api
* build the statics
  - spin up the vue development image and use the development server
  - build the frontend and make test calls to the api

Once the first development sprint is done, it is time to build the static server
* spin up a gin development container and mount the project directory as well as the dist folder from the vue project
* Develop a light weight webserver.

## Build
To build and test application a basic docker-compose.yml was provided. Here is a relevant snippet: 
```
...
  backend:
    build: ./backend
    image: develin/backend:prod
    restart: always
    ports:
      - 8000:8000

  frontend:
    build: ./frontend
    image: develin/frontend:prod
    restart: always
    ports:
      - 8080:8080
...
```

To build the backend, the django direcoty gets copied into a slim deployment image. Since python is an interpreted language and needs the runtime environment, there is nothing more to do.

To build the frontend is a little more complex, as it requires to compile code of two different languages(and services) into one slim deployment image. This is done though multi staging in the frontend/Dockerfile
```
FROM golang as go-builder
COPY ./server /go/src/server
RUN curl https://glide.sh/get | sh && \
  cd /go/src/server && glide install
RUN  go install server

FROM node as vue-builder
RUN npm install -g webpack @vue/cli @vue/cli-service-global
COPY ./builder /builder
RUN cd /builder && npm install
RUN cd /builder/src && vue build

FROM golang
COPY --from=go-builder /go/bin/server /go/bin/server
COPY --from=vue-builder /builder/src/dist /go/static
CMD ["bin/server"]

```

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
