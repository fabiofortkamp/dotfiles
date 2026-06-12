#!/usr/bin/env bash
set -euo pipefail
dir="$(cd "$(dirname "$0")" && pwd)"
jar="$dir/code-maat-1.0.2-standalone.jar"
url="https://github.com/adamtornhill/code-maat/releases/download/v1.0.2/code-maat-1.0.2-standalone.jar"

if [[ -f "$jar" ]]; then
  echo "code-maat already installed at $jar"
  exit 0
fi

echo "Downloading code-maat..."
curl -fL "$url" -o "$jar"
echo "Installed to $jar"
