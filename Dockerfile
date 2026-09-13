# =============================================================================
# Stage 1: Build & Dependencies
# =============================================================================
FROM python:3.12-slim AS builder

WORKDIR /app

# Install build dependencies if necessary
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install python dependencies
COPY pyproject.toml .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    fastapi \
    "uvicorn[standard]" \
    pydantic \
    pydantic-settings \
    pymupdf \
    google-generativeai \
    python-multipart

# =============================================================================
# Stage 2: Final Runtime Image
# =============================================================================
FROM python:3.12-slim AS runner

WORKDIR /app

# Create non-root system user
RUN groupadd -r appgroup && useradd -r -g appgroup -d /app -s /sbin/nologin appuser

# Copy virtualenv from builder
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH" \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    APP_ENV=production \
    APP_HOST=0.0.0.0 \
    APP_PORT=8000

# Copy application source code
COPY --chown=appuser:appgroup src/ /app/src/
COPY --chown=appuser:appgroup README.md /app/

# Set Python path to find resume_analyzer package
ENV PYTHONPATH="/app/src"

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

CMD ["uvicorn", "resume_analyzer.main:app", "--host", "0.0.0.0", "--port", "8000"]
