FROM golang:latest
FROM golang:latest
RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /app/statics/
ADD statics /app/statics/

ADD . /go/src/github.com/rx78502/invoicer-chapter2
RUN go install github.com/rx78502/invoicer-chapter2@latest

USER app
EXPOSE 8080
WORKDIR /app
ENTRYPOINT /go/bin/invoicer-chapter2
