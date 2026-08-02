# Plan de implementación — JunoCopilot Alpha v0.2

## Enfoque

**Vida universitaria y continuidad operativa.**

Alpha v0.2 debe hacer que Juno resulte sostenible durante una semana real de
cursada. La prioridad es integrar compromisos, pendientes, clases y tiempo
disponible sin exigir que el usuario mantenga varios sistemas manualmente.

## Objetivo

Juno debe poder consultar una semana de Google Calendar, reconciliarla con su
memoria local y proponer una planificación realista. Más adelante podrá crear o
modificar eventos únicamente después de una aprobación explícita.

## Alcance principal

### 1. Google Calendar en modo lectura

- [x] Conectar una cuenta de Google aprobada por el usuario.
- [x] Identificar los calendarios visibles y seleccionar cuáles puede consultar
  Juno.
- [x] Leer eventos dentro de un intervalo solicitado.
- [x] Interpretar correctamente fecha, hora, duración y zona horaria.
- [x] Distinguir eventos con horario de eventos de día completo.
- [x] No leer calendarios no aprobados.
- [x] No crear, modificar ni eliminar eventos durante este hito.

### 2. Reconciliación con la memoria local

- [x] Combinar eventos con tareas, entregas y compromisos confirmados del inbox.
- [x] Evitar duplicar un compromiso presente en Calendar y en JunoWorkspace.
- [x] Detectar solapamientos y tiempo realmente disponible.
- [x] Señalar información incompleta sin inventar horarios.
- [x] Mantener trazabilidad entre el evento y la planificación propuesta.

### 3. Planificación asistida

- [x] Generar una propuesta semanal a partir de Calendar y memoria local.
- [x] Proteger comidas, descanso, márgenes y transiciones.
- [x] Mostrar qué actividades desplazaría un nuevo compromiso.
- [x] Replanificar únicamente después de que el usuario elija o apruebe el
  ajuste.

### 4. Escritura controlada en Calendar

- [x] Crear un evento de prueba únicamente después de mostrar fecha, horario,
  zona horaria, calendario de destino y descripción.
- [x] Solicitar aprobación explícita antes de toda creación o modificación.
- [x] Verificar el evento después de escribirlo.
- [x] Conservar un registro local mínimo de la operación y su origen.
- [x] No eliminar eventos en Alpha v0.2.

### 5. Materias y clases

- [x] Crear registros de clase dentro de una materia.
- [x] Capturar notas, dudas y énfasis del profesor con poca fricción.
- [x] Relacionar clases con trabajos prácticos y proyectos sin mezclar sus
  memorias.
- [x] Preparar material acumulativo de estudio durante la cursada.
- [x] Mantener el repaso espaciado automático fuera de este Alpha.

El flujo de clase se validó el 2026-07-29 con Estructuras: el registro real se
guardó separado de la evidencia, el énfasis del profesor quedó trazable al tema
y una dificultad declarada se vinculó como contexto sin alterar la autonomía ni
programar retención automáticamente.

El borrador acumulativo se validó después usando clases, tema, comprensión,
retención y preguntas. Separó conocimiento técnico, criterio de cátedra y
comprensión demostrada, y declaró los materiales ausentes sin completar vacíos
por inferencia. La captura de clases mediante lotes de imágenes queda como una
prueba posterior de ingestión y no bloquea la salida de este Alpha.

### 6. Confiabilidad

- [x] Comprobar recuperación después de reiniciar el Gateway.
- [x] Explicar claramente cuándo Calendar no está disponible.
- [x] Mantener accesibles proyectos, materias y planes si falla Google.
- [ ] Definir y probar una política básica de respaldo de `JunoWorkspace`.
- [x] Verificar que los índices de sesiones e inbox permanezcan consistentes.

El respaldo automático se aplazó por decisión del usuario: no es necesario para
el funcionamiento actual y no bloqueará Alpha v0.2. Hasta que el workspace
acumule información difícil de reconstruir, las copias serán manuales y
opcionales.

## Validación de Calendar — 2026-07-27

Se validó la lectura de una semana, la detección de solapamientos, la comparación
con un plan local aprobado, la recuperación del plan desde otra conversación y
la creación confirmada de un evento ficticio. El usuario verificó el evento en
Google Calendar y lo eliminó manualmente.

La integración conserva bloqueadas las herramientas de actualización y
eliminación. La configuración, límites y procedimiento se documentan en
[`../integrations/GOOGLE_CALENDAR.md`](../integrations/GOOGLE_CALENDAR.md).

El calendario efectivo y aprobado para este Alpha es exclusivamente `primary`;
la integración instalada no enumera otros calendarios. El 2026-07-29 también se
validó un evento de día completo con fin exclusivo, verificación posterior,
registro local y eliminación manual fuera de Juno. Una prueba separada confirmó
que el panel puede prepararse desde plan, proyectos, inbox y sesiones sin usar
Google, declarando explícitamente qué compromisos externos quedan sin verificar.

Pendientes del bloque:

- ampliar a otros calendarios sólo cuando la integración permita enumerarlos y
  el usuario los apruebe explícitamente;

La reconciliación global se validó el 2026-07-28 combinando Calendar, el plan
semanal, el inventario de proyectos y el índice general del inbox. La prueba
detectó ausencias, vencimientos, una nota desactualizada y capturas sin destino
sin modificar archivos ni eventos. Las capturas antiguas se reconciliaron
separando aprobación, procesamiento y finalización.

## Primer hito verificable

> Juno consulta, sin modificarla, una semana de Google Calendar; combina sus
> eventos con los pendientes locales; detecta conflictos; y presenta una
> propuesta semanal con márgenes.

## Segundo hito verificable

> Con aprobación explícita, Juno crea un evento ficticio, verifica sus datos y
> conserva una referencia local de la operación. Juno no elimina eventos.

## Fuera de alcance

- eliminación de eventos;
- replanificación autónoma;
- envío de invitaciones a terceros;
- correo universitario;
- Moodle;
- repaso espaciado automático;
- finanzas;
- ejecución de MATLAB, Python, LaTeX o CAD;
- interfaz propia;
- servidor permanente en la nube.

## Criterio de salida

Durante una semana real de cursada, Juno puede usar eventos aprobados de Google
Calendar y memoria local para preparar y ajustar una planificación confiable,
sin modificar compromisos importantes sin consentimiento.
