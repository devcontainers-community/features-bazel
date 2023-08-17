# Bazel Dev Container Feature

💚 Installs Bazelisk and Buildifier

<p align=center>
  <img width=400 src="https://github.com/devcontainers-community/features-bazel/assets/61068799/48f7037a-f389-463c-b9b5-954f169f8aaf">
</p>

Install [Bazelisk](https://github.com/bazelbuild/bazelisk) and [Buildifier](https://github.com/bazelbuild/buildtools/blob/master/buildifier/README.md).

## Usage

```jsonc
// devcontainer.json
"features": {
  "ghcr.io/devcontainers-community/features/bazel": {}
}
```

❓ Don't know what this ☝ means? Check out [this VS Code blog post].

### Options

You can specify a `bazelisk_version` and a `buildifier_version` to pin each of the tools like this:

```jsonc
// devcontainer.json
"features": {
  "ghcr.io/devcontainers-community/features/bazel": {
    "bazelisk_version": "1.17.0",
    "buildifier_version": "6.1.2"
  }
}
```

<!-- prettier-ignore -->
[this vs code blog post]: https://code.visualstudio.com/blogs/2022/09/15/dev-container-features
