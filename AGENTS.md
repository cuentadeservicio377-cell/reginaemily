# Regina Emily Distribution

## Scope

This repository has two operating surfaces:

1. `workspace-seed/`
   Regina's behavioral source of truth on top of Emily.
2. `config/` and `scripts/`
   Runtime provisioning for OpenClaw and installation helpers.

## Core Rules

- Do not reintroduce generic onboarding.
- Regina operates from transcript, seeded memory, custom skills, and weekly planning.
- Keep the order of priority: practice -> business beta -> certification -> life load.
- Google Workspace and local memory must work as one system.
- Keep OpenClaw runtime concerns separate from Regina-specific behavior.

## File Map

- `workspace-seed/AGENTS.md`
  Regina operating contract inside OpenClaw.
- `workspace-seed/MEMORY.md`
  Global memory index for Regina.
- `workspace-seed/HEARTBEAT.md`
  Daily brief, weekly planning, transition review, and session rules.
- `workspace-seed/skills/regina-*`
  Regina-specific operating skills.
- `config/openclaw.seed.jsonc`
  Seeded runtime config and distribution metadata.
- `scripts/prepare-openclaw-source.sh`
  Clones or updates OpenClaw into `state/vendor/openclaw`.
- `scripts/init-regina.sh`
  Seeds config and workspace into `state/`.
- `scripts/install-stack.sh`
  Runs the automatable part of Regina/OpenClaw installation.
- `scripts/update-stack.sh`
  Re-seeds Regina, rebuilds Docker image, reapplies cron/hooks, and restarts runtime after base/runtime changes.
- `scripts/cron.seed.sh`
  Reapplies heartbeat, hooks, and cron jobs.
- `docker-compose.yml`
  OpenClaw runtime.

## Rovo Dev Instructions

- Treat this repository as the project root.
- Read this file first, then `workspace-seed/AGENTS.md`, `workspace-seed/MEMORY.md`, `workspace-seed/HEARTBEAT.md`, and the relevant `workspace-seed/memory/regina/*` files before proposing changes.
- If asked to install Regina, operate this repo directly and use the provided scripts.
- If asked to update Regina after changes in `emily` or `openclaw`, use `scripts/update-stack.sh` and then verify cron/hooks/runtime.
- If asked to change Regina behavior, edit `workspace-seed/` first unless the issue is clearly runtime-level.
- Do not assume undocumented OpenClaw capabilities or fabricate Google sync behavior outside `gog`.
