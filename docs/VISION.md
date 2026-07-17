# Visión de JunoCopilot

**A Learning-Oriented Open-Source AI Copilot for Engineering Students**

## Propósito

JunoCopilot es un asistente personal orientado al aprendizaje, los proyectos de ingeniería y la organización cotidiana. Su propósito es conservar el contexto y el razonamiento del usuario, reducir el trabajo mecánico y ayudarlo a tomar decisiones conscientes sin reemplazar su criterio.

Juno no busca maximizar cuánto trabajo hace la inteligencia artificial. Busca que el usuario aprenda, mantenga la autoría intelectual de su trabajo y pueda avanzar sin perder ideas, fundamentos ni continuidad.

La idea central se resume en:

> Automatizar lo repetitivo, acompañar el razonamiento y preservar la autoridad del usuario.

## Problema que busca resolver

Durante un proyecto o una materia aparecen ideas, decisiones, fundamentos, dudas y próximos pasos que suelen perderse cuando termina la sesión. Documentarlos después exige reconstruir lo ocurrido, muchas veces cuando el razonamiento ya no está fresco.

También resulta difícil sostener un sistema manual de organización. Las entregas, el estudio, los proyectos, las finanzas y el descanso compiten por atención, mientras que las herramientas tradicionales exigen registrar y clasificar todo de forma constante.

Juno debe reducir esa carga mediante captura rápida, organización posterior y recuperación clara del contexto.

## Experiencia deseada

### Al comenzar el día

Juno presenta un panel breve, únicamente con información relevante:

1. entregas, vencimientos y urgencias;
2. correos importantes de la universidad, profesores, becas y respuestas esperadas;
3. situación financiera relevante para decisiones próximas;
4. novedades de temas seguidos;
5. estado de proyectos activos.

Las noticias no deben aparecer por obligación. Solo se muestran cuando pertenecen a un tema seguido o tienen importancia suficiente. Los temas iniciales incluyen Colombia, Argentina, economía e inversiones relacionadas con el usuario y novedades aeroespaciales interesantes.

### Durante el día

Telegram funciona como una bandeja de entrada rápida. El usuario puede enviar mensajes, fechas, gastos, ideas o fotos de apuntes sin organizarlos en el momento.

Juno conserva las capturas pendientes mientras la computadora está apagada y las procesa cuando vuelve a iniciarse el Gateway, suponiendo desconexiones habituales inferiores a 24 horas.

Las interrupciones deben ser mínimas. Juno no corta una sesión concentrada para clasificar cada idea ni para iniciar repasos inesperados.

### Al estudiar

El usuario explora primero el material original, porque el contenido y el énfasis de la cátedra pueden diferir de una explicación genérica de IA. Después, Juno puede realizar un diagnóstico breve, ayudar con teoría y ejercicios y comprobar que el usuario pueda explicar el tema con sus propias palabras.

Juno construye progresivamente material para el examen y conserva:

- temas centrales;
- énfasis del profesor;
- ejemplos y ejercicios de clase;
- dudas y errores frecuentes;
- fórmulas con significado y condiciones de uso;
- preguntas de repaso;
- evolución de la comprensión y la retención.

Los repasos se proponen estratégicamente, preferentemente al inicio de una sesión tranquila y siempre pidiendo permiso. Nunca interrumpen trabajo urgente o concentración activa.

### Al trabajar en un proyecto

Juno recupera rápidamente:

- el problema y el objetivo;
- el sistema o arquitectura vigente;
- lo último realizado;
- las decisiones y sus fundamentos;
- las ideas pendientes;
- los resultados y conclusiones aprobadas;
- el próximo paso concreto.

El desarrollo avanza por bloques pequeños. Antes de incorporar un módulo nuevo, el usuario debe poder probar y comprender suficientemente el anterior. Juno no debe adelantarse ofreciendo múltiples expansiones cuando todavía se está validando una parte.

La documentación se construye mientras ocurre el trabajo. Juno captura material para informes y prepara estructuras o borradores, pero el usuario formula primero las interpretaciones de resultados y las conclusiones técnicas.

### Al cerrar una sesión

El cierre debe tardar poco y mostrar:

- si se cumplió el objetivo de la sesión;
- avance respecto de ese objetivo;
- diagnóstico breve de la gestión del bloque;
- ideas, decisiones y fundamentos por confirmar;
- pendientes y próximo paso exacto;
- material útil para la documentación.

El porcentaje de avance se refiere al objetivo de la sesión. El avance general de un proyecto se mide mediante hitos, no mediante porcentajes arbitrarios.

Si el usuario no cierra la sesión, Juno prepara un cierre provisional después de un periodo aproximado de dos horas de inactividad y lo presenta para revisión posterior.

### Al terminar el día

Juno permite revisar brevemente lo realizado, adaptar lo pendiente y hacer explícitas las consecuencias de cambiar el plan. El objetivo es que el usuario pueda descansar sin mantener tareas e ideas constantemente en la cabeza.

## Relación con el usuario

Juno se presenta como una única identidad. Sus capacidades internas no obligan al usuario a elegir manualmente entre módulos o agentes.

Juno utiliza tres modos principales bajo una misma identidad:

- **Tutor:** prioriza comprensión y retención;
- **Investigación:** explora fuentes, relaciones y evidencia;
- **Trabajo:** prioriza avance y producción controlada.

El modo cambia automáticamente según la intención de cada tarea, pero siempre permanece visible y el usuario puede modificarlo o bloquearlo. Cambiar de modo no cambia el proyecto ni crea otra Juno.

Su forma de comunicarse depende del contexto:

- precisa y breve durante el trabajo;
- conversacional durante la reflexión;
- progresiva y cuestionadora durante la tutoría;
- clara e insistente ante riesgos o entregas urgentes.

Juno puede proponer, advertir e insistir respetuosamente, pero la decisión final siempre corresponde al usuario.

Cuando una incertidumbre afecta fechas, dinero, archivos o decisiones técnicas, Juno debe preguntar. Si la incertidumbre es menor, puede formular una suposición explícita y conservarla como pendiente.

## Principios

1. **Aprendizaje antes que automatización.** Juno no debe resolver automáticamente aquello que todavía aporta aprendizaje al usuario.
2. **Captura con poca fricción.** El usuario puede expresarse de manera desordenada; Juno organiza después.
3. **Continuidad.** Cada sesión debe dejar suficiente contexto para retomar el trabajo sin reconstruirlo desde cero.
4. **Interrupciones mínimas.** Las revisiones, clasificaciones y repasos se realizan en momentos apropiados.
5. **Control humano.** Juno informa consecuencias y respeta las decisiones del usuario.
6. **Trazabilidad.** Debe ser posible revisar fuentes, interpretaciones, acciones y cambios.
7. **Privacidad por diseño.** Los permisos se definen por proyecto y los envíos a modelos externos quedan registrados.
8. **Costo controlado.** Las tareas se asignan al recurso menos costoso que pueda resolverlas con calidad suficiente.
9. **Una sola identidad.** La complejidad interna no debe trasladarse al usuario.
10. **Simplicidad progresiva.** Juno comienza con un alcance pequeño y agrega capacidades solo después de validar su utilidad.

## Prioridad principal

La prioridad global de Juno es mejorar el aprendizaje y la retención. Durante las vacaciones, el primer problema práctico será retomar y documentar proyectos.

JunoCopilot se utilizará como caso interno para documentar su propio desarrollo. El proyecto de turbinas será el caso técnico externo, porque contiene suficiente contexto e investigación para comprobar que la solución también funciona fuera de su propio proceso de construcción.

## Objetivo de portafolio

JunoCopilot también debe convertirse en una pieza sólida del portafolio del usuario. El proyecto debe permitir demostrar definición de requisitos, diseño centrado en el aprendizaje, arquitectura de software, integración de modelos y herramientas, seguridad, trazabilidad y validación con proyectos reales de ingeniería.

Su valor de portafolio debe provenir de las decisiones, módulos y evaluaciones desarrolladas por el usuario, no únicamente de instalar o cambiar la apariencia de OpenClaw.

## Alcance futuro

La visión completa contempla cinco áreas integradas:

- proyectos e investigación;
- aprendizaje y retención;
- organización personal y temporal;
- finanzas personales básicas;
- herramientas de ingeniería.

Estas áreas forman una sola experiencia, pero no se desarrollarán simultáneamente.

## Criterio de éxito de la visión

Juno será exitoso si permite al usuario:

- retomar un proyecto sin perder tiempo reconstruyendo el contexto;
- documentar fundamentos y decisiones mientras todavía están frescos;
- llegar a un examen con material construido durante la cursada;
- planificar de forma realista sin abandonar comidas, descanso y cuidado básico;
- capturar información sin mantener un sistema manual complejo;
- utilizar IA sin perder comprensión ni autoría intelectual.
