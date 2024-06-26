#!/bin/bash

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ "${GIT_BRANCH}" == "main" ]]; then
    ./build.sh
    docker tag guvi sankaranarayanansubbiah/prod
    docker push sankaranarayanansubbiah/prod
elif [[ "${GIT_BRANCH}" == "dev" ]]; then
    ./build.sh
    docker tag guvi sankaranarayanansubbiah/dev
    docker push sankaranarayanansubbiah/dev
else
    echo "deployment failed"
fi
