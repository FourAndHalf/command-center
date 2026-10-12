# Project data format

JSON export format 2 includes `project_entries`, `project_entry_evidence`, and
`project_review_entries` in addition to the existing Command Center tables.
Format 1 backups remain importable with empty project tables.

`project_entries` is the lossless history. Each row has a stable ID, project
entity ID, logical kind (`setup`, `intent`, `observation`, or `focus_change`),
recorded timestamp, filing `localDay`, optional occurred timestamp, and typed
narrative fields. Corrections are append-only rows that reference the original;
they do not rewrite old observations or citations.

`project_entry_evidence` stores user-provided text or an inert HTTPS reference.
The app does not fetch or verify URLs. `project_review_entries` joins an exact
entry revision to a decision review.

JSON is the portable restore source. Markdown and CSV exports may present a
readable projection, but must retain the original IDs, correction IDs and join
keys so the history can be reconstructed.
