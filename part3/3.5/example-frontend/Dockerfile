FROM node:14-alpine

EXPOSE 500

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache curl ca-certificates && \
    npm install && \
    REACT_APP_BACKEND_URL=http://localhost/api npm run build && \
    npm install -g serve && \
    apk del curl && \
    adduser -S appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
