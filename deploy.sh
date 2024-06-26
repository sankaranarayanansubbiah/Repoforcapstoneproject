#!/bin/bash

# Retrieve the current Git branch name
GIT_BRANCH=${GIT_BRANCH:-$(git rev-parse --abbrev-ref HEAD)}

# Debugging output
echo "Current Git Branch: ${GIT_BRANCH}"

# Check which branch is currently checked out
if [[ "${GIT_BRANCH}" == "origin/main" ]]; then
    ./build.sh
    docker tag guvi sankaranarayanansubbiah/prod:latest
    docker push sankaranarayanansubbiah/prod:latest
elif [[ "${GIT_BRANCH}" == "origin/dev" ]]; then
    ./build.sh
    docker tag guvi sankaranarayanansubbiah/dev:latest
    docker push sankaranarayanansubbiah/dev:latest
else
    echo "Deployment failed: Branch ${GIT_BRANCH} is not supported for deployment."
fi
