#!/usr/bin/env bash
set -euo pipefail

MAVEN_VERSION="3.9.6"
INSTALL_DIR="/opt/maven"
MAVEN_DIR="${INSTALL_DIR}/apache-maven-${MAVEN_VERSION}"
MAVEN_SYMLINK="${INSTALL_DIR}/latest"
PROFILE_FILE="/etc/profile.d/maven.sh"
TARBALL="apache-maven-${MAVEN_VERSION}-bin.tar.gz"
URL="https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/${TARBALL}"

echo "==> Updating packages..."
sudo dnf -y update

echo "==> Installing Java + tools (avoid curl conflict on AL2023)..."
# Amazon Linux 2023 often has curl-minimal installed; installing curl can conflict.
sudo dnf -y install java-17-amazon-corretto-devel tar gzip ca-certificates || true

# Ensure we have a downloader: curl-minimal OR curl OR wget
if command -v curl >/dev/null 2>&1; then
  DL="curl"
elif command -v curl-minimal >/dev/null 2>&1; then
  DL="curl-minimal"
elif command -v wget >/dev/null 2>&1; then
  DL="wget"
else
  echo "==> Installing curl-minimal..."
  sudo dnf -y install curl-minimal
  DL="curl-minimal"
fi

echo "==> Preparing install directory..."
sudo mkdir -p "${INSTALL_DIR}"
cd /tmp

echo "==> Downloading Maven ${MAVEN_VERSION}..."
rm -f "${TARBALL}"

if [[ "${DL}" == "wget" ]]; then
  wget -q --https-only -O "${TARBALL}" "${URL}"
else
  # curl or curl-minimal
  curl -fsSLo "${TARBALL}" "${URL}"
fi

echo "==> Verifying tarball..."
tar -tzf "${TARBALL}" >/dev/null

echo "==> Installing Maven to ${MAVEN_DIR}..."
sudo rm -rf "${MAVEN_DIR}"
sudo tar -xzf "${TARBALL}" -C "${INSTALL_DIR}"

echo "==> Creating stable symlink ${MAVEN_SYMLINK} -> ${MAVEN_DIR}"
sudo ln -sfn "${MAVEN_DIR}" "${MAVEN_SYMLINK}"

# --- Set JAVA_HOME reliably ---
JAVA_BIN_PATH="$(readlink -f "$(command -v java)")"
JAVA_HOME_DIR="$(dirname "$(dirname "${JAVA_BIN_PATH}")")"

echo "==> Creating global profile: ${PROFILE_FILE}"
sudo tee "${PROFILE_FILE}" >/dev/null <<EOF
# Maven + Java env (Amazon Linux 2023)
export JAVA_HOME="${JAVA_HOME_DIR}"
export MAVEN_HOME="${MAVEN_SYMLINK}"
export M2_HOME="\$MAVEN_HOME"
export PATH="\$PATH:\$MAVEN_HOME/bin"
EOF

echo "==> Applying env vars for current shell..."
# shellcheck disable=SC1091
source "${PROFILE_FILE}"

echo "==> Verification..."
java -version
mvn -version

echo "✅ Maven ${MAVEN_VERSION} installed successfully."
