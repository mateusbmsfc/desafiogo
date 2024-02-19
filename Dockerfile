# Etapa de compilação
FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Etapa de execução
FROM scratch

COPY --from=builder /app/main .

CMD ["./main"]
