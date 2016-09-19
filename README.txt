Docker environment for running teuthology unit tests
====================================================

Quick start:

git clone git://github.com/smithfarm/ubuntu-teuthology
cd ubuntu-teuthology
vim Dockerfile
... edit the teuthology URL and branch name ...
docker build -t teuthology --no-cache .
... watch and wait; teuthology unit tests will run ...

Optionally enter the Docker container:

docker run -it teuthology /bin/bash
