# django-vue
This project demonstrates how to use docker to build a full stack application with django and vue.
You can use vue as builder image or seperate service

**Develop** with 2 services and a shared volume for the compiled statics.
Django as backend and Vue as static builder instance.

**Deploy** with vue as builder image that passes the static directory
as artifact, to the django application.

*Django is responsible for the logic and defines through views what files
and assets to present to the user, when recieving a http request.*

*The open question for now would be how to pass variables to the frontend
for dynamic content.*


*One idea might be to have a dedicated api endpoint next to the regular application
endpoint. Then I use asynchronous resource requests, through the MDN fetch API,
for dynamic content.*


## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

## Contributing

1. Fork it (<https://github.com/yourname/yourproject/fork>)
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
