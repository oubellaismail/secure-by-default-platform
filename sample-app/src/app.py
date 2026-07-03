"""Minimal sample service used to exercise the platform end-to-end.

Deliberately tiny: the point is the delivery path (scan -> sign -> GitOps ->
admission), not the app. FastAPI chosen for a small, containerizable footprint.
"""
from fastapi import FastAPI

app = FastAPI(title="sbdp-sample-app")


@app.get("/healthz")
def healthz() -> dict[str, str]:
    return {"status": "ok"}


@app.get("/")
def root() -> dict[str, str]:
    return {"message": "shipped the secure-by-default way"}
