#!/bin/bash -e

# Increase minor version and set your registry, 
# then run the script to build, tag, push and replace on OpenShift
MINOR_VERSION=1
REGISTRY=quay.io/nlembers

podman build -t s2i-rust .
podman tag s2i-rust:latest ${REGISTRY}/s2i-rust:v1.${MINOR_VERSION}
podman push ${REGISTRY}/s2i-rust:v1.${MINOR_VERSION}

sed -i'.bak' -e 's/s2i-rust:v1.'$(($MINOR_VERSION - 1))'/s2i-rust:v1.'$MINOR_VERSION'/g' imagestream.yml
oc replace -f imagestream.yml --as system:admin
rm imagestream.yml.bak