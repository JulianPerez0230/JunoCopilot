# Logs

This directory contains human-readable operational records. Logs are
supporting evidence, not canonical project memory.

## External-model usage

Store external-model attempts in:

```text
logs/model-usage/YYYY-MM.md
```

Use one entry per attempt:

```markdown
## YYYY-MM-DDTHH:MM:SS-03:00 — <operation_id> — attempt <n>

- Purpose: capture-classification
- Provider: groq
- Model: llama-3.3-70b-versatile
- Status: success | error
- Project: <project_id> | none
- Result reference: <workspace-relative path and capture id> | none
- Error category: schema-validation | rate-limit | timeout | tool-unavailable | other | none
```

Retries share the same `operation_id`. Never store full prompts, API keys,
tokens, passwords, or the complete captured message. The referenced inbox or
project record remains the source for the actual content.
