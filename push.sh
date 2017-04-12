#!/usr/bin/env bash

baseDir=images
order=(php wordpress)

function handle_version() {
    namespace=$1
    version=$2

    local baseDir=${baseDir}/${version}

    docker build -qt pretzlaw/${namespace}:${version} ${baseDir}
    docker push  pretzlaw/${namespace}:${version}
}

function handle_namespace() {
    namespace=$1

    local baseDir=${baseDir}/${namespace}

    # Versions
    for V in $(ls -1 ${baseDir}); do
        if [[ ! -d ${baseDir}/${V} ]]; then
            continue
        fi

        echo "## $V"
        echo ""

        handle_version $namespace $V

        echo ""
    done
}

if [[ ! -z $1 ]]; then
    handle_namespace $1
    exit $?
fi

# Build
for D in ${order[@]}; do

    if [[ ! -d ${baseDir}/${D} ]]; then
        continue
    fi

    echo "# $D"
    echo ""

    handle_namespace $D

    echo ""
    echo ""
done


# Push
