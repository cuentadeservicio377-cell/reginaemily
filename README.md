# Regina Emily Distribution

Distribución instalable de Regina sobre OpenClaw + Emily, preparada para que el asistente opere Pilates como práctica, certificación y negocio beta.

## Qué resuelve

- Regina no arranca desde un chat genérico.
- OpenClaw levanta con workspace preconfigurado sobre Emily.
- El caso ya viene traducido a memoria, heartbeat, skills y ritmo semanal.
- Google Workspace y memoria local quedan planteados como sistema simbiótico.
- El asistente nace como operadora de ejecución para Regina, no como tutor genérico ni coach abstracto.

## Estructura

- `workspace-seed/`: archivos core de Emily + capa Regina.
- `config/openclaw.seed.jsonc`: manifiesto con runtime config válida + metadata del asistente.
- `scripts/prepare-openclaw-source.sh`: clona o actualiza OpenClaw dentro de `state/vendor/openclaw`.
- `scripts/init-regina.sh`: siembra `state/config` y `state/workspace`.
- `scripts/install-stack.sh`: ejecuta la preparación automatizable de Regina + OpenClaw.
- `scripts/cron.seed.sh`: activa heartbeat, hooks y cron usando `openclaw-cli`.
- `docker-compose.yml`: runtime Docker de OpenClaw.
- `AGENTS.md`: instrucciones de proyecto para agentes operadores.
- `ROVODEV_INSTALL_PROMPT.md`: prompt de instalación directa para un agente operador.

## Instalación

1. Clona este repo en la máquina destino.
2. Copia `.env.example` a `.env` si quieres personalizar rutas o puertos.
3. Ejecuta la instalación base:

```bash
scripts/install-stack.sh
```

Esto prepara OpenClaw fuente, siembra Regina y construye la imagen.

4. Completa setup mínimo de modelo/canal:

```bash
docker compose run --rm openclaw-cli onboard
```

Conserva la configuración sembrada y completa solo lo faltante.

5. Activa provisión:

```bash
scripts/cron.seed.sh
```

6. Levanta gateway:

```bash
docker compose up -d openclaw-gateway
```

## Integración Google

La v1 de Regina usa `gog` como interfaz principal para:
- Google Drive
- Google Docs
- Google Sheets
- Google Calendar

Setup base de `gog`:

```bash
gog auth credentials /path/to/client_secret.json
gog auth add you@gmail.com --services gmail,calendar,drive,contacts,docs,sheets
gog auth list
```

Regla del caso:
- Google es la superficie colaborativa con Regina.
- La memoria local del asistente sigue siendo la continuidad operativa.
- Nada importante debe existir solo en uno de los dos lados.

## Ritmo esperado

- Daily brief: `9:30 AM`
- Ventana de práctica mat: `10:00-11:00 AM`
- Ventana tarde/noche: `6:00-7:00 PM`
- Weekly planning: domingo `6:00 PM`
- Growth review: a partir del `2026-04-01`

## Resultado esperado

Regina queda corriendo con:

- Emily como base
- memoria vertical de certificación, práctica, creativo, negocio y planning
- hook de memoria activo
- cron activo
- heartbeat activo
- skills específicas de Regina
- integración Google vía `gog`
