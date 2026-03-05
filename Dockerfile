FROM golang:1.22

RUN apt-get update && apt-get install -y vim less man-db wget telnet curl net-tools iputils-ping htop dnsutils strace

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o server .

EXPOSE 8080

CMD ["./server"]
