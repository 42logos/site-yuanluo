#!/usr/bin/env bash
set -euo pipefail

# 1. Must be run as root
if (( EUID != 0 )); then
  echo "❌ This script must be run as root. Please run as root or with sudo."
  exit 1
fi

# 2. Update & upgrade system packages
echo "🔄 Updating and upgrading system packages..."
apt-get update && apt-get upgrade -y

# 3. Ensure curl is installed
if ! command -v curl >/dev/null 2>&1; then
  echo "📥 'curl' not found. Installing curl..."
  apt-get install -y curl
else
  echo "✅ 'curl' is already installed."
fi

# 4. Ensure uv is installed
if ! command -v uv >/dev/null 2>&1; then
  echo "📥 'uv' not found. Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
else
  echo "✅ 'uv' is already installed; skipping installation."
fi

# 5. Run main.py with uv
echo "🚀 Running main.py via uv..."
uv run main.py
