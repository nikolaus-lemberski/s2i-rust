#!/bin/bash -e

# Set your registry then run the script to build, tag, push and create on OpenShift
REGISTRY=quay.io/nlembers

podman build -t s2i-rust .
podman tag s2i-rust:latest ${REGISTRY}/s2i-rust:v1.0
podman push ${REGISTRY}/s2i-rust:v1.0

oc create -f imagestream.yml --as system:admin