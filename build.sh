#!/bin/sh

set -e

version=$(git rev-parse --abbrev-ref HEAD)

[ -d hugo ] && rm -fr hugo

git clone --depth=1 --branch $version http://github.com/gohugoio/hugo

cd hugo
docker build -t hugo-build:$version .

docker create --name hugo hugo-build:$version
docker cp hugo:/go/bin/hugo ../bin-hugo
docker rm hugo

cd ..

docker build -t losinggeneration/hugo:$version .
docker build -t losinggeneration/hugo:latest .
rm bin-hugo
