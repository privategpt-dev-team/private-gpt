#!/usr/bin/env bash
set -euo pipefail

if ! docker compose version >/dev/null 2>&1; then
  echo "Docker Compose v2 wird benötigt."
  exit 1
fi

sudo apt-get update -y
sudo apt-get install -y make jq curl

pip3 install --user pre-commit
git config --global core.autocrlf input

echo "Dev-Container bereit. Starte z. B.:"
echo "  docker compose up                 # Standardprofil (ollama-cpu)"
echo "  docker compose --profile ollama-cpu up"
echo "  docker compose --profile llamacpp-cpu up   # (HF_TOKEN nötig)"
