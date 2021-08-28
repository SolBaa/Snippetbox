FROM golang:1.16-alpine

RUN go get github.com/silenceper/gowatch
WORKDIR /go/src/github.com/SolBaa/snippetbox
RUN apk add make git build-base

# Download necessary Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o snippetbox .

EXPOSE 4000

CMD [ "/snippetbox" ]