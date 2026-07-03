# Multi-stage, non-root, minimal — the image is itself an artifact we scan and sign.
FROM python:3.14-slim AS base

# Non-root by default (least privilege; Kyverno will also enforce this at admission).
RUN useradd --create-home --uid 10001 appuser
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --require-hashes=false -r requirements.txt

COPY src/ ./src/

USER 10001
EXPOSE 8000

# Healthcheck aligns with the k8s readiness probe.
HEALTHCHECK --interval=30s --timeout=3s CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/healthz')" || exit 1

CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8000"]
