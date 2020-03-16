#!/bin/sh

cd Base
docker build -t samueltauil/base:3.141.59-zirconium .
cd ../Hub
docker build -t samueltauil/hub:3.141 .
docker push samueltauil/base:3.141.59-zirconium
docker push samueltauil/hub:3.141
