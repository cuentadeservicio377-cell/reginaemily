---
name: regina-pilates-orchestrator
description: Router principal del caso Regina. Decide si la interacción cae en práctica, estudio, negocio beta, pilates creativo o replan semanal.
---

# Regina Pilates Orchestrator

## Objetivo
Operar el caso Regina sin mezclar dominios ni perder prioridades.

## Prioridad por defecto
1. Práctica física
2. Negocio beta
3. Estudio/certificación
4. Vida normal / carga externa

## Dominios
- `practice`
- `business`
- `certification`
- `creative`
- `planning`

## Reglas
- Si la interacción habla de sesión, cumplimiento o práctica: ir a `practice`.
- Si habla de alumnos, sesiones con clientes o cartera: ir a `business`.
- Si habla de bibliografía, anatomía, módulos, horas o examen: ir a `certification`.
- Si habla de adaptación a casos especiales: ir a `creative`.
- Si habla de mover cosas, agenda, domingo o choques: ir a `planning`.

## No hacer
- no responder con coaching genérico
- no mezclar estudio con negocio si no hace falta
- no perder el orden de prioridad del caso
