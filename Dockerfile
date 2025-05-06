FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN go get modernc.org/sqlite

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

CMD ["./main"]