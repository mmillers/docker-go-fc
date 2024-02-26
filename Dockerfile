FROM golang:1.20 AS builder
WORKDIR /app
COPY . .
RUN go build -o bin

FROM scratch
COPY --from=builder /app/bin /
ENTRYPOINT ["/bin"]