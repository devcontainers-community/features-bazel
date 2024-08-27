# Bazel Dev Container Feature

💚 Installs Bazel tooling

<p align=center>
  <img width=400 src="https://github.com/devcontainers-community/features-bazel/assets/61068799/48f7037a-f389-463c-b9b5-954f169f8aaf">
</p>

> _{Fast, Correct} - Choose two_
>
> Build and test software of any size, quickly and reliably.
>
> - **Speed up your builds and tests**: Bazel rebuilds only what is necessary.
>   With advanced local and distributed caching, optimized dependency analysis
>   and parallel execution, you get fast and incremental builds.
> - **One tool, multiple languages**: Build and test Java, C++, Android, iOS,
>   Go, and a wide variety of other language platforms. Bazel runs on Windows,
>   macOS, and Linux.
> - **Scalable**: Bazel helps you scale your organization, codebase, and
>   continuous integration solution. It handles codebases of any size, in
>   multiple repositories or a huge monorepo.
> - **Extensible to your needs**: Easily add support for new languages and
>   platforms with Bazel's familiar extension language. Share and re-use
>   language rules written by the growing Bazel community.

<!-- prettier-ignore -->
&mdash; [bazelbuild/bazel: a fast, scalable, multi-language and extensible build system](https://github.com/bazelbuild/bazel)

This Feature installs Bazel using [Bazelisk]. Then, it symlinks
`/usr/local/bin/bazel` to the Bazelisk installation so that you can use `bazel`
as normal through `bazelisk`. The main feature of Bazelisk is that it
automatically uses the correct Bazel version based on things like
`$USE_BAZEL_VERSION`, `.bazeliskrc`, `.bazelversion`, and more. This feature
also installs the [Bazel VS Code extension]. Oh, and it also installs
[Buildifier] for your convenience. 😉

## Usage

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

```jsonc
// devcontainer.json
"features": {
  "ghcr.io/devcontainers-community/features/bazel:1": {}
}
```

❓ Don't know what this ☝ means? Check out [this VS Code blog post].

### Options

You can specify a `bazelisk_version` and a `buildifier_version` to pin each of
the tools like this:

```jsonc
// devcontainer.json
"features": {
  "ghcr.io/devcontainers-community/features/bazel:1": {
    "bazelisk_version": "v1.17.0",
    "buildifier_version": "v6.1.2"
  }
}
```

<!-- prettier-ignore-start -->
[this vs code blog post]: https://code.visualstudio.com/blogs/2022/09/15/dev-container-features
[bazelisk]: https://github.com/bazelbuild/bazelisk#readme
[buildifier]: https://github.com/bazelbuild/buildtools/tree/master/buildifier#readme
[bazel vs code extension]: https://marketplace.visualstudio.com/items?itemName=BazelBuild.vscode-bazel
<!-- prettier-ignore-end -->
