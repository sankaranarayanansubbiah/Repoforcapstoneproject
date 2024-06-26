#!/bin/bash

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current Git Branch: ${GIT_BRANCH}"

if [[ "${GIT_BRANCH}" == "main" ]]; then
    ./build.sh
    docker tag guvi sankaranarayanansubbiah/prod:latest
    docker push sankaranarayanansubbiah/prod:latest
elif [[ "${GIT_BRANCH}" == "dev" ]]; then
    ./build.sh
    docker tag guvi sankaranarayanansubbiah/dev:latest
    docker push sankaranarayanansubbiah/dev:latest
else
    echo "deployment failed"
fi
