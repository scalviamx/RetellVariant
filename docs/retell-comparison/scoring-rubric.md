# Retell vs Dograh Scoring Rubric

Score each category from 1 to 5.

- `1`: Unusable.
- `2`: Weak, major issue.
- `3`: Acceptable but not production-ready.
- `4`: Strong enough for controlled pilot.
- `5`: Excellent, production-grade.

| Category | Score 1-5 | Notes |
|---|---:|---|
| Perceived latency |  | Time between user stop and agent reply. |
| Voice naturalness |  | Human-like tone, pacing, emotion. |
| Mexican Spanish |  | Accent, phrasing, pronunciation, cultural fit. |
| Interruption handling |  | Handles barge-in without losing context. |
| Silence handling |  | Does not panic or talk over user. |
| Phrase repetition |  | Avoids repeating canned phrases. |
| Context following |  | Remembers business, need, and prior answers. |
| Tool calling |  | Webhook/calendar/tool behavior if enabled. |
| Data capture |  | Captures name, phone, email, business, interest. |
| Call closing |  | Ends naturally with next step. |
| Logs/debugging |  | Easy to inspect failures and transcripts. |
| Configuration ease |  | Prompt/provider/workflow setup speed. |
| Estimated cost |  | Compared to Retell for similar usage. |
| Stability |  | Crashes, dropped audio, failed runs. |
| Setup time |  | Time from clean environment to first test. |

## Decision Rule

Do not migrate from Retell until Dograh completes at least 20 test calls with average score `>= 4/5` and no critical blocker in latency, interruption handling, or Spanish quality.
