#!/bin/bash
docker build -t donet-api . && docker rm dotnet-api --force; docker run -dit --name dotnet-api --network the_best_network -p80:8080 donet-api
