# Static builder, builds statics
# and pass as articfacts
FROM node as vue-builder
RUN npm install -g \
      webpack \
      @vue/cli \
      @vue/cli-service-global

COPY ./vue/builder /builder
RUN cd /builder/src && vue build

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Django app  Serves the application
# using  the statics from vue-builder
FROM python
RUN pip install django

COPY ./django/application /application
COPY --from=vue-builder /builder/src/dist /application/static

