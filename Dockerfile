FROM node:0.10.38
ADD . /app
WORKDIR /app
RUN npm install && \
    apt-get update && \
    apt-get install -y vim && \
    useradd -d /home/term -m -s /bin/bash term && \
    echo 'term:term' | chpasswd

EXPOSE 3000

CMD ["node", "app.js", "-p", "3000"]
