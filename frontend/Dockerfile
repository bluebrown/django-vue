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

