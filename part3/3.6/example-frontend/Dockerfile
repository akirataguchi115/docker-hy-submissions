FROM node:14-alpine as build-stage

COPY . .

RUN apk add --no-cache curl ca-certificates && \
    npm install && \
    REACT_APP_BACKEND_URL=http://localhost/api npm run build && \
    apk del curl && \
    adduser -S appuser

FROM node:14-alpine

EXPOSE 5000

WORKDIR /usr/src/app

COPY --from=build-stage /build /usr/src/app/build

RUN adduser -S appuser && \
    npm install -g serve

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
