PROMT A

Actúa como un Arquitecto de Software Senior, DevOps Engineer, Platform Engineer y AI Systems Architect especializado en:

* Linux
* Debian
* Developer Experience (DX)
* Repository Architecture
* Knowledge Management
* AI Agent Platforms
* OpenCode
* Claude Code
* Codex CLI
* Gemini CLI
* MCP (Model Context Protocol)
* Agent Engineering
* Prompt Engineering
* Workflow Automation
* Bootstrap Systems
* Configuration Management
* Infrastructure as Code
* Machine Learning Tooling
* Long-Term Technical Scalability

Tu misión es diseñar desde cero la arquitectura completa de un nuevo repositorio llamado:

ai-workspace

No debes limitarte a responder preguntas puntuales.

Debes actuar como si estuvieras diseñando la base de una plataforma personal de IA que deberá mantenerse, evolucionar y escalar durante los próximos 3 a 5 años.

---

# Contexto Personal

Soy estudiante de programación.

Actualmente poseo conocimientos en:

* Python
* HTML
* CSS
* JavaScript

Mis objetivos a largo plazo son especializarme en:

* Análisis de Datos
* Machine Learning
* Inteligencia Artificial
* Automatización
* Agentes de IA
* Sistemas basados en LLMs
* Productividad para desarrolladores

Por esta razón, todas las recomendaciones deben priorizar:

* simplicidad
* mantenibilidad
* escalabilidad
* reutilización
* independencia tecnológica
* facilidad de aprendizaje
* facilidad de reconstrucción del entorno

---

# Ecosistema Actual

Ya existe un repositorio independiente llamado:

linux-dev-workstation

Responsable de:

* Debian
* GNOME
* Dotfiles
* Kitty
* Zellij
* Yazi
* Bash
* Scripts personalizados
* Aplicaciones
* Bootstrap del sistema

Estructura aproximada:

linux-dev-workstation/
├── dotfiles/
├── gnome/
├── apps/
├── bootstrap/
├── docs/
└── scripts/

Objetivo:

Permitir reconstruir completamente una estación de trabajo Linux desde cero.

---

# Nuevo Repositorio

Se desea crear un segundo repositorio completamente separado llamado:

ai-workspace

Este repositorio será responsable exclusivamente de:

* OpenCode
* Claude Code
* Codex CLI
* Gemini CLI
* futuras plataformas equivalentes
* agentes
* subagentes
* skills
* MCPs
* prompts
* workflows
* automatizaciones
* estándares
* configuraciones relacionadas con IA

---

# Restricciones Arquitectónicas

1. OpenCode será inicialmente la plataforma principal.

2. Claude Code será incorporado posteriormente.

3. Codex CLI y Gemini CLI serán incorporados en el futuro.

4. El diseño debe soportar la incorporación futura de otras plataformas sin necesidad de reorganizar la arquitectura.

5. Los agentes deben ser reutilizables entre plataformas siempre que sea técnicamente posible.

6. El conocimiento debe estar separado de la ejecución.

7. Los repositorios deben permanecer públicos.

8. Ninguna API Key, Token, Secret o Credencial debe almacenarse en Git.

9. La arquitectura debe ser independiente del proveedor de IA.

10. Debe ser posible reemplazar OpenCode por otra plataforma sin reestructurar todo el repositorio.

11. Debe ser posible reconstruir todo mediante automatización.

12. Debe soportar crecimiento futuro a:

* 50+ agentes
* 100+ skills
* 20+ MCPs
* múltiples modelos
* múltiples plataformas

13. No se almacenarán investigaciones académicas, datasets ni experimentos de machine learning dentro de este repositorio.

14. Debe diseñarse para un horizonte de crecimiento de al menos 3 a 5 años.

---

# Objetivos del Repositorio

El repositorio debe permitir:

* instalación rápida en un equipo nuevo
* sincronización de configuraciones
* portabilidad
* versionado
* reutilización de agentes
* reutilización de prompts
* reutilización de workflows
* reutilización de estándares
* mantenimiento sencillo
* escalabilidad futura

---

# Arquitectura Inicial Considerada

La siguiente estructura es una propuesta preliminar:

ai-workspace/
│
├── platforms/
│   ├── opencode/
│   ├── claude-code/
│   ├── codex-cli/
│   └── gemini-cli/
│
├── agents/
│
├── mcps/
│
├── skills/
│
├── knowledge/
│   ├── prompts/
│   ├── standards/
│   ├── playbooks/
│   ├── workflows/
│   └── methodologies/
│
├── tests/
│
└── bootstrap/

No asumas que esta estructura es correcta.

Debes evaluarla críticamente.

---

# Tareas

## Parte 1 — Análisis Conceptual

Determina:

* responsabilidades exactas del repositorio
* qué debe contener
* qué no debe contener
* límites claros respecto a linux-dev-workstation
* ventajas y riesgos de la separación

---

## Parte 2 — Diseño de Arquitectura

Diseña la arquitectura definitiva.

Explica:

* estructura de carpetas
* estructura de módulos
* responsabilidades de cada directorio
* convenciones organizativas

Incluye árboles ASCII completos.

---

## Parte 3 — Organización de Plataformas

Diseña cómo organizar:

* OpenCode
* Claude Code
* Codex CLI
* Gemini CLI
* futuras plataformas

Explica:

* qué debe ser compartido
* qué debe ser específico
* cómo evitar duplicación

---

## Parte 4 — Organización de Agentes

Diseña:

* estructura de agentes
* estructura de subagentes
* metadatos
* documentación
* dependencias
* versionado

Incluye ejemplos reales.

---

## Parte 5 — Organización de Skills

Diseña:

* estructura interna
* dependencias
* reutilización
* documentación
* pruebas

Incluye ejemplos.

---

## Parte 6 — Organización de MCPs

Diseña:

* estructura recomendada
* integración
* instalación
* mantenimiento
* actualización

Explica cómo manejar MCPs propios y de terceros.

---

## Parte 7 — Gestión del Conocimiento

Diseña la estructura ideal para:

knowledge/
├── prompts/
├── standards/
├── playbooks/
├── workflows/
└── methodologies/

Explica claramente:

* qué pertenece a cada categoría
* qué no pertenece a cada categoría
* cómo evitar duplicidades

---

## Parte 8 — Seguridad

Diseña una estrategia profesional para:

* API Keys
* Tokens
* Variables de entorno
* Secrets
* Credenciales MCP

Explica:

* dónde almacenarlos
* cómo gestionarlos
* cómo sincronizarlos
* cómo mantener repositorios públicos

Incluye buenas prácticas y errores comunes.

---

## Parte 9 — Bootstrap

Diseña un sistema capaz de:

git clone ...
./bootstrap.sh

y obtener:

✓ Plataformas instaladas
✓ MCPs instalados
✓ Skills instaladas
✓ Agentes configurados
✓ Variables verificadas
✓ Dependencias instaladas
✓ Sistema validado

Describe:

* estructura de bootstrap
* flujo completo
* scripts necesarios
* verificaciones necesarias

---

## Parte 10 — Versionado

Diseña estrategias para:

* agentes
* skills
* MCPs
* prompts
* workflows

Incluye:

* Semantic Versioning
* ramas Git
* releases
* tags

---

## Parte 11 — Testing

Diseña una estrategia para:

* pruebas de agentes
* pruebas de skills
* pruebas de prompts
* pruebas de MCPs
* regresiones
* compatibilidad entre plataformas

Incluye estructura de directorios.

---

## Parte 12 — Escalabilidad

Simula el crecimiento futuro del repositorio con:

* 50 agentes
* 100 skills
* 20 MCPs
* múltiples plataformas
* múltiples modelos

Identifica:

* problemas potenciales
* cuellos de botella
* estrategias preventivas

---

## Parte 13 — Developer Experience

Diseña la experiencia ideal para:

* crear un nuevo agente
* crear una nueva skill
* instalar una nueva plataforma
* registrar un nuevo MCP
* actualizar configuraciones

Prioriza simplicidad y automatización.

---

## Parte 14 — Roadmap de Implementación

Divide la implementación en:

### Fase 1

Fundaciones mínimas.

### Fase 2

Integración OpenCode.

### Fase 3

Skills y MCPs.

### Fase 4

Claude Code.

### Fase 5

Multi-plataforma.

### Fase 6

Escalabilidad avanzada.

Explica prioridades y dependencias.

---

# Formato de Respuesta

La respuesta debe contener:

1. Diagnóstico.
2. Principios arquitectónicos.
3. Arquitectura propuesta.
4. Árboles de directorios completos.
5. Estrategia de seguridad.
6. Estrategia de bootstrap.
7. Estrategia de versionado.
8. Estrategia de testing.
9. Estrategia de escalabilidad.
10. Roadmap.
11. Riesgos futuros.
12. Recomendación final argumentada.

No asumas información faltante.

Si detectas ambigüedades o información insuficiente, realiza preguntas antes de emitir una recomendación definitiva.
