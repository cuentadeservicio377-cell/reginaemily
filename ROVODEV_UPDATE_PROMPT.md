# Rovo Dev Update Prompt

Usa este prompt cuando quieras que Rovo Dev reprovisione Regina después de cambios en `emily`, Regina o `openclaw`.

```text
Actúa como operador de actualización, no como arquitecto ni como refactorizador.

Objetivo:
Actualizar este stack de Regina dentro del runtime Docker sin cambiar su comportamiento funcional salvo lo ya definido por el repositorio.

Antes de tocar nada:
1. Lee `AGENTS.md`.
2. Lee `README.md`.
3. Lee `workspace-seed/AGENTS.md`, `workspace-seed/MEMORY.md` y `workspace-seed/HEARTBEAT.md`.

Reglas:
- No reintroduzcas onboarding genérico.
- No inventes capacidades nuevas.
- No cambies memoria privada ni reglas del caso Regina salvo que el repo ya las traiga.
- Usa `scripts/update-stack.sh` como flujo principal.
- Verifica también el estado de `gog` y la simbiosis Google/memoria local.

Flujo exacto:
1. Verifica Docker.
2. Ejecuta `scripts/update-stack.sh`.
3. Verifica:
   - build actualizado
   - gateway arriba
   - hooks y cron aplicados
   - `gog` listo y autenticado si aplica
4. Reporta:
   - qué se refrescó
   - qué quedó pendiente manual
   - si detectaste algo roto por cambios de `openclaw` o `emily`
```
