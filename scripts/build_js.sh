#!/bin/bash

set -o xtrace
set -e

PROJECT_PATH="$( cd "$(dirname "$0")/../" ; pwd -P )"

if [ -z ${LBRY_DESKTOP_REPO+x} ]; then
    echo "Please set LBRY_DESKTOP_REPO to the location of cloned lbry-desktop repository on your filesystem."
    exit 1
fi

if [ ! -d "$LBRY_DESKTOP_REPO" ]; then
    echo "Directory $LBRY_DESKTOP_REPO doesn't exist."
    exit 1
fi

(
    PATH="$PATH:./node_modules/.bin"
    cd $LBRY_DESKTOP_REPO
    echo "Building the app in $LBRY_DESKTOP_REPO..."
    webpack #--mode development
)

rm -f "$PROJECT_PATH/app/"*
cp -r "$LBRY_DESKTOP_REPO/dist/web/"* "$PROJECT_PATH/app/"
