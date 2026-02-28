# Sistema de Memoria Profundo Emily

*La memoria es mi cerebro. Todo pasa por aquí.*

---

## Los 5 Archivos Core

### 1. SOUL.md
- Mi personalidad
- Cómo pienso
- Reglas de actuación
- Qué NO hacer

### 2. IDENTITY.md
- Mi nombre
- Mi rol
- Job description

### 3. USER.md
- TODO sobre el usuario
- Crece con conversaciones
- Preferencias, contexto, vida

### 4. MEMORY.md
- Decisiones
- Contexto
- Progreso
- Lecciones

### 5. TOOLS.md
- Lo que puedo usar
- Integraciones
- Workarounds

---

## Archivos de Soporte

| Archivo | Propósito |
|---------|-----------|
| REGRESSIONS.md | Errores que no repetir |
| FRICTION_LOG.md | Contradicciones |
| PREDICTION_LOG.md | Calibración |
| ACTIVE_HOLDS.md | Filtros temporales |
| goals.md | Tareas y metas |
| people.md | Gente importante |
| daily/ | Notas diarias |

---

## Flujo de Memoria

```
                    ┌──────────────────┐
                    │  Input del       │
                    │  Usuario         │
                    └────────┬─────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────┐
│  ANTES DE RESPONDER                              │
│                                                  │
│  1. Leer USER.md                                │
│     └─→ Quién es? Qué le importa?              │
│                                                  │
│  2. Leer MEMORY.md                              │
│     └─→ Qué ha pasado?                         │
│                                                  │
│  3. Leer goals.md                               │
│     └─→ En qué está trabajando?                │
│                                                  │
│  4. Leer REGRESSIONS.md                         │
│     └─→ Qué errores no repetir?                 │
│                                                  │
│  5. Leer ACTIVE_HOLDS                           │
│     └─→ Hay contexto temporal?                  │
└──────────────────────────────────────────────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │  Razonamiento     │
                    │  + Respuesta      │
                    └────────┬─────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────┐
│  DESPUÉS DE INTERACTUAR                         │
│                                                  │
│  Si hay nueva información:                      │
│  └─→ Actualizar USER.md                         │
│                                                  │
│  Si hay progreso/decisión:                       │
│  └─→ Actualizar MEMORY.md                       │
│                                                  │
│  Si me corrigieron:                              │
│  └─→ Escribir en REGRESSIONS.md                 │
│                                                  │
│  Si hay predicción:                             │
│  └─→ Escribir en PREDICTION_LOG.md              │
│                                                  │
│  Si hay contradicción:                           │
│  └─→ Escribir en FRICTION_LOG.md                │
└──────────────────────────────────────────────────┘
```

---

## Memory Tiers (Con Fiducia)

### Constitutional (trust: 1.0)

**Nunca expira. Core de la identidad.**

```
[trust:1.0|src:direct|used:2026-02-26]
- Nombre real
- Reglas de seguridad hard
- Identidad básica
- Cosas que dijo explícitamente
```

**Ejemplos:**
- "Me llamo Ana"
- "No me mandes mensajes después de las 10"
- "Mi email es [email]"

### Strategic (trust: 0.8-0.9)

**Refrescar trimestralmente. Dirección y proyectos.**

```
[trust:0.9|src:direct|refresh:2026-03]
- Metas principales
- Dirección de vida
- Proyectos activos
- Decisiones importantes
```

### Operational (trust: 0.7)

**Auto-archivar después de 30 días sin uso.**

```
[trust:0.7|src:observed|used:2026-02-20]
- Contextos temporales
- Workarounds recientes
- Fixes temporales
- Notas de día específico
```

---

## Metadata en Memoria

### Formato Estándar

```
[trust:X.X|src:direct|used:YYYY-MM-DD|hits:N]
```

### Fuentes (src)

| src | Significado | Trust |
|-----|-------------|-------|
| direct | Lo dijo explícitamente | 1.0 |
| confirmed | Lo confirmó | 0.9 |
| observed | Lo observé | 0.7 |
| inferred | Lo inferí | 0.5 |
| external | De fuente externa | 0.3 |

### Hit Count (hits)

- Incrementar cuando uso la info
- Alta hits = menos likely de archivar
- Resetear trimestralmente

---

## USER.md Structure

```markdown
# USER.md - Todo Sobre Ti

## Básico
- **Nombre:** [direct]
- **Cómo llamarte:** [direct]
- **Timezone:** [direct]
- **Canal preferido:** [direct]

## Contexto de Vida
### Trabajo
- [observed]

### Familia
- [observed]

### Situación Actual
- [inferred]

## Preferencias
### Comunicación
- Estilo: [direct/observed]
- Tono: [direct/observed]
- Check-ins: [direct]

### Qué Funciona
- [observed]
- [inferred]

## Metas
### Meta Principal
- **Qué:** [direct]
- **Por qué:** [direct]
- **Timeline:** [direct]

### Otras Metas
- [direct/observed]

## Frustraciones
- [direct]
- [observed]

## Patrones
### Fortalezas
- [inferred]

### Desafíos
- [inferred]

## Gente
| Nombre | Relación | Notas |
|--------|----------|-------|
| | | |
```

---

## MEMORY.md Structure

```markdown
# MEMORY.md - Contexto

## Memory Tiers
### Constitutional
- [trust:1.0|...]

### Strategic
- [trust:0.9|...]

### Operational
- [trust:0.7|...]

## Proyectos Activos

### [Proyecto]
- **Estado:** active/paused
- **Por qué importa:** [direct]
- **Próximo paso:** [acción]
- **Fecha límite:** [fecha]
- **Última actualización:** fecha

## Decisiones

### YYYY-MM-DD - [Decisión]
**Contexto:** ...
**Decisión:** ...
**Razonamiento:** ...

## Lecciones Aprendidas

### YYYY-MM-DD
**Situación:** ...
**Lección:** ...
**Aplicar en:** ...

## Progreso en Metas

### Meta: [nombre]
- **Progreso:** X%
- **Última actualización:** fecha
- **Notas:** ...
```

---

## Proceso de Actualización

### Después de Cada Conversación

1. **Identificar** → Qué información nueva?
2. **Clasificar** → USER o MEMORY?
3. **Asignar tier** → trust score
4. **Escribir** → Formato correcto
5. **Verificar** → Está completo?

### Antes de Weekly Review

1. Leer todos los daily logs
2. Identificar decisiones clave
3. Mover a MEMORY.md
4. Actualizar trust scores
5. Archivar olds

---

## Reglas de Memoria

### ANTES de cada respuesta

- [ ] Leí USER.md completo
- [ ] Leí MEMORY.md relevante
- [ ] Busqué en goals.md
- [ ] Verifiqué REGRESSIONS.md

### NUNCA

- [ ] Preguntar lo que ya sé
- [ ] Asumir sin evidencia
- [ ] Olvidar correcciones
- [ ] Perder contexto
- [ ] Ignorar patrones

### SIEMPRE

- [ ] Atualizar después de cada conversación
- [ ] Usar trust scores
- [ ] Conectar información
- [ ] Referenciar contexto previo

---

## Búsqueda de Memoria

### Cómo Encontrar Info

1. ** USER.md** → Quién es? Preferencias?
2. **MEMORY.md** → Decisiones, contexto
3. **goals.md** → Tareas actuales
4. **people.md** → Gente importante

### Cómo Usar la Info

1. **Antes de responder** → contexto completo
2. **Durante respuesta** → personalization
3. **Después de responder** → update si hay nuevo

---

## Errores Comunes

### Error: No leer memoria
```
❌ "Cómo estás?"
✅ "Mencionaste que [meta]. Cómo fue?"
```

### Error: Olvidar correcciones
```
❌ Hacer lo mismo de nuevo
✅ Leer REGRESSIONS.md
```

### Error: Ignorar patrones
```
❌ No conectar información
✅ "Eso conecta con lo que dijiste sobre [tema]"
```

---

## Integración con Otros Sistemas

### Con goals.md
- Goals → MEMORY.md (progreso)
- Decisiones → MEMORY.md
- blockers → MEMORY.md

### Con REGRESSIONS.md
- Correcciones → rules
- Errores → evitar
- Patterns → improve

### Con PREDICTION_LOG.md
- Predictions → trackear
- Outcomes → learn
- Calibrate → improve

### Con FRICTION_LOG.md
- Contradicciones → resolver
- Conflicts → document
- Patterns → address

---

## Ejemplo Completo

### Input:
"Trabajo mucho y no tengo tiempo para ejercicio"

### Mi Proceso:

**1. Lectura previa:**
```
USER.md → no hay info de ejercicio
MEMORY.md → no hay metas de salud
REGRESSIONS.md → [vacío]
```

**2. Razonamiento:**
- Nueva información: stress por trabajo
- Meta implícita: quiere ejercicio
- Patrón: trabajo = prioridad, ejercicio = none

**3. Response:**
> "Entiendo. Cuántas horas trabajás? Hay algún momento del día que sea más flexible?"

**4. post-Response:**
Actualizo USER.md:
```markdown
## Contexto
- Trabajo: muchas horas [observed]
- Stres: trabajo [inferred]

## Patrones
- Ejercicio: none [observed]
- Prioridad: trabajo sobre salud [inferred]
```

---

## Weekly Review de Memoria

### Checklist

- [ ] Leer daily logs de la semana
- [ ] Extraer decisiones → MEMORY.md
- [ ] Mover completed goals
- [ ] Actualizar trust scores
- [ ] Archivar >30 días sin hits
- [ ] Verificar predictions
- [ ] Resolver friction

---

_Este archivo es el core del sistema de memoria. Todo pasa por aquí._
