#!/bin/bash
set -e

# bazelisk version for Dev Container CLI
BAZELISK_VERSION=${BAZELISK:-"latest"}
BAZELISK_GIT_REPO="bazelbuild/bazelisk"
BAZELISK_LOCAL_PATH="/usr/local/bin/bazelisk"

# Check user
if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

# Clean up
rm -rf /var/lib/apt/lists/*

apt_get_update_if_needed()
{
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        apt-get update
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update_if_needed
        apt-get -y install --no-install-recommends "$@"
    fi
}

install_bazelisk() {
    check_packages curl ca-certificates grep sed

    arch="$(uname -m)"
    case "${arch}" in
        x86_64) ARCHITECTURE=amd64 ;;
        aarch64 | arm64 | armv8*) ARCHITECTURE=arm64 ;;
        *)
            echo -e "Bazelisk does not support current '$arch' architecture, check releases https://github.com/${BAZELISK_GIT_REPO}/releases"
            exit 1
    esac

    platf="$(uname -s)"
    case "${platf}" in
        Linux) PLATFORM=linux ;;
        Darwin) PLATFORM=darwin ;;
        *)
            echo -e "Unsupported '$platf' platform"
            exit 1
    esac

    if [ "${BAZELISK_VERSION}" = "latest" ]; then
        # curl "https://api.github.com/repos/${BAZELISK_GIT_REPO}/releases/latest"
        BAZELISK_VERSION=$(curl --silent "https://api.github.com/repos/${BAZELISK_GIT_REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    fi

    echo "(*) Installing Bazelisk $PLATFORM $ARCHITECTURE $BAZELISK_VERSION"

    curl -fSsL -o $BAZELISK_LOCAL_PATH "https://github.com/${BAZELISK_GIT_REPO}/releases/download/${BAZELISK_VERSION}/bazelisk-${PLATFORM}-${ARCHITECTURE}"
    chmod 0755 $BAZELISK_LOCAL_PATH

    # Adds symlink as bazel to bazelisk
    ln -s /usr/local/bin/bazelisk /usr/local/bin/bazel
}

install_bazelisk

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done"
