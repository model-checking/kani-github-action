#!/bin/bash
# Copyright Kani Contributors
# SPDX-License-Identifier: Apache-2.0 OR MIT

# If version is latest, install directly from cargo
if [ "$1" == "latest" ]; then
    cargo install --locked kani-verifier
else
    VERSION=$1
    cargo install --version $VERSION --locked kani-verifier;
fi

# setup kani in ci
cargo-kani setup;
