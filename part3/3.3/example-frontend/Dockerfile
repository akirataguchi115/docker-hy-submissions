FROM ubuntu:18.04 

EXPOSE 500

WORKDIR /usr/src/app

RUN apt update && apt install -y curl

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash

RUN apt install -y nodejs

COPY . .

RUN npm install

RUN REACT_APP_BACKEND_URL=http://localhost/api npm run build

RUN npm install -g serve

RUN useradd -m appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
