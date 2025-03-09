#!/bin/bash

set -euxo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <SHA commit hash>"
    exit 1
fi

SHA="$1"

wget "https://github.com/google/googletest/archive/${SHA}.zip" -O gtest.zip
unzip gtest.zip
cd "googletest-${SHA}"
cmake -B build -S .
cmake --build build --target install
cd ..
rm -rf "googletest-${SHA}" gtest.zip
