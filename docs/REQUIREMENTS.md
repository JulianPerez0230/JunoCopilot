# Requisitos de JunoCopilot

## 1. Alcance del documento

Este documento traduce la visión de JunoCopilot a requisitos verificables. Describe el comportamiento esperado, las restricciones y las prioridades, pero no define todavía la implementación técnica.

Las prioridades utilizadas son:

- **MVP:** necesario para la primera versión útil;
- **Siguiente:** previsto después de validar el MVP;
- **Futuro:** parte de la visión, sin compromiso inmediato de implementación.

## 2. Actores y sistemas externos

### Actor principal

- Usuario único: Julián.

### Sistemas externos previstos

- OpenClaw como base inicial del agente;
- ChatGPT/Codex mediante autenticación OAuth de la suscripción;
- Telegram como canal de captura;
- proveedores de modelos con API gratuita o paga;
- reloj y zona horaria del sistema;
- calendario;
- correo electrónico en modo de solo lectura;
- Python, MATLAB, LaTeX y Git en fases posteriores.

## 3. Requisitos funcionales

### 3.1 Identidad e interacción

**RF-001 — Identidad única — MVP**  
El sistema debe presentarse como Juno, sin exigir que el usuario seleccione agentes o módulos internos.

**RF-001A — Conversaciones múltiples — MVP**  
Juno debe admitir múltiples conversaciones o sesiones sin convertirse en identidades diferentes. No debe depender de un único chat acumulativo.

**RF-001B — Sesión general o de proyecto — MVP**  
Una sesión puede ser general o estar asociada a exactamente un proyecto activo. El proyecto activo debe pertenecer a esa sesión y no modificar otras conversaciones.

**RF-002 — Estilo contextual — MVP**  
Juno debe comunicarse de forma precisa durante el trabajo, conversacional durante la reflexión y progresiva durante la tutoría.

**RF-003 — Autoridad del usuario — MVP**  
Juno puede recomendar e insistir ante riesgos, pero debe respetar la decisión final del usuario.

**RF-004 — Manejo de incertidumbre crítica — MVP**  
Juno debe pedir confirmación cuando una incertidumbre afecte fechas, dinero, archivos o decisiones técnicas.

**RF-005 — Manejo de incertidumbre menor — MVP**  
Juno puede adoptar una suposición explícita ante una incertidumbre menor y debe registrarla como pendiente revisable.

**RF-006 — Modos principales — MVP**  
Juno debe disponer de los modos Tutor, Investigación y Trabajo sin presentarlos como asistentes diferentes. La organización debe funcionar como una capacidad transversal.

**RF-007 — Selección automática de modo — MVP**  
En estado `Auto`, Juno debe inferir el modo adecuado para cada turno o tarea y permitir cambios rápidos dentro de una misma conversación sin alterar el proyecto activo.

**RF-008 — Modo visible — MVP**  
Cada respuesta debe mostrar una etiqueta breve con el modo principal utilizado y, cuando corresponda, el recurso de modelo seleccionado.

**RF-009 — Anulación manual — MVP**  
El usuario debe poder cambiar el modo mediante lenguaje natural para una respuesta, una tarea o el resto de la sesión, y debe poder regresar a `Auto`.

### 3.2 Gestión de proyectos

**RF-010 — Crear y seleccionar proyectos — MVP**  
Juno debe poder crear, identificar y seleccionar un proyecto activo.

**RF-011 — Recuperar contexto — MVP**  
Al abrir un proyecto, Juno debe presentar el objetivo, estado actual, decisiones, fundamentos, ideas, pendientes y próximo paso.

**RF-012 — Separar contextos — MVP**  
La información de un proyecto no debe mezclarse con otro salvo que exista una relación explícita.

**RF-012A — Memoria independiente del chat — MVP**  
El contexto permanente de un proyecto debe recuperarse desde su memoria aprobada y no exigir la conservación o lectura completa de chats anteriores.

**RF-013 — Capturar elementos de trabajo — MVP**  
Juno debe registrar ideas, decisiones, fundamentos, resultados, problemas, fuentes y pendientes.

**RF-014 — Revisar capturas al cierre — MVP**  
Las posibles ideas, decisiones y fundamentos detectados durante una sesión deben acumularse y revisarse al finalizar, sin interrumpir el trabajo.

**RF-015 — Avance por hitos — MVP**  
El avance general de un proyecto debe representarse mediante hitos y estados verificables.

**RF-016 — Desarrollo incremental — Siguiente**  
Cuando Juno ayude a construir código o simulaciones, debe trabajar por bloques pequeños, detenerse después de cada bloque y permitir su prueba y comprensión antes de continuar.

**RF-017 — Validación interna — MVP**  
JunoCopilot debe utilizarse para registrar y recuperar el contexto de su propio desarrollo.

**RF-018 — Validación técnica externa — MVP**  
El proyecto de turbinas debe utilizarse como caso independiente para comprobar que el sistema funciona con contenido real de ingeniería, salvo que el usuario cambie esta decisión.

### 3.3 Sesiones y bitácora

**RF-020 — Objetivo de sesión — MVP**  
Juno debe permitir definir un objetivo concreto al iniciar una sesión de trabajo.

**RF-021 — Captura no interruptiva — MVP**  
Juno debe conservar posibles ideas, fundamentos y pendientes durante la sesión sin solicitar confirmación inmediata.

**RF-022 — Cierre voluntario — MVP**  
El usuario debe poder indicar explícitamente que desea cerrar una sesión.

**RF-023 — Detección de inactividad — Siguiente**  
Después de aproximadamente dos horas de inactividad, Juno debe preguntar si corresponde cerrar la sesión o mantenerla abierta.

**RF-024 — Cierre provisional — Siguiente**  
Si no recibe respuesta, Juno debe preparar un cierre provisional y presentarlo cuando se retome el proyecto.

**RF-025 — Resumen de cierre — MVP**  
El cierre debe incluir, de forma breve: cumplimiento del objetivo, avance del bloque, diagnóstico de gestión, elementos por confirmar, pendientes y próximo paso.

**RF-026 — Porcentaje contextual — MVP**  
Un porcentaje solo debe utilizarse para el objetivo acotado de una sesión, nunca como estimación arbitraria del proyecto completo.

**RF-027 — Material documental — MVP**  
El cierre debe conservar material que posteriormente pueda utilizarse en informes o presentaciones.

### 3.4 Captura mediante Telegram

**RF-030 — Bandeja de entrada — Siguiente**  
Juno debe aceptar mediante Telegram mensajes breves, fechas, gastos, ideas y fotos de apuntes.

**RF-031 — Clasificación posterior — Siguiente**  
Juno debe clasificar las capturas después de recibirlas, sin exigir que el usuario elija previamente una categoría.

**RF-032 — Confirmación selectiva — Siguiente**  
Juno debe solicitar confirmación rápida únicamente para elementos importantes o ambiguos, especialmente fechas, dinero y decisiones.

**RF-033 — Operación con PC apagada — Siguiente**  
Juno debe procesar al iniciar el Gateway las actualizaciones que Telegram haya conservado durante una desconexión habitual inferior a 24 horas.

**RF-034 — Acciones limitadas en Telegram — Siguiente**  
Inicialmente, Telegram debe utilizarse solo para captura. No debe ejecutar programas, modificar proyectos ni enviar acciones externas.

**RF-035 — Material original revisable — Siguiente**  
La interpretación de una foto o mensaje debe poder contrastarse con el material original.

### 3.5 Aprendizaje y tutoría

**RF-040 — Exploración inicial — Siguiente**  
Juno debe permitir que el usuario explore primero el material original antes de explicar o evaluar el tema.

**RF-041 — Contexto de la cátedra — Siguiente**  
Juno debe conservar el énfasis del profesor, ejemplos, aclaraciones, preguntas, errores y contenido indicado como evaluable o no evaluable.

**RF-042 — Diagnóstico opcional — Siguiente**  
Juno puede proponer un cuestionario breve después de la exploración inicial, pero debe requerir aceptación.

**RF-043 — Dimensiones de dominio — Siguiente**  
El dominio debe evaluarse separando explicación con palabras propias, resolución de ejercicios, autonomía y retención temporal.

**RF-044 — Evidencia subjetiva y objetiva — Siguiente**  
Juno debe combinar desempeño observado con la percepción declarada por el usuario.

**RF-045 — Retención temporal — Siguiente**  
Juno debe volver a comprobar conceptos después de intervalos de tiempo y actualizar el estado de dominio.

**RF-046 — Repaso no interruptivo — Siguiente**  
Juno no debe iniciar cuestionarios durante trabajo urgente o concentración activa.

**RF-047 — Repaso estratégico — Siguiente**  
Los repasos deben proponerse al comienzo de sesiones tranquilas, cuando no exista urgencia, y siempre deben requerir aceptación.

**RF-048 — Material progresivo de examen — Futuro**  
Juno debe construir durante la cursada resúmenes esenciales, hojas de fórmulas razonadas, bancos de preguntas y mapas de dominio.

### 3.6 Investigación y fuentes

**RF-050 — Búsqueda por relaciones — Futuro**  
Juno debe ayudar a explorar tanto el tema principal como relaciones laterales justificadas, por ejemplo biomimética, materiales o procedimientos transferibles.

**RF-051 — Ficha de paper — Futuro**  
Juno debe poder extraer problema, objetivo, fundamentos, metodología, componentes, resultados, conclusiones, limitaciones y utilidad para el proyecto.

**RF-052 — Trazabilidad de citas — Futuro**  
Las citas y afirmaciones extraídas deben conservar la fuente y la página exacta.

**RF-053 — Bibliografía reutilizable — Futuro**  
Los metadatos bibliográficos deben almacenarse independientemente del estilo de salida para permitir APA, IEEE u otros formatos.

**RF-054 — Distinción epistémica — Siguiente**  
Juno debe diferenciar hechos, resultados, supuestos, inferencias y opiniones.

### 3.7 Redacción y documentación

**RF-060 — Documentación durante el trabajo — MVP**  
Juno debe capturar fundamentos y decisiones mientras están frescos, sin exigir la redacción inmediata del informe.

**RF-061 — Estados documentales — Siguiente**  
El contenido debe distinguirse como nota cruda, borrador o versión aprobada.

**RF-062 — Perfil de redacción — Siguiente**  
Los borradores deben utilizar lenguaje sencillo, directo, breve y sin tecnicismos innecesarios.

**RF-063 — Interpretación primero por el usuario — MVP**  
Ante resultados nuevos, Juno debe permitir que el usuario formule primero su interpretación antes de mostrar otras conclusiones.

**RF-064 — Retroalimentación posterior — MVP**  
Después de la interpretación inicial, Juno puede señalar errores, omisiones, limitaciones y perspectivas alternativas.

**RF-065 — Conclusiones bajo control humano — MVP**  
Juno no debe presentar conclusiones técnicas como definitivas sin revisión y aprobación del usuario.

### 3.8 Tiempo y planificación

**RF-070 — Fuente de tiempo real — Siguiente**  
Juno debe consultar el reloj del sistema y la zona horaria `America/Buenos_Aires` para interpretar expresiones temporales.

**RF-071 — Fechas absolutas — Siguiente**  
Las expresiones como “mañana” o “el viernes” deben convertirse en fechas absolutas antes de guardarse.

**RF-072 — Conceptos temporales separados — Siguiente**  
Juno debe distinguir fecha límite, momento planificado, duración estimada, duración real y antigüedad.

**RF-073 — Planificación semanal — Futuro**  
Los domingos por la mañana, Juno debe preparar una propuesta de planificación semanal para que el usuario la modifique y apruebe.

**RF-074 — Horarios con margen — Futuro**  
La planificación debe utilizar horarios concretos con transiciones y márgenes, evitando bloques consecutivos sin tiempo de adaptación.

**RF-075 — Tiempo protegido — Futuro**  
Los márgenes, comidas y descanso no deben tratarse automáticamente como espacios disponibles para más trabajo.

**RF-076 — Cuidado mínimo — Futuro**  
Incluso en semanas pesadas, el plan debe proteger comidas, descanso y al menos sesiones breves de estiramiento.

**RF-077 — Replanificación consciente — Futuro**  
Antes de desplazar una actividad, Juno debe mostrar las consecuencias y solicitar una decisión.

**RF-078 — Insistencia respetuosa — Futuro**  
Ante entregas urgentes, Juno debe insistir y explicar el riesgo, pero aceptar la decisión final del usuario.

### 3.9 Panel diario, correo y noticias

**RF-080 — Panel breve — Futuro**  
Juno debe presentar un resumen matutino compacto y expandible.

**RF-081 — Orden de prioridad — Futuro**  
El panel debe priorizar urgencias, universidad, profesores, respuestas esperadas, becas, finanzas relevantes, temas seguidos y proyectos activos.

**RF-082 — Correo de solo lectura — Futuro**  
Juno puede leer y clasificar correo, pero no debe redactar ni enviar respuestas en el alcance inicial.

**RF-083 — Noticias bajo seguimiento — Futuro**  
Juno solo debe mostrar noticias correspondientes a temas seguidos o sucesos de importancia suficiente.

**RF-084 — Fuente y fecha — Futuro**  
Cada noticia debe mostrar claramente su fuente y fecha.

**RF-085 — Ausencia válida de noticias — Futuro**  
Si no existe información relevante, Juno debe omitir la sección de noticias.

### 3.10 Finanzas personales

**RF-090 — Registro rápido — Futuro**  
Juno debe interpretar mensajes breves como “gasté 60 mil en ropa y 30 mil en carne” y convertirlos en movimientos separados.

**RF-091 — Monedas — Futuro**  
El registro debe manejar gastos cotidianos en pesos argentinos y reservas en USDT.

**RF-092 — Conversiones — Futuro**  
Al convertir USDT, Juno debe registrar la cantidad vendida y los pesos recibidos.

**RF-093 — Historial general — Futuro**  
La primera versión financiera debe mantener un historial general, sin contabilidad separada por banco o billetera.

**RF-094 — Situación mensual — Futuro**  
Juno debe permitir actualizar aproximadamente una vez al mes la disponibilidad en ARS y USDT.

**RF-095 — Pagos próximos — Futuro**  
Juno debe advertir automáticamente sobre pagos y suscripciones próximos.

**RF-096 — Evaluación bajo pedido — Futuro**  
Juno solo debe evaluar gastos, ahorro o inversiones cuando el usuario lo solicite.

**RF-097 — Separación entre datos y consejo — Futuro**  
Las recomendaciones financieras deben distinguirse de los datos objetivos y declarar sus supuestos.

### 3.11 Selección de modelos y costo

**RF-100 — Enrutamiento por tarea — Siguiente**  
Juno debe escoger el recurso menos costoso que pueda resolver la tarea con calidad suficiente.

**RF-101 — Tareas deterministas — Siguiente**  
Las tareas que puedan resolverse mediante reglas locales no deben consumir un modelo de lenguaje.

**RF-102 — Suscripción como modelo complejo — MVP**  
Inicialmente, las tareas complejas deben utilizar ChatGPT/Codex mediante OAuth de la suscripción, sin consumo de API paga.

**RF-103 — API gratuita — Siguiente**  
Juno puede utilizar una API gratuita para clasificación o tareas sencillas que no involucren información sensible.

**RF-104 — Un modelo por decisión — Siguiente**  
El router debe seleccionar un modelo antes de enviar el contexto y evitar duplicar innecesariamente la misma solicitud entre proveedores.

**RF-105 — Visibilidad de consumo — Siguiente**  
Juno debe registrar el proveedor, modelo y cuota o costo asociado a cada operación.

**RF-106 — API paga opcional — Futuro**  
Una API paga puede incorporarse como respaldo o para capacidades no cubiertas por la suscripción y los niveles gratuitos.

## 4. Requisitos de memoria

**RM-001 — Memoria del proyecto — MVP**  
Debe conservar objetivo, problema, sistema, decisiones, fundamentos, configuración vigente, resultados, conclusiones aprobadas, pendientes, fechas y archivos relacionados.

**RM-002 — Memoria de aprendizaje — Siguiente**  
Debe conservar temas, errores frecuentes, evidencia de dominio, necesidad de pistas y evolución de la retención.

**RM-003 — Memoria de preferencias — MVP**  
Debe conservar preferencias estables de interacción, ritmo, redacción y límites de automatización.

**RM-004 — Memoria temporal — MVP**  
Debe separar hipótesis momentáneas, archivos abiertos y borradores no aprobados de la memoria permanente.

**RM-005 — Memoria explícita — MVP**  
La información principal debe almacenarse en formatos visibles, editables y portables.

**RM-006 — Material original revisable — Siguiente**  
Las interpretaciones automáticas deben poder contrastarse con su mensaje, imagen o documento de origen.

**RM-007 — Estado de aprobación — MVP**  
Juno debe distinguir contenido detectado, pendiente de confirmación y aprobado.

## 5. Seguridad y privacidad

**RS-001 — Permisos por proyecto — MVP**  
Cada proyecto debe declarar qué contenido puede enviarse a modelos externos.

**RS-002 — Registro de envíos — MVP**  
Juno debe registrar qué fragmentos se enviaron, a qué proveedor y para qué tarea.

**RS-003 — Secretos excluidos — MVP**  
Claves API, contraseñas, tokens, datos bancarios y secretos de acceso no deben almacenarse en conversaciones, notas ni repositorios.

**RS-004 — Correo no mutable — Futuro**  
La integración de correo debe ser de solo lectura.

**RS-005 — Telegram sin ejecución — Siguiente**  
Los mensajes de Telegram no deben iniciar ejecución de programas ni acciones externas en las primeras versiones.

**RS-006 — Sin borrado en el MVP — MVP**  
Juno no debe borrar ni mover archivos durante el MVP. En fases posteriores podrá hacerlo únicamente por solicitud explícita, mostrando el objetivo exacto, solicitando confirmación y prefiriendo una operación recuperable.

**RS-007 — Confirmación de modificaciones — MVP**  
Las modificaciones importantes deben mostrarse y requerir aprobación.

**RS-008 — Acceso limitado — MVP**  
Juno debe operar dentro de JunoWorkspace. El acceso futuro a métricas del sistema o rutas externas deberá concederse mediante capacidades y rutas específicas, no mediante acceso general implícito.

## 6. Requisitos no funcionales

**RNF-001 — Baja fricción**  
Registrar una idea o un pendiente no debe exigir completar formularios complejos.

**RNF-002 — Brevedad operativa**  
Los cierres de sesión y paneles deben poder revisarse en pocos minutos.

**RNF-003 — Portabilidad**  
Los proyectos y la memoria deben poder copiarse a otra computadora sin depender exclusivamente de una base de datos propietaria.

**RNF-004 — Modularidad**  
La lógica propia de Juno debe mantenerse separada de los archivos internos de OpenClaw.

**RNF-005 — Auditabilidad**  
El usuario debe poder reconstruir qué información se utilizó y qué cambios se realizaron.

**RNF-006 — Degradación segura**  
Si un modelo o proveedor no está disponible, Juno debe detenerse o utilizar un respaldo aprobado, sin cambiar silenciosamente a un servicio de costo o privacidad diferente.

**RNF-007 — Zona horaria**  
El sistema debe utilizar inicialmente `America/Buenos_Aires` y conservar fechas absolutas.

**RNF-008 — Operación local primero**  
Siempre que resulte práctico, archivos, memoria, registros y herramientas deben permanecer en la computadora del usuario.

**RNF-009 — Evidencia de portafolio**  
Las decisiones de diseño, cambios, pruebas y resultados deben quedar documentados de forma que el usuario pueda explicar y demostrar su contribución personal al proyecto.

## 7. Alcance propuesto del MVP

El MVP debe concentrarse en retomar y documentar un proyecto. Incluye:

1. una única identidad llamada Juno;
2. creación y selección de proyectos;
3. estructura explícita de contexto y memoria;
4. registro de ideas, decisiones, fundamentos y pendientes;
5. objetivo y cierre breve de sesión;
6. recuperación del último estado y próximo paso;
7. material documental preparado durante el trabajo;
8. interpretación inicial de resultados realizada por el usuario;
9. permisos por proyecto y registro de uso de modelos;
10. ChatGPT/Codex mediante OAuth como modelo inicial.

El MVP no incluye todavía:

- Telegram;
- correo y calendario;
- planificación semanal;
- finanzas;
- repaso espaciado;
- búsqueda automática de papers;
- ejecución de MATLAB o Python;
- múltiples agentes visibles;
- una interfaz propia;
- tareas autónomas en segundo plano.

## 8. Criterios de aceptación del MVP

El MVP será aceptado cuando pueda completar de forma consistente este escenario:

1. El usuario abre el proyecto de turbinas.
2. Juno muestra el problema, objetivo, estado, decisiones, ideas y pendientes vigentes.
3. El usuario define un objetivo de sesión.
4. Durante el trabajo se registran elementos sin interrumpir el flujo.
5. El usuario solicita el cierre.
6. Juno presenta un resumen breve y elementos por confirmar.
7. El usuario aprueba o corrige el cierre.
8. Al abrir nuevamente el proyecto, Juno recupera el estado aprobado y el próximo paso sin mezclar información de otros proyectos.

## 9. Decisiones pendientes

- Elegir el formato exacto de la memoria de proyecto.
- Determinar qué parte del MVP reside en OpenClaw y qué parte pertenece al núcleo independiente de Juno.
- Elegir una API gratuita para tareas simples y definir qué información puede recibir.
- Definir la política de conservación de fotos y archivos originales.
- Establecer cómo se mide la suficiencia de una sesión sin generar porcentajes engañosos.
- Confirmar el nombre público definitivo; `JunoCopilot` se mantiene como nombre de trabajo.
