# django-vue
A dockerized end-to-end application development setup with multistage deployment Dockerfile.

## Develop
Make use of the development images to build your backend with django and statics with vue.

* Spin up django and mount the application volume
```
docker run -v ./django/application:/application \
  -P -ti --rm bluebrown/django /bin/zsh
```
* Spin up the vue development image and mount te builder volume

```
docker run -v ./vue/builder:/builder \
  -P -ti --rm bluebrown/vue /bin/zsh
```
## Build
* Use multi staging to compile the statics and assets with a vue builder image
* pass the statics to the image containing the django application
```
docker build -t yourapp:9000 .
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
