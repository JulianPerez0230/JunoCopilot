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

- [ ] Inicializar Git.
- [ ] Agregar licencia de código abierto.
- [ ] Crear `.gitignore`.
- [ ] Crear `JunoWorkspace` privado.
- [ ] Documentar separación entre código, datos y estado de OpenClaw.

### OpenClaw

- [ ] Verificar versión instalada.
- [ ] Resolver disponibilidad del comando en PowerShell.
- [ ] Configurar ChatGPT/Codex OAuth.
- [ ] Cambiar el workspace activo a `JunoWorkspace`.
- [ ] Mantener Gateway local y enlazado a loopback.
- [ ] Bloquear ejecución de comandos para el MVP.
- [ ] Revisar la autenticación de la interfaz local.

### Identidad y modos

- [ ] Crear identidad e instrucciones iniciales de Juno.
- [ ] Implementar `Auto` como selección predeterminada.
- [ ] Definir Tutor, Investigación y Trabajo.
- [ ] Mostrar etiqueta breve de modo y modelo.
- [ ] Permitir cambio manual y regreso a `Auto`.
- [ ] Comprobar que cambiar de modo no cambia el proyecto activo.

### Proyectos y memoria

- [ ] Crear plantilla de proyecto.
- [ ] Crear archivos canónicos Markdown.
- [ ] Definir `project.yaml`.
- [ ] Crear estructura de sesiones, inbox, adjuntos y archivo.
- [ ] Crear proyecto interno `junocopilot`.
- [ ] Crear proyecto externo `turbines` con datos mínimos ficticios o aprobados.
- [ ] Implementar selección y apertura de proyecto.
- [ ] Preparar la interfaz del índice SQLite.
- [ ] Implementar SQLite solo si no bloquea el recorrido básico.

### Criterio semanal

Desde una conversación nueva, Juno abre JunoCopilot, muestra su estado y recupera el próximo paso sin leer chats anteriores.

## Semana 2 — Sesiones, captura y organización

### Objetivo

Conservar el trabajo diario y recibir capturas desde el celular.

### Sesiones

- [ ] Iniciar una sesión con objetivo concreto.
- [ ] Mantener un único proyecto activo por sesión.
- [ ] Detectar ideas, decisiones, fundamentos y pendientes.
- [ ] Acumular elementos sin interrumpir.
- [ ] Preparar cierre breve.
- [ ] Permitir corrección y aprobación.
- [ ] Actualizar memoria canónica después de aprobar.
- [ ] Recuperar el estado desde una sesión posterior.

### Captura universal

- [ ] Crear inbox general.
- [ ] Clasificar ideas, tareas, fechas, gastos y contenido académico.
- [ ] Convertir fechas relativas en fechas absolutas.
- [ ] Pedir confirmación solo para elementos importantes o ambiguos.
- [ ] Mantener material original revisable.

### Telegram

- [ ] Crear y proteger el bot.
- [ ] Configurar Telegram únicamente para captura.
- [ ] Limitar remitentes autorizados.
- [ ] Probar mensajes pendientes con la computadora apagada.
- [ ] Procesar la cola al iniciar el Gateway dentro de 24 horas.
- [ ] Impedir ejecución de acciones desde Telegram.

### Organización alfa

- [ ] Crear propuesta de planificación semanal manual.
- [ ] Usar horarios con márgenes y transiciones.
- [ ] Proteger comidas, descanso y estiramiento mínimo.
- [ ] Crear revisión diaria breve.
- [ ] Mostrar consecuencias antes de replanificar.

### Criterio semanal

Un mensaje y una fecha enviados por Telegram con la PC apagada se recuperan y clasifican. Una sesión de proyecto se cierra, aprueba y recupera correctamente al día siguiente.

## Semana 3 — Tutor e Investigación alfa

### Objetivo

Validar los dos comportamientos educativos principales sin construir todavía sistemas completos.

### Tutor alfa

- [ ] Crear una materia y sus temas.
- [ ] Incorporar un PDF o apunte.
- [ ] Permitir exploración inicial por el usuario.
- [ ] Identificar temas centrales.
- [ ] Registrar énfasis del profesor manualmente.
- [ ] Proponer diagnóstico breve opcional.
- [ ] Implementar preguntas y pistas progresivas.
- [ ] Registrar explicación propia, ejercicios, autonomía y retención.
- [ ] Crear resumen y banco inicial de preguntas.
- [ ] Evitar repasos durante concentración o urgencias.

### Investigación alfa

- [ ] Incorporar un paper.
- [ ] Extraer problema, objetivo y fundamentos.
- [ ] Extraer metodología, resultados y conclusiones.
- [ ] Registrar limitaciones.
- [ ] Guardar citas con página verificable.
- [ ] Registrar utilidad para el proyecto.
- [ ] Proponer una relación lateral con justificación.
- [ ] Diferenciar hechos, inferencias y opiniones.

### Integración de modos

- [ ] Cambiar automáticamente por turno o tarea.
- [ ] Mostrar modo actual.
- [ ] Permitir anulación manual.
- [ ] Mantener proyecto y memoria durante el cambio.

### Criterios semanales

- Tutor: después de explorar un apunte, Juno realiza un cuestionario breve y conserva evidencia inicial de dominio.
- Investigación: Juno genera una ficha de paper cuyas citas y páginas pueden verificarse.
- Modos: una sesión pasa de Trabajo a Tutor y vuelve sin perder el proyecto activo.

## Semana 4 — Validación, seguridad y portafolio

### Objetivo

Convertir los prototipos en una alfa integrada, explicable y demostrable.

### Validación interna

- [ ] Usar Juno para documentar su propio desarrollo.
- [ ] Ejecutar varias sesiones desde chats diferentes.
- [ ] Reemplazar una decisión sin perder su historial.
- [ ] Recuperar un cierre provisional o incompleto.

### Validación con turbinas

- [ ] Abrir el proyecto desde una conversación nueva.
- [ ] Registrar fundamento, idea y pendiente.
- [ ] Cambiar entre Trabajo, Tutor e Investigación.
- [ ] Analizar un paper relacionado.
- [ ] Cerrar y recuperar la sesión.
- [ ] Verificar que no se mezcle información de JunoCopilot.

### Seguridad y robustez

- [ ] Revisar permisos efectivos de OpenClaw.
- [ ] Verificar que los comandos permanezcan bloqueados.
- [ ] Comprobar que JunoCopilot no se modifica durante el uso normal.
- [ ] Verificar políticas de proveedor y etiquetas.
- [ ] Revisar el registro de envíos externos.
- [ ] Probar entradas ambiguas y archivos faltantes.
- [ ] Medir almacenamiento.
- [ ] Probar reconstrucción del índice SQLite, si está implementado.

### Portafolio

- [ ] Actualizar README y documentos técnicos.
- [ ] Registrar decisiones arquitectónicas importantes.
- [ ] Documentar instalación y uso.
- [ ] Preparar datos de ejemplo no sensibles.
- [ ] Crear una demostración reproducible.
- [ ] Registrar limitaciones conocidas.
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

