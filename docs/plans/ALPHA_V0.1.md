# Plan de implementación — JunoCopilot Alpha v0.1

## Objetivo

Construir en cuatro semanas una alfa integrada y supervisada que permita:

- retomar y documentar proyectos;
- capturar información con poca fricción;
- comenzar la facultad con organización básica;
- probar los modos Tutor e Investigación;
- validar la arquitectura con JunoCopilot y turbinas.

## Dedicación

- Base: 3 horas diarias.
- Frecuencia: 5 o 6 días por semana.
- Extensión opcional: hasta 3 horas adicionales después de una pausa.
- Las horas adicionales se destinan primero a pruebas, correcciones y comprensión.
- No se agregan funciones nuevas mientras el entregable principal del día no funcione.

## Definición de terminado

Una tarea se considera terminada cuando:

1. funciona en el caso previsto;
2. el usuario puede explicar qué hace;
3. tiene una prueba o procedimiento de verificación;
4. no amplía permisos sin aprobación;
5. la documentación relevante está actualizada.

## Semana 1 — Núcleo de Juno

### Objetivo

Conversar con Juno y recuperar un proyecto desde una sesión nueva.

### Preparación

- [x] Inicializar Git.
- [x] Agregar licencia de código abierto.
- [x] Crear `.gitignore`.
- [x] Crear `JunoWorkspace` privado.
- [x] Documentar separación entre código, datos y estado de OpenClaw.

### OpenClaw

- [x] Verificar versión instalada.
- [x] Resolver disponibilidad del comando en PowerShell.
- [x] Configurar ChatGPT/Codex OAuth.
- [x] Usar el runtime interno de OpenClaw para conservar las herramientas de archivos con la política restringida.
- [x] Cambiar el workspace activo a `JunoWorkspace`.
- [x] Mantener Gateway local y enlazado a loopback.
- [x] Bloquear ejecución de comandos para el MVP.
- [x] Revisar la autenticación de la interfaz local.

### Identidad y modos

- [x] Crear identidad e instrucciones iniciales de Juno.
- [x] Implementar `Auto` como selección predeterminada.
- [x] Definir Tutor, Investigación y Trabajo.
- [x] Mostrar etiqueta breve de modo y modelo.
- [x] Permitir cambio manual y regreso a `Auto`.
- [x] Comprobar que cambiar de modo no cambia el proyecto activo.

### Proyectos y memoria

- [x] Crear plantilla de proyecto.
- [x] Crear archivos canónicos Markdown.
- [x] Definir `project.yaml`.
- [x] Crear estructura de sesiones, inbox, adjuntos y archivo.
- [x] Crear proyecto interno `junocopilot`.
- [x] Crear proyecto externo `turbines` con datos mínimos ficticios o aprobados.
- [x] Implementar selección y apertura de proyecto.
- [ ] Preparar la interfaz del índice SQLite (pospuesto; Markdown cubre el recorrido básico).
- [ ] Implementar SQLite solo si una necesidad medida justifica agregarlo.

### Criterio semanal

Desde una conversación nueva, Juno abre JunoCopilot, muestra su estado y recupera el próximo paso sin leer chats anteriores.

## Semana 2 — Sesiones, captura y organización

### Objetivo

Conservar el trabajo diario y recibir capturas desde el celular.

### Sesiones

- [x] Iniciar una sesión con objetivo concreto.
- [x] Mantener un único proyecto activo por sesión.
- [x] Detectar ideas, decisiones, fundamentos y pendientes.
- [x] Acumular elementos sin interrumpir.
- [x] Preparar cierre breve.
- [x] Permitir corrección y aprobación.
- [x] Actualizar memoria canónica después de aprobar.
- [x] Recuperar el estado desde una sesión posterior.

### Captura universal

- [x] Crear inbox general.
- [x] Clasificar ideas, tareas, fechas, gastos y contenido académico.
- [x] Convertir fechas relativas en fechas absolutas.
- [x] Pedir confirmación solo para elementos importantes o ambiguos.
- [x] Mantener material original revisable.

### Telegram

- [x] Crear y proteger el bot.
- [x] Configurar Telegram únicamente para captura.
- [x] Limitar remitentes autorizados.
- [x] Probar mensajes pendientes con la computadora apagada.
- [x] Procesar la cola al iniciar el Gateway dentro de 24 horas.
- [x] Impedir ejecución de acciones desde Telegram.

### Organización alfa

- [x] Crear propuesta de planificación semanal manual.
- [x] Usar horarios con márgenes y transiciones.
- [x] Proteger comidas, descanso y estiramiento mínimo.
- [x] Crear revisión diaria breve.
- [x] Mostrar consecuencias antes de replanificar.

### Criterio semanal

Un mensaje y una fecha enviados por Telegram con la PC apagada se recuperan y clasifican. Una sesión de proyecto se cierra, aprueba y recupera correctamente al día siguiente.

## Semana 3 — Tutor e Investigación alfa

### Objetivo

Validar los dos comportamientos educativos principales sin construir todavía sistemas completos.

### Tutor alfa

- [x] Crear una materia y sus temas.
- [x] Incorporar un PDF o apunte.
- [x] Permitir exploración inicial por el usuario.
- [x] Identificar temas centrales.
- [x] Registrar énfasis del profesor manualmente.
- [x] Proponer diagnóstico breve opcional.
- [x] Implementar preguntas y pistas progresivas.
- [x] Registrar explicación propia, ejercicio aplicado y autonomía.
- [x] Comprobar y registrar retención en una sesión posterior.
- [x] Crear resumen y banco inicial de preguntas.
- [ ] Evitar repasos durante concentración o urgencias (pospuesto; la cadencia
  adaptativa madura queda fuera del Alpha v0.1).

### Investigación alfa

- [x] Incorporar un paper.
- [x] Extraer problema, objetivo y fundamentos.
- [x] Extraer metodología, resultados y conclusiones.
- [x] Registrar limitaciones.
- [x] Guardar citas con página verificable.
- [x] Registrar utilidad para el proyecto.
- [x] Proponer una relación lateral con justificación.
- [x] Diferenciar hechos, inferencias y opiniones.

### Integración de modos

- [x] Cambiar automáticamente por turno o tarea.
- [x] Mostrar modo actual.
- [x] Permitir anulación manual.
- [x] Mantener proyecto y memoria durante el cambio.

### Criterios semanales

- Tutor: después de explorar un apunte, Juno realiza un cuestionario breve y conserva evidencia inicial de dominio.
- Investigación: Juno genera una ficha de paper cuyas citas y páginas pueden verificarse.
- Modos: una sesión pasa de Trabajo a Tutor y vuelve sin perder el proyecto activo.

## Semana 4 — Validación, seguridad y portafolio

### Objetivo

Convertir los prototipos en una alfa integrada, explicable y demostrable.

### Validación interna

- [x] Usar Juno para documentar su propio desarrollo.
- [x] Ejecutar varias sesiones desde chats diferentes.
- [x] Reemplazar una decisión sin perder su historial.
- [x] Recuperar un cierre provisional o incompleto.

### Validación con turbinas

- [x] Abrir el proyecto desde una conversación nueva.
- [x] Registrar fundamento, idea y pendiente.
- [x] Cambiar entre Trabajo, Tutor e Investigación.
- [x] Analizar un paper relacionado.
- [x] Cerrar y recuperar la sesión.
- [x] Verificar que no se mezcle información de JunoCopilot.

### Seguridad y robustez

- [x] Revisar permisos efectivos de OpenClaw.
- [x] Verificar que los comandos permanezcan bloqueados.
- [x] Comprobar que JunoCopilot no se modifica durante el uso normal.
- [x] Verificar políticas de proveedor y etiquetas.
- [x] Validar navegación y lectura de fuentes web públicas.
- [x] Verificar aprobación previa para descargas y otras acciones web externas.
- [x] Revisar y probar el registro de envíos externos sin guardar prompts,
  credenciales ni contenido completo.
- [x] Probar entradas ambiguas y archivos faltantes.
- [x] Medir almacenamiento: línea base de `JunoWorkspace` al 2026-07-24,
  1,364 GiB en 378 archivos.
- [ ] Probar reconstrucción del índice SQLite, si está implementado.

### Resiliencia y costos

- [x] Probar Juno sin el proveedor experimental de Gemini.
- [x] Documentar qué ocurre cuando el OAuth de OpenAI no está disponible.
- [x] Diseñar y probar una captura en bruto que conserve mensajes cuando el
  clasificador no esté disponible, sin ejecutar acciones ni perder su fuente y
  fecha.
- [x] Definir y probar una ruta gratuita de bajo riesgo: clasificación acotada
  mediante `llm-task`, Groq y `llama-3.3-70b-versatile`, sin enviar memoria ni
  contexto completo.
- [ ] Establecer un presupuesto mensual máximo, sin recarga automática
  (pospuesto hasta incorporar una API paga).
- [ ] Medir qué tareas requieren Sol y cuáles pueden resolverse con modelos más
  económicos antes de asignar rutas permanentes.
- [x] Verificar que proyectos, memoria e inbox continúen accesibles aunque se
  cambie o elimine un proveedor (prueba sin Gemini completada).

### Portafolio

- [ ] Actualizar README y documentos técnicos.
- [ ] Registrar decisiones arquitectónicas importantes.
- [ ] Documentar instalación y uso.
- [ ] Preparar datos de ejemplo no sensibles.
- [ ] Crear una demostración reproducible.
- [x] Registrar limitaciones conocidas.
- [ ] Crear backlog de Alpha v0.2.

### Criterio final

El siguiente recorrido debe funcionar sin mezclar proyectos ni depender de chats anteriores:

```text
planificar semana
→ capturar desde Telegram
→ abrir proyecto
→ recuperar contexto
→ iniciar sesión
→ cambiar de modo
→ cerrar y aprobar
→ retomar desde otro chat
→ estudiar un tema
→ analizar un paper
```

## Fuera de alcance

- correo y Moodle automáticos;
- sincronización completa de calendarios;
- finanzas avanzadas e inversiones;
- repaso espaciado maduro;
- Knowledge Graph completo;
- MATLAB, Python, LaTeX, CAD y OpenFOAM;
- monitoreo del equipo;
- interfaz propia;
- servidor permanente en la nube;
- agentes autónomos;
- versión pública estable.

## Riesgos y respuesta

| Riesgo | Respuesta |
|---|---|
| OpenClaw requiere más configuración de la esperada | Mantener memoria y plantillas independientes; reducir integración inicial |
| Telegram consume demasiado tiempo | Conservar captura manual desde la interfaz y mover Telegram a tarea opcional |
| Tutor mide mal el dominio | Mostrar evidencia separada y evitar un porcentaje único |
| Extracción de PDFs pierde páginas | Exigir verificación y conservar el original |
| Aparecen demasiadas ideas nuevas | Registrarlas en backlog sin incorporarlas a Alpha v0.1 |
| El alcance no entra en cuatro semanas | Priorizar proyectos, sesiones y captura; degradar Tutor e Investigación a demostraciones mínimas |

## Revisión semanal

Al finalizar cada semana se debe responder:

1. ¿Qué recorrido completo funciona?
2. ¿Qué parte no entiende todavía el usuario?
3. ¿Qué función generó trabajo en vez de ahorrarlo?
4. ¿Qué riesgo o permiso nuevo apareció?
5. ¿Qué se elimina o pospone para proteger la siguiente semana?
