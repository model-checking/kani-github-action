## Kani Github Action

This repository provides a GitHub Action for running the [Kani Rust Verifier](https://github.com/model-checking/kani) in CI.

⚠️ **Important Notice**: We will soon be moving the default branch from `main` to [`v1`](https://github.com/model-checking/kani-github-action/releases/tag/v1.0).
Please be aware that version `0.38` will be the final release on the `main` branch before the transition to stable.
Make sure to update your workflows and references accordingly.
We have added a new field called `kani-version` that will default to installing the latest version of `kani`.
To install a specific version of 'kani', please add a semver version to the field `kani-version` as shown in the example below.

Example:

```
jobs:
  kani:
    runs-on: ubuntu-latest
    steps:
      - name: Run Kani
        uses: model-checking/kani-github-action@v1.0
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
