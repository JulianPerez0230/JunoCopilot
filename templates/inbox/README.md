# Juno general inbox

This directory stores captures that do not yet belong to a specific project or
that need later classification.

## Storage

- Use one append-only Markdown file per local day: `YYYY-MM-DD.md`.
- Maintain `index.md` as the canonical inventory. Add or update its row in the
  same operation that creates a capture, changes its review state, or assigns a
  canonical destination.
- Preserve the user's original message verbatim.
- Keep captures short and avoid duplicating full conversation history.
- Use the system clock and the configured local timezone.
- If an expense has no stated date, use the local capture date and record that
  the date was inferred from the capture time.
- Resolve clear relative weekdays against the local system date before saving;
  retain both the original wording and the resolved absolute date.

## Capture format

```markdown
## CAP-YYYYMMDD-HHMMSS-NN

- Captured: YYYY-MM-DD HH:MM:SS America/Buenos_Aires
- Source: chat | telegram | manual
- Status: pending | confirmed | routed | archived
- Categories: idea | task | date | expense | academic | personal | note
- Destination: general | projects/<project_id>
- Confirmation: not-required | pending | approved

### Original

> Exact user message.

### Interpretation

- Concise structured meaning.
- Explicit assumptions or missing information, when relevant.
```

## Routing

- `pending`: captured but not yet reviewed or incorporated elsewhere.
- `confirmed`: reviewed and approved, but still awaiting transfer if needed.
- `routed`: incorporated into the appropriate project or canonical system.
- `archived`: intentionally retained without further action.

The index also tracks reconciliation separately from capture approval:

- `pending`: still requires a decision, destination, or action.
- `processed`: preserved or routed, but not necessarily completed.
- `completed`: completion is supported by canonical evidence.
- `archived`: retained without further action.

An approved expense may be `processed` while the finance module is out of
scope. Preserve its original capture for later migration without presenting it
as a daily action.

The inbox is not canonical project memory. Important dates, money, files, and
technical decisions still require the approval policy defined in `AGENTS.md`.
