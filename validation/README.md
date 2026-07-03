# Validation — proving controls defeat modeled threats

This directory is the project's differentiator. It turns "I installed tools" into
"I demonstrated each control defeating a modeled threat." Do not let it get squeezed.

Each file corresponds to one row of `docs/threat-model/02-control-map.md`. Template for
each:

```
# <NN> <control name>

## Threat
The modeled threat (link to the STRIDE entry).

## Attack attempted
The concrete bad thing tried (unsigned image, hardcoded secret, privileged pod...).

## Expected result
Blocked / refused / failed pipeline — and where the evidence appears.

## Evidence
Command output, screenshot, or log excerpt showing the block.

## Status
NOT-YET / DEMONSTRATED
```

## Checklist (mirrors the control map)

- [ ] 01 SAST blocks vulnerable code
- [ ] 02 Gitleaks blocks a committed secret
- [ ] 03 SCA blocks a known-vulnerable dependency
- [ ] 04 IaC scan blocks a misconfiguration
- [ ] 05 Cosign signature required; tampered/unsigned image not trusted
- [ ] 06 GitOps: out-of-band change is reverted / auditable
- [ ] 07 Admission refuses an unsigned image  ← the headline demo
- [ ] 08 Falco detects malicious runtime behavior
- [ ] 09 Cilium blocks disallowed lateral traffic
- [ ] 10 Secret is sourced from the store, never from Git
- [ ] 11 Security signals are visible and queryable
