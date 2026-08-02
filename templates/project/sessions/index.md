# Session index

Allowed states:

- `open`: work is still in progress;
- `incomplete`: the session closed before reaching its objective;
- `provisional`: the closure or its proposed changes still need approval;
- `completed`: the session and its approved closure are complete.

When resuming a project, inspect `open`, `incomplete`, and `provisional` entries
before claiming that no unfinished session exists. Read the referenced record
to recover its full context.

This file is the canonical inventory of project session records. Juno must keep
it updated whenever a session record is created or its state changes.

| Timestamp | Status | Objective | Next step | Record |
|---|---|---|---|---|
