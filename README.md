## Kani Github Action

This repository provides a GitHub Action for running the [Kani Rust Verifier](https://github.com/model-checking/kani) in CI.

## Kani GitHub Action Parameters

The following parameters can be used to configure and customize the behavior of this GitHub Action:

**NOTE**: All the fields provided are optional and have default behaviors when not specified.

`kani-version`

- **Description**: The Kani version to use.
- **Default**: `latest`
- **Usage**: `latest` or `x.y.z` to mention which version Kani to use. [Cargo's version specific format is expected for specific versions](https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html).
If omitted, the latest version of `Kani` hosted on [`Kani's crates.io page`](https://crates.io/crates/kani-verifier) will be installed and used.

`command`

- **Description**: The command to run Kani.
- **Default**: `cargo-kani`
- **Usage**: `cargo-kani` or `kani` or custom path to a `kani` binary. Subcommands need to be passed to the `args` field.

`working-directory`

- **Description**: The directory in which Kani should be run.
- **Default**: `'.'`
- **Usage**: `/path/to/project` or `.`

`args`

- **Description**: Additional arguments to pass to Kani.
- **Default**: `''`
- **Usage**: These arguments or subcommands will be appended to the Kani command.

`enable-propproof`

- **Description**: Experimental feature that allows Kani to verify proptest harnesses using the PropProof feature.
- **Default**: `false`
- **Usage**: If set to `true`, Kani will enable the experimental PropProof feature for verifying proptest harnesses.

## Example usage in a workflow YAML file:

Here are a few examples of workflow YAML files for the Kani Github Action

#### Example 1: Default config which uses the latest version of kani to run `cargo-kani` on project in current directory
```yaml
jobs:
  kani:
    runs-on: ubuntu-latest
    steps:
      - name: Run Kani
        uses: model-checking/kani-github-action@v1.0
```

#### Example 2: Use a specific version of kani, version `0.35.0`, to run `cargo-kani`  on a project
```yaml
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

#### Example 3: Use pinned version of kani, version `0.35.0`, to run `cargo-kani --tests` on a project with propproof harnesses.
```yaml
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
          args: '--tests'
          enable-propproof: true
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This code is distributed under the terms of both the MIT license and the Apache License (Version 2.0).
See [LICENSE-APACHE](LICENSE-APACHE) and [LICENSE-MIT](LICENSE-MIT) for details.
