#!/bin/bash
# Copyright Kani Contributors
# SPDX-License-Identifier: Apache-2.0 OR MIT

# If version is latest, install directly from cargo
if [ "$1" == "latest" ]; then
    cargo +stable install --locked kani-verifier;
else
    VERSION=$1
    cargo +stable install --version $VERSION --locked kani-verifier;
fi

# Check exit status for error handling
if [ $? -eq 0 ]; then
    echo "Installed Kani $1 successfully"
else
    echo "::error::Could not install Kani. Please check if the provided version is correct"
    exit 1
fi

# Setup kani in ci
cargo-kani setup;

# Get the current installed version of kani and check it against the latest version.
# Two output formats have to be supported, since this action can install any
# published version:
#   - Kani 0.68.0 and later print `Kani Rust Verifier <version> (<invocation>)`,
#     followed by a `CBMC <version>` line.
#   - Kani 0.67.0 and earlier used clap's default flag, printing `kani <version>`.
installed_version=$(
    kani --version |
        sed -nE 's/^(Kani Rust Verifier|kani) ([^[:space:]]+).*/\2/p' |
        head -1
)

if [ -z "$installed_version" ]; then
    echo "::error::Could not determine installed Kani version from \`kani --version\`"
    exit 1
fi

if [ "$1" == "latest" ]; then
    # Cargo search returns version number as string. Force color off: the Rust
    # toolchain action exports CARGO_TERM_COLOR=always, and the escape codes it
    # adds would otherwise defeat the anchor below.
    requested_version=$(CARGO_TERM_COLOR=never cargo search kani-verifier | grep -m 1 "^kani-verifier " | awk '{print $3}' | tr -d '"')
    if [ -z "$requested_version" ]; then
        echo "::error::Could not determine the latest Kani version from \`cargo search\`"
        exit 1
    fi
else
    requested_version=$1
fi

if [ "$installed_version" != "$requested_version" ]; then
    echo "::error::The version of Kani installed ($installed_version) was different than the one requested ($requested_version)"
    exit 1
fi
