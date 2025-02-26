#!/usr/bin/env bash
# Install curl from source, if the command is not available

REPO_URL="https://github.com/curl/curl.git"
INSTALL_DIR="$HOME/.local"
BUILD_DIR="$HOME/build/curl"

# Function to check if curl is installed
check_curl() {
  if command -v curl &>/dev/null; then
    echo "Curl is already installed."
    return 0
  fi
  return 1
}

# Check if curl is already installed
if check_curl; then
  return 0
fi

# Clone the repository
git clone $REPO_URL $BUILD_DIR

# Change to the cloned directory
cd $BUILD_DIR

# Configure the build
./configure --prefix=$INSTALL_DIR

# Compile and install
make
make install

# Cleanup
rm -rf $BUILD_DIR

# Verify installation
$INSTALL_DIR/bin/curl --version

echo "Curl has been successfully installed in $INSTALL_DIR"
