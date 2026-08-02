# Known limitations

## OpenAI OAuth availability

**Status:** accepted Alpha v0.1 dependency.

Juno's main conversational agent currently runs through ChatGPT/Codex OAuth.
If that authentication expires, its quota becomes unavailable, or the provider
cannot be reached, an agent run may fail before Juno can produce a reply or call
any tool.

### Expected behavior

- Project memory, subjects, inbox entries and plans remain local and are not
  deleted or made unreadable by the provider failure.
- Juno must not silently switch the main conversation to Gemini, Groq or an
  unapproved model.
- Groq's bounded `llm-task` classifier is not a replacement for the main agent;
  it cannot recover a turn when the OpenAI-backed agent itself did not start.
- The raw-capture fallback protects a message when the main agent is running but
  the classifier is unavailable. It does not guarantee capture when the main
  OAuth provider fails before Juno can use tools.
- A turn that fails after tools were already used may have partial effects.
  After service is restored, Juno must inspect the relevant inbox, plan and
  canonical files before retrying a write.

### Recovery procedure

1. Confirm that the failure concerns the OpenAI authentication or provider,
   rather than a missing file or denied tool.
2. Restore or renew the approved OpenAI OAuth profile.
3. Verify the active model and authentication state.
4. Open the affected project and inspect pending captures and canonical state.
5. Retry the original request only after checking that it was not already
   applied partially.

Automatic failover of the main agent is deferred until a replacement model can
be tested with the same tool policy, privacy boundaries and memory behavior.

## Native PDF analysis in OpenClaw

**Status:** blocked upstream; deferred.

In OpenClaw 2026.7.1-2, the PDF tool is exposed but its model resolver rejects
the authenticated models available to Juno with `Unknown model`. This was
reproduced with Google models supplied by the Gemini integration and OpenAI
models supplied through ChatGPT/Codex OAuth. The failure occurs before document
extraction, so it is not caused by the PDF path or contents.

### Impact

- Juno cannot ingest arbitrary PDFs directly and reliably.
- Tutor and Research can work from stable text, images, or previously extracted
  material, but that is a manual workaround rather than the intended workflow.
- Page-level visual verification requires separately rendered pages.

### Project decision

Do not build a replacement document-processing subsystem during Alpha v0.1.
Keep the original documents and the experimental extraction utilities already
created, but treat them as temporary developer tools rather than a finished Juno
capability. Re-evaluate native PDF support after an OpenClaw update.

### Revalidation

After upgrading OpenClaw, test one short text PDF and one page containing a
figure. Remove this limitation only if Juno can resolve the configured PDF
model, preserve page references, and visually verify the rendered content.

## Browser downloads into JunoWorkspace

**Status:** constrained by sandbox boundaries.

Public web search, navigation, and source verification work in Research mode.
The browser saves downloads inside its isolated download directory and cannot
write a binary directly to a project attachment directory. With command
execution and file moves blocked in the MVP, Juno cannot relocate the downloaded
file into `JunoWorkspace` by itself.

For Alpha v0.1, the user must place approved downloads manually in the relevant
project or subject directory. Juno must not claim that a source was incorporated
until the stable file exists there. Revisit this workflow only through a narrow,
auditable file-transfer capability; do not enable general command execution.
