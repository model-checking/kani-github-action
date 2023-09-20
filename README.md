## Kani Github Action

This repository provides a GitHub Action for running the [Kani Rust Verifier](https://github.com/model-checking/kani) in CI.

## GitHub Action Parameters

The following parameters can be used to configure and customize the behavior of this GitHub Action:

NOTE: All the fields provided are optional and have default behaviors when not specified.

`kani-version`

- **Description**: Specifies the Kani version number to use.
- **Default**: 'latest'
- **Example-pinned-version**: `'0.33.0'`
- **Usage**: You can provide a specific version of Kani to use. [Cargo's version specific format is expected for specific versions](https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html).
If omitted, the latest version of `Kani` hosted on [`Kani's crates.io page`](https://crates.io/crates/kani-verifier) will be installed and used.

`command`

- **Description**: Specifies the command to run Kani.
- **Default**: 'cargo-kani'
- **Usage**: You can set a custom command to run Kani. For example, this allows you to use a different binary or script for Kani, if needed.

`working-directory`

- **Description**: Specifies the directory in which Kani should be run.
- **Default**: '.'
- **Usage**: Kani will be executed within this directory.

`args`

- **Description**: Specifies additional arguments to pass to Kani.
- **Default**: ''
- **Usage**: You can provide any additional command-line arguments to Kani using this parameter. These arguments will be appended to the Kani command.

`enable-propproof`

- **Description**: Experimental feature that allows Kani to verify proptest harnesses using the PropProof feature.
- **Default**: false
- **Usage**: If set to `true`, Kani will enable the experimental PropProof feature for verifying proptest harnesses.

## Kani-version default behavior

Please note that since providing `kani-version` is optional, if the user doesn't provide the version, the action will install the latest version of `Kani` on `crates.io`.

## Example usage in a workflow YAML file:

Here is an example of a workflow YAML file for the Kani Github Action

```yaml
jobs:
  kani:
    runs-on: ubuntu-latest
    steps:
      - name: Run Kani
        uses: model-checking/kani-github-action@v0.37
        with:
          kani-version: '0.35.0'
          command: 'cargo-kani'
          working-directory: './path/to/project'
          args: '--tests'
          enable-propproof: true
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This code is distributed under the terms of both the MIT license and the Apache License (Version 2.0).
See [LICENSE-APACHE](LICENSE-APACHE) and [LICENSE-MIT](LICENSE-MIT) for details.
