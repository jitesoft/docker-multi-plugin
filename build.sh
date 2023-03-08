#! /bin/bash
export CGO_ENABLED=0
VERSION="unknown"

if [ ${1+x} ]; then
  VERSION=$1
fi

mkdir -p bin

echo "Building linux arm64"
GOARCH=arm64 GOOS=linux go build -ldflags "-s -w -X main.MultiVersion=${VERSION}" -o docker-multi
upx -7 docker-multi
tar -zc docker-multi -f bin/docker-multi-plugin-arm64-linux.tar.gz
rm docker-multi

echo "Building linux amd64"
GOARCH=amd64 GOOS=linux go build -ldflags "-s -w -X main.MultiVersion=${VERSION}" -o docker-multi
upx -7 docker-multi
tar -zc docker-multi -f bin/docker-multi-plugin-amd64-linux.tar.gz
rm docker-multi

echo "Building linux arm"
GOARCH=arm GOOS=linux go build -ldflags "-s -w -X main.MultiVersion=${VERSION}" -o docker-multi
upx -7 docker-multi
tar -zc docker-multi -f bin/docker-multi-plugin-arm-linux.tar.gz
rm docker-multi

echo "Building darwin amd64"
GOARCH=amd64 GOOS=darwin go build -ldflags "-s -w -X main.MultiVersion=${VERSION}" -o docker-multi
upx -7 docker-multi
tar -zc docker-multi -f bin/docker-multi-plugin-amd64-darwin.tar.gz
rm docker-multi

echo "Building darwin arm64"
GOARCH=arm64 GOOS=darwin go build -ldflags "-s -w -X main.MultiVersion=${VERSION}" -o docker-multi
upx -7 docker-multi
tar -zc docker-multi -f bin/docker-multi-plugin-arm64-darwin.tar.gz
rm docker-multi

echo "Building windows amd64"
GOARCH=amd64 GOOS=windows go build -ldflags "-s -w -X main.MultiVersion=${VERSION}" -o docker-multi.exe
upx -7 docker-multi.exe
tar -zc docker-multi.exe -f bin/docker-multi-plugin-amd64-windows.tar.gz
rm docker-multi.exe

echo "Building windows arm64"
GOARCH=amd64 GOOS=windows go build -ldflags "-s -w -X main.MultiVersion=${VERSION}" -o docker-multi.exe
upx -7 docker-multi.exe
tar -zc docker-multi.exe -f bin/docker-multi-plugin-arm64-windows.tar.gz
rm docker-multi.exe

echo "Generating SHASUMS"

SHASUM=$(cd bin && find . -maxdepth 1 -type f ! -name SHA256SUM.txt -printf '%P\0' | xargs -r0 shasum -- > SHA256SUM.txt)
