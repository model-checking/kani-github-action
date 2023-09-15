#!/bin/bash
# Copyright Kani Contributors
# SPDX-License-Identifier: Apache-2.0 OR MIT

# If version is latest, install directly from cargo
if [ "$1" == "latest" ]; then
    cargo install --locked kani-verifier;
else
    VERSION=$1
    cargo install --version $VERSION --locked kani-verifier;
fi

# Check exit status for error handling
if [$? -eq O]; then
    echo "Installed Kani $VERSION successfully"
else
    echo "::error::Could not install Kani. Please check if the provided version is correct"
    exit 1
fi

# Setup kani in ci
cargo-kani setup;

# Get the current installed version of kani and check it against the latest version
installed_version=$(kani --version | awk '{print $2}')

if [$? -eq 0]; then
    if [ "$1" == "latest" ]; then
        # Cargo search returns version number as string
        requested_version=$(cargo search kani-verifier | grep -m 1 "^kani-verifier " | awk '{print $3}')
    else
        requested_version=$1
    fi

    if ["$installed_version" != "$requested_version"]; then
        echo "::error::The version of Kani installed was different than the one requested"
        exit 1
    fi
fi
