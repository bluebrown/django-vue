# django-vue
A dockerized full stack application - Django API, connected to a Postgres instance, as backend and a lightweight Gin fileserver that serves statics and assets compiled by the vue builder image.

## Development
This repository contains a special docker-compose file called dev-compose.yml. This file makes it easy to create a ntwork and mount the volumes required for development.
* Spin up the database   
  ```docker-compose -f dev-compose.yml up -d database```

* Spin up the backend-builder   
  ```docker-compose -f dev-compose.yml run backend-builder```

* Spin up the statics-builder   
  ```docker-compose -f dev-compose.yml run statics-builder```
 
* Spin up the server-builder   
  ```docker-compose -f dev-compose.yml run server-builder```


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
