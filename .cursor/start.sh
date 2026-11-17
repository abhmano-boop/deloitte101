#!/usr/bin/env bash
set -euo pipefail

PORT=3001
if curl -sf -o /dev/null --max-time 2 "http://127.0.0.1:${PORT}/"; then
  echo "Excalidraw dev server already listening on port ${PORT}"
  exit 0
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"
exec yarn --cwd excalidraw-app vite --host 0.0.0.0 --port "${PORT}"
