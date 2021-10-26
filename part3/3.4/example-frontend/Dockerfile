FROM ubuntu:18.04 

EXPOSE 500

WORKDIR /usr/src/app

COPY . .

RUN apt update && apt install -y curl ca-certificates && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt install -y nodejs && \
    npm install && \
    REACT_APP_BACKEND_URL=http://localhost/api npm run build && \
    npm install -g serve && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
