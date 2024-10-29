FROM golang:1.18-alpine AS builder

WORKDIR /app
COPY go.* ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:3.14
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 8080
CMD ["./main"]