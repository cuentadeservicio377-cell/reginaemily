#!/bin/bash
set -euo pipefail

DIST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

compose() {
  docker compose -f "$DIST_DIR/docker-compose.yml" "$@"
}

if ! command -v docker >/dev/null 2>&1; then
  echo "docker no está disponible en PATH"
  exit 1
fi

get_job_id() {
  local job_name="$1"
  compose run --rm openclaw-cli cron list --all --json 2>/dev/null | node -e '
const fs = require("node:fs");
const name = process.argv[1];
const raw = fs.readFileSync(0, "utf8");
if (!raw.trim()) process.exit(0);
const parsed = JSON.parse(raw);
const jobs = Array.isArray(parsed?.jobs) ? parsed.jobs : [];
const match = jobs.find((j) => j && j.name === name);
if (match && match.id) process.stdout.write(String(match.id));
' "$job_name" || true
}

upsert_job() {
  local name="$1"
  local cron_expr="$2"
  local event="$3"
  local job_id
  job_id="$(get_job_id "$name")"

  if [ -n "$job_id" ]; then
    compose run --rm openclaw-cli cron edit "$job_id" \
      --enable \
      --cron "$cron_expr" \
      --session main \
      --system-event "$event" >/dev/null
    echo "Cron actualizado: $name"
  else
    compose run --rm openclaw-cli cron add \
      --name "$name" \
      --cron "$cron_expr" \
      --session main \
      --system-event "$event" >/dev/null
    echo "Cron creado: $name"
  fi
}

compose run --rm openclaw-cli config set agents.defaults.heartbeat.every "2h" >/dev/null
compose run --rm openclaw-cli config set agents.defaults.heartbeat.target "last" >/dev/null
compose run --rm openclaw-cli config set agents.defaults.heartbeat.prompt "Read HEARTBEAT.md, MEMORY.md, memory/emily/* and memory/regina/* files. Follow them strictly. If nothing needs attention, reply HEARTBEAT_OK." >/dev/null

echo "Heartbeat resembrado"

compose run --rm openclaw-cli hooks enable session-memory >/dev/null || true
compose run --rm openclaw-cli hooks enable emily-memory-evolution >/dev/null || true

echo "Hooks activados: session-memory, emily-memory-evolution"

upsert_job \
  "Regina Daily Brief" \
  "30 9 * * *" \
  "Regina Daily Brief. Read HEARTBEAT.md, MEMORY.md, memory/emily/* and memory/regina/*, then produce today's operating brief. Prioritize practice first, then business beta, then certification, then life load. Respect the weekly windows and mention the next critical block."

upsert_job \
  "Regina Weekly Planning" \
  "0 18 * * 0" \
  "Regina Weekly Planning. It is Sunday 6 PM. Read HEARTBEAT.md, MEMORY.md and all memory/regina/* files. Build Regina's real week inside the 10-11 AM and 6-7 PM windows. Order the week by practice first, business second, certification third, life load fourth. Reconcile Google-facing commitments and local memory."

upsert_job \
  "Regina Growth Transition Review" \
  "0 10 1 4 *" \
  "Regina Growth Transition Review. Starting on April 1, 2026, review what Regina learned in beta, open transition-plan.md, and design with her a plan to start growing her paid client portfolio without fixing a target count in advance."

echo "Provisión de Regina completada"
