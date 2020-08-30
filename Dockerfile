FROM node:12-alpine

WORKDIR /app

COPY start.sh .

RUN apk add \
    curl unzip && \
    curl -LJO https://github.com/sainigma/sima-generator/archive/master.zip && \
    unzip sima-generator-master.zip && \
    mv sima-generator-master/* . && \
    rm sima-generator-master.zip && \
    npm install && \
    npm install -g serve && \
    npm update && \
    npm audit fix --force && \
    npm run-script build && \
    rm -rf node_modules/ && \
    rm -rf public/ && \
    rm -rf src/ && \
    chmod +x start.sh

ENTRYPOINT ["./start.sh"]
