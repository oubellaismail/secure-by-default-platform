# Threat model

Phase 1 output. The threat model is the *why* behind every control in the platform.
Method: STRIDE per trust boundary, each threat mapped to a concrete, demonstrable control.

## Files

- `00-scope.md` — assets, actors, trust boundaries, assumptions (Phase 0 output).
- `01-stride.md` — STRIDE analysis per boundary.
- `02-control-map.md` — the threat-to-control bridge table (source of truth for the demo).

## The rule

Every threat we enumerate must map to a control we can *demonstrate defeating it* in
`validation/`. A threat with no demonstrable control is either out of scope (say so
explicitly) or an open risk (track it). No silent gaps.
