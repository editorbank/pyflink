#!
set -ex
version=$(cat version.txt)
[ ! -z "$version" ] && docker build . -t editorbank/pyflink:latest -t editorbank/pyflink:$version
