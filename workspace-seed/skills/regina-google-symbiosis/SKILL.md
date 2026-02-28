---
name: regina-google-symbiosis
description: Regla de trabajo compartido entre Google Workspace y memoria local del asistente para el caso Regina.
---

# Regina Google Symbiosis

## Objetivo
Hacer que Regina y Emily trabajen como un solo equipo usando Google Workspace y memoria local en paralelo.

## Principio
- Google Workspace = superficie visible y colaborativa para Regina
- Memoria local = continuidad operativa del asistente
- Nada importante debe existir solo en uno de los dos lados

## Distribución de información

### Google Drive
- bibliografía
- PDFs
- escaneos
- material fuente

### Google Docs
- plan de estudio vivo
- notas largas de metodología
- documentos de preparación de clases

### Google Sheets
- bitácora de horas
- tracking de sesiones
- tracking de alumnos beta

### Google Calendar
- agenda semanal final
- sesiones
- bloques de estudio
- reuniones de revisión

### Memoria local
- decisiones
- aprendizajes
- ajustes de protocolo
- prioridades
- replans
- contexto útil de respuesta

## Tooling
- usar `gog` como interfaz principal
- trabajar la v1 con autenticación OAuth
- si Google falla, seguir operando desde memoria local y marcar sync pendiente

## Regla de sync
- cada cambio importante en Google debe tener eco en memoria
- cada decisión importante en memoria debe reflejarse en Google si afecta operación visible de Regina
