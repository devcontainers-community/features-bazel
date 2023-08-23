#!/bin/bash
set -euo pipefail
source lib.sh

check_packages curl ca-certificates
apt_cleanup

echo "Installing Bazel"

LOCAL_BIN="/usr/local/bin"

github_download() {
    repo=$1
    version=$2
    artifact=$3
    output=$4
    if [ "${version}" = "latest" ]; then
        URL="https://github.com/${repo}/releases/latest/download/${artifact}"
    else
        URL="https://github.com/${repo}/releases/download/${version}/${artifact}"
    fi
    curl -fSsL "${URL}" -o "${output}"
}

github_download "bazelbuild/bazelisk" "${BAZELISK_VERSION}" "bazelisk-linux-amd64" "${LOCAL_BIN}/bazelisk"
chmod +x "${LOCAL_BIN}/bazelisk"
ln -s "${LOCAL_BIN}/bazelisk" "${LOCAL_BIN}/bazel"

github_download "bazelbuild/buildtools" "${BUILDIFIER_VERSION}" "buildifier-linux-amd64" "${LOCAL_BIN}/buildifier"
chmod +x "${LOCAL_BIN}/buildifier"

echo "Done"
