# External-model usage

Create one monthly file named `YYYY-MM.md`. Add one entry for every attempt,
including schema-validation errors and retries.

Required fields:

- `timestamp`
- `operation_id`
- `purpose`
- `provider`
- `model`
- `status`: `success` or `error`
- `attempt`
- `project`
- `result_reference`
- `error_category`: `schema-validation`, `rate-limit`, `timeout`,
  `tool-unavailable`, `other`, or `none`

Retries share an `operation_id` and increment `attempt`. Do not store prompts,
credentials, or complete captured messages.
