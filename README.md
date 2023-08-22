# Bazel Dev Container Feature

💚 Installs Bazel via Bazelisk

<p align=center>
  <img width=400 src="https://github.com/devcontainers-community/features-bazel/assets/61068799/48f7037a-f389-463c-b9b5-954f169f8aaf">
</p>

Install [Bazelisk](https://github.com/bazelbuild/bazelisk).

## Usage

```jsonc
// devcontainer.json
"features": {
  "ghcr.io/devcontainers-community/features/bazel": {}
}
```

❓ Don't know what this ☝ means? Check out [this VS Code blog post].

### Options

You can specify a `bazelisk` version to pin to a specific version like this:

```jsonc
// devcontainer.json
"features": {
  "ghcr.io/devcontainers-community/features/bazel": {
    "bazelisk": "v1.15.0",
  }
}
```

And to choose a specific Bazel version, do this:

```jsonc
// devcontainer.json
"features": {
    "ghcr.io/devcontainers-community/features/bazel:1": {
        "bazelisk": "v1.15.0"
    }
},
"containerEnv": { "USE_BAZEL_VERSION": "5.4.0" }
```

<!-- prettier-ignore -->
[this vs code blog post]: https://code.visualstudio.com/blogs/2022/09/15/dev-container-features
