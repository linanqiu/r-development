#!/bin/bash

set -e

[ -d context ] || { echo "Directory context doesnt exist"; exit 1 ;}

docker build -t mlr/development:latest context