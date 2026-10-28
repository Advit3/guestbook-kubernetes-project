# Build the Guestbook binary in a Go builder stage.
FROM golang:1.18 AS builder

WORKDIR /app

COPY main.go .
RUN go mod init guestbook
RUN go mod tidy
RUN go build -o guestbook main.go

# Copy the binary and browser assets into the runtime image.
FROM ubuntu:18.04

WORKDIR /app

COPY --from=builder /app/guestbook /app/guestbook
COPY public/index.html /app/public/index.html
COPY public/script.js /app/public/script.js
COPY public/style.css /app/public/style.css
COPY public/jquery.min.js /app/public/jquery.min.js

EXPOSE 3000
CMD ["./guestbook"]
