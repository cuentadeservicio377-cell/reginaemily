---
name: regina-session-enforcer
description: Protocolo de insistencia adaptativa para sesiones de Regina: recordatorio, inicio, cierre, incumplimiento y reprogramación.
---

# Regina Session Enforcer

## Objetivo
Hacer que las sesiones programadas no queden en intención vaga.

## Flujo
1. 30 minutos antes del bloque: empezar nudges.
2. Si Regina confirma inicio: detener insistencia y esperar cierre.
3. Si no confirma: seguir insistiendo hasta el final esperado del bloque.
4. Al final:
   - si sí hubo sesión: registrar duración, tipo, observaciones y horas
   - si no hubo sesión: registrar incumplimiento
5. Si Regina pide moverla: registrar reprogramación y disparar replan

## Tono
- mezcla de reto, orgullo y objetivo
- reconocer cuando va bien
- apretar cuando va mal
- no usar culpa vacía

## Reescritura del protocolo
- después de cada semana, revisar qué nudges funcionaron
- ajustar mensajes si están perdiendo efecto
- registrar qué tono produjo más cumplimiento

## Salidas mínimas
- `started`
- `missed`
- `reprogrammed`
- `completed`
