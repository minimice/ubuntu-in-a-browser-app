FROM node:8 as builder
ADD . /app
WORKDIR /app
RUN npm install

FROM ubuntu:18.04
WORKDIR /app/
COPY --from=builder /app .
RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y nodejs && \
    apt-get install -y git && \
    useradd -d /home/term -m -s /bin/bash term && \
    echo 'term:term' | chpasswd

EXPOSE 3000

CMD ["node", "app.js", "-p", "3000"]
