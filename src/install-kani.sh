#!/bin/bash
# Copyright Kani Contributors
# SPDX-License-Identifier: Apache-2.0 OR MIT

# If version is latest, install directly from cargo
echo $1;
if [ "$1" == "latest" ]; then
    cargo install --locked kani-verifier;
else
    VERSION=$1
    cargo install --version $VERSION --locked kani-verifier;
fi

# Check exit status for error handling
if [ $? -ne O ]; then
    echo "Error installing Kani. Please check if the provided version is correct"
    exit 1
fi

# Setup kani in ci
cargo-kani setup;
