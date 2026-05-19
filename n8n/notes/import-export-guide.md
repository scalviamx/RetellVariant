# n8n Import/Export Guide

## Export

1. Open the workflow in n8n on the Hostinger VPS.
2. Confirm credentials are not embedded in exported JSON.
3. Export the workflow JSON.
4. Save it under `n8n/workflows/`.
5. Commit the changed export to GitHub.

## Import

1. Open n8n.
2. Import the JSON file from `n8n/workflows/`.
3. Reconnect credentials in n8n.
4. Review webhook URLs and environment-specific values.
5. Test with an example payload.
6. Activate only after successful real-message testing.

## Versioning

Use one workflow export per file. Keep numeric prefixes stable so diffs remain easy to review.
