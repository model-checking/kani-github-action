## Kani Github Action

This repository provides a GitHub Action for running the [Kani Rust Verifier](https://github.com/model-checking/kani) in CI.

⚠️ **Important Notice**: We will be moving to [`v1`](https://github.com/model-checking/kani-github-action/releases/tag/v1.0), which will install the latest version of `Kani` by default.
Please be aware that version `0.38` will be the final release where the version of `Kani` matches the version of `Kani Github Action`.
Make sure to update your workflows and references accordingly.
To install a specific version of `Kani`, please add a semver version to the field `kani-version` as shown in the example below.

Example:

```
jobs:
  kani:
    runs-on: ubuntu-latest
    steps:
      - name: Run Kani
        uses: model-checking/kani-github-action@v1
        with:
          kani-version: '0.35.0'
          command: 'cargo-kani'
          working-directory: './path/to/project'
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This code is distributed under the terms of both the MIT license and the Apache License (Version 2.0).
See [LICENSE-APACHE](LICENSE-APACHE) and [LICENSE-MIT](LICENSE-MIT) for details.
