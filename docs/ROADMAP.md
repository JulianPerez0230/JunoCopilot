# Roadmap de JunoCopilot

## Propósito

Este roadmap describe la evolución estratégica de JunoCopilot. No es un calendario inmutable: cada fase se revisará utilizando evidencia obtenida durante el uso real.

El plan operativo de la primera alfa se encuentra en [plans/ALPHA_V0.1.md](plans/ALPHA_V0.1.md).

## Principios de ejecución

- Entregar recorridos completos antes que colecciones de funciones aisladas.
- Validar primero con JunoCopilot y después con un proyecto técnico independiente.
- Mantener una sola identidad con modos Tutor, Investigación y Trabajo.
- Conservar memoria independiente de los chats.
- Agregar autonomía únicamente después de validar permisos, utilidad y costo.
- Documentar decisiones, pruebas y contribuciones para el portafolio.

## Fase 0 — Definición

**Estado:** en cierre

### Objetivo

Definir qué problema resuelve Juno y cómo debe comportarse antes de implementar el sistema.

### Entregables

- [x] Visión.
- [x] Requisitos iniciales.
- [x] Arquitectura del MVP.
- [x] Roadmap estratégico.
- [x] Plan de cuatro semanas para Alpha v0.1.
- [ ] Revisión final de consistencia documental.

### Criterio de salida

El propósito, alcance, límites y recorrido principal del MVP pueden explicarse sin depender de código.

## Fase 1 — Alpha v0.1

**Horizonte:** cuatro semanas

### Objetivo

Construir una alfa supervisada que permita comenzar la facultad con continuidad de proyectos, captura rápida, organización básica y primeras funciones de Tutor e Investigación.

### Capacidades previstas

- identidad y modos de Juno;
- ChatGPT/Codex mediante OAuth;
- proyectos y memoria canónica;
- múltiples conversaciones con memoria independiente;
- sesiones y cierres aprobados;
- captura por Telegram;
- bandeja de entrada general;
- planificación semanal básica;
- Tutor alfa;
- Investigación alfa;
- validación con JunoCopilot y turbinas.

### Criterio de salida

El recorrido completo definido en el plan alfa funciona de forma reproducible, sin mezclar proyectos ni ejecutar acciones peligrosas.

## Fase 2 — Alpha v0.2: vida universitaria

### Objetivo

Convertir la alfa en una herramienta sostenible durante la cursada y mejorar las funciones que hayan demostrado utilidad.

### Posibles capacidades

- calendario y recordatorios confiables;
- correo universitario de solo lectura;
- expedientes por clase;
- énfasis del profesor y banco de preguntas;
- repaso espaciado adaptativo;
- estimaciones de tiempo basadas en sesiones reales;
- revisión diaria y semanal mejorada;
- router de modelos con proveedor gratuito aprobado;
- política de respaldo de JunoWorkspace.

### Decisión de alcance

Solo se implementarán las integraciones que reduzcan trabajo neto. Si mantener una conexión exige más esfuerzo del que ahorra, se pospondrá.

## Fase 3 — Herramientas de ingeniería

### Objetivo

Integrar herramientas técnicas mediante permisos explícitos y resultados estructurados.

### Posibles capacidades

- ejecución segura de Python;
- MATLAB en modo batch;
- compilación de LaTeX;
- integración controlada con Git;
- generación de tablas y figuras;
- comparación de resultados;
- preparación de documentación desde sesiones aprobadas.

### Condición de entrada

El sistema de permisos debe admitir allowlists, confirmaciones y registros suficientes para impedir ejecución arbitraria.

## Fase 4 — Knowledge Engine ampliado

### Objetivo

Fortalecer memoria, relaciones y recuperación sin depender del historial conversacional.

### Posibles capacidades

- relaciones entre proyectos, conceptos, papers y decisiones;
- búsqueda semántica;
- grafo de conocimiento;
- reconstrucción completa de índices;
- detección de contradicciones y conocimiento obsoleto;
- evolución del aprendizaje a largo plazo.

## Fase 5 — Organización personal y finanzas

### Objetivo

Extender Juno fuera del trabajo académico sin convertirlo en un sistema manual difícil de mantener.

### Posibles capacidades

- planificación adaptativa y equilibrio semanal;
- seguimiento de compromisos personales;
- gastos rápidos en ARS;
- conversiones de USDT;
- pagos y suscripciones;
- evaluaciones financieras bajo pedido;
- monitoreo liviano del equipo mediante métricas específicas.

## Fase 6 — Interfaz propia

### Objetivo

Construir una interfaz orientada a proyectos, aprendizaje y trazabilidad cuando los flujos reales ya estén validados.

### Posibles superficies

- proyectos y sesiones;
- chat general;
- indicador y selector de modo;
- estado, pendientes y decisiones;
- documentos y papers;
- progreso de aprendizaje;
- panel diario;
- uso de modelos, privacidad y costos.

## Fase 7 — Beta pública

### Objetivo

Permitir que otros estudiantes de ingeniería prueben Juno con instalación, datos y configuración propios.

### Requisitos previos

- separación confiable entre código y datos privados;
- instalación reproducible;
- documentación suficiente;
- datos de ejemplo;
- pruebas automatizadas;
- política de seguridad clara;
- licencia y contribución definidas;
- eliminación de supuestos exclusivos de Julián.

## Fase 8 — Versión 1.0

### Objetivo

Publicar una versión estable que demuestre el diferencial central:

> Un copiloto de IA para estudiantes de ingeniería que adapta su automatización al valor educativo de la tarea.

### Criterios generales

- utilidad demostrada con usuarios reales;
- comportamiento educativo verificable;
- memoria y trazabilidad confiables;
- costos y privacidad controlables;
- arquitectura portable;
- contribución personal claramente documentada.

## Revisión del roadmap

El roadmap se revisará:

- al finalizar cada semana de Alpha v0.1;
- después de la validación con turbinas;
- al concluir el primer mes de cursada;
- antes de iniciar una integración de alto riesgo o costo.

Las funciones pospuestas permanecen como posibilidades, no como compromisos. La experiencia real de uso tiene prioridad sobre este documento.

