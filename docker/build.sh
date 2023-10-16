#!/bin/bash
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
SCRIPT_PARENT_DIR="$SCRIPT_DIR/.."
cd "$SCRIPT_PARENT_DIR" || exit

TAG="latex-cv"
OUTPUT_DIR="out"

docker build -t $TAG -f "docker/Dockerfile" . || exit

container_id=$(docker create $TAG)

docker cp "$container_id:$OUTPUT_DIR" $OUTPUT_DIR/ || exit
docker stop "$container_id" || exit
docker rm "$container_id" || exit
