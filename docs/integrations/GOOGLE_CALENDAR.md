# Google Calendar integration

## Status

Validated during Alpha v0.2 on 2026-07-27.

Juno can:

- authorize one approved Google account through OAuth;
- read the primary calendar for a requested interval;
- interpret event dates, times, durations, and the Buenos Aires time zone;
- compare Calendar with an approved local weekly plan;
- identify overlaps and stale events;
- create an event only after the user approves its exact details;
- verify a created event by reading Calendar again.

Juno cannot update or delete Calendar events in Alpha v0.2.

## Responsibility boundary

Google Calendar and JunoWorkspace serve different purposes:

- Calendar is the external source for commitments with a concrete date and
  time.
- JunoWorkspace keeps objectives, priorities, margins, unresolved details, and
  the approved planning rationale.
- A comparison does not synchronize either source.
- Juno must show the proposed difference and obtain approval before creating an
  event.

An event returned by Calendar is evidence of what Calendar currently contains.
It is not automatically proof that the commitment is still current.

## Approved tools

The Alpha v0.2 allowlist contains:

- `google_workspace_begin_auth`
- `google_workspace_complete_auth`
- `google_workspace_auth_status`
- `google_calendar_list_events`
- `google_calendar_find_next_meeting`
- `google_calendar_create_event`

The following tools remain unavailable:

- `google_calendar_update_event`
- `google_calendar_delete_event`

The Calendar service is configured with:

- calendar: `primary`;
- time zone: `America/Argentina/Buenos_Aires`;
- default read window: seven days;
- OAuth scope after the creation test: `calendar.events`.

The broader OAuth scope is constrained by OpenClaw's tool allowlist: Juno has no
registered update or delete tool.

## Secrets

OAuth client credentials and tokens belong under `.openclaw`, never in this
repository or JunoWorkspace.

Example private paths:

```text
%USERPROFILE%\.openclaw\secrets\google-oauth.json
%USERPROFILE%\.openclaw\secrets\google-calendar-tokens.json
```

Do not store OAuth codes, client secrets, access tokens, or refresh tokens in
logs, plans, sessions, screenshots, issues, or Git.

## Community plugin

The validated environment uses the community package
`@tensorfold/openclaw-google-workspace` from a locally pinned source checkout.
The package is not maintained or endorsed by OpenClaw.

The source was reviewed before enabling it, non-Calendar services were
disabled, and the plugin id was added explicitly to `plugins.allow`.

OpenClaw 2026.7.1-2 required a local compatibility entry point using the current
tool-plugin contract. Treat this as an environment-specific patch until the
upstream package publishes compatible compiled output. Re-review the source and
the effective tool list before upgrading either OpenClaw or the plugin.

## Safe operating flow

### Read and reconcile

1. Read the approved local plan and relevant local pending items.
2. Read the requested Calendar interval.
3. Show overlaps, stale entries, duplicates, and missing commitments.
4. Ask only for decisions that cannot be recovered from either source.
5. Keep the proposed plan local until the user approves it.

### Create an event

1. Show the exact title, start, end, time zone, destination calendar, and
   description.
2. Call the creation tool with `confirmed: false`.
3. Wait for explicit user approval.
4. Call it again with `confirmed: true`.
5. Read Calendar again and verify the resulting event.
6. Store a minimal local operation record that references the approved plan or
   capture without storing OAuth material.

## Validation record

The following behavior was observed on 2026-07-27:

- a seven-day schedule was read without modifying Calendar;
- Juno detected overlapping Sunday study blocks;
- a stale Calendar was compared with a newly approved local plan;
- the approved plan was recovered in a separate conversation;
- a fictitious ten-minute event was previewed, explicitly approved, created,
  and observed in Google Calendar;
- the user removed the fictitious event manually;
- Juno did not receive update or delete tools.

Still pending:

- verify an all-day event;
- enumerate visible calendars and formally approve the allowed calendar set;
- validate the local operation log;
- test Calendar unavailability without affecting local project recovery.

