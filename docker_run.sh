#!/bin/bash

mkdir -p docker_volume
docker run -itd --rm -p 0.0.0.0:5000:8787 -p 0.0.0.0:5001:8888 -e PASSWORD=password -e ROOT=true -v "C:\Users\Linan Qiu\source\repos\r-development\docker_volume":/home/rstudio --name anon_rstudio mlr/development:latest >/dev/null