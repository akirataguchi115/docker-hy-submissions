#!/bin/bash

echo GitHub repository owner: 

read ownerofrepo

echo GitHub repository name: 

read reponame

fullrepourl='https://github.com/'
fullrepourl+="$ownerofrepo"
fullrepourl+="/"
fullrepourl+="$reponame"

git clone "$fullrepourl"

cd "$reponame"

chmod 644 Gemfile
chmod 644 Gemfile.lock

docker build . -t akiradock/coursematerial

docker login

docker push akiradock/coursematerial
