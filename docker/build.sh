#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
SCRIPT_PARENT_DIR="$SCRIPT_DIR/.."
cd "$SCRIPT_PARENT_DIR" || exit

TAG="latex-cv"
OUTPUT_DIR="/workdir/out/."

docker build \
    -t "$TAG" \
    -f "docker/Dockerfile" \
    . ||
    {
        echo "Failed to build docker image"
        exit 1
    }

docker cp "$(
    docker create "$TAG"
):$OUTPUT_DIR" .

docker rm "$(
    docker stop "$(
        docker ps -a -q --filter ancestor="$TAG"
    )" >/dev/null 2>&1
)" >/dev/null 2>&1
