FROM golang:1.17 AS builder

WORKDIR /app

COPY ./main.go .

RUN go mod init main

RUN go mod tidy

RUN go build -o main

FROM scratch

COPY --from=builder /app/main /main

ENTRYPOINT ["/main"]
