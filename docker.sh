#!/usr/bin/env bash
set -e

if [ -x "$(command -v docker)" ]; 
then 
    docker "$@"
else 
    podman "$@" || true
fi #docker==podman