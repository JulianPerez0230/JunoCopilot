# Juno project inventory

This is a lightweight, rebuildable index. Use it to locate active projects
before opening their canonical `STATUS.md` and `TODO.md`. Do not treat a row as
a substitute for project memory.

| Directory | Project ID | Name | Status | Last canonical update | Metadata |
|---|---|---|---|---|---|
<!-- PROJECT_ROWS -->

## Rules

- One row per directory directly under `projects/`.
- `project.yaml` supplies id, name, and status.
- The latest modification among `project.yaml`, `STATUS.md`, and `TODO.md`
  supplies the update timestamp.
- Read the selected project's canonical files before reporting its current
  state, deadlines, or next step.
- Rebuild the index after adding projects or repairing workspace indexes.
