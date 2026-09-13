# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2026-08-19

### Added

- **Multi-Format Image Support (.PNG, .JPG, .JPEG, .WEBP)**:
  - Added magic-byte signature validation and MIME-type detection for PNG, JPEG, and WEBP images.
  - Implemented multimodal vision OCR in `GeminiClient` (`extract_text_from_image`) utilizing Gemini 3.5's vision capabilities with inline base64 image data.
  - Unified `DocumentParserService` and `ResumeAnalysisService` supporting `parse_document` and `analyze_document` for arbitrary PDF and image resumes.
  - Updated API routes (`POST /api/v1/analyze`, `POST /api/v1/parse`, `POST /api/v1/compare`), CLI, and Web Dashboard SPA to seamlessly accept images alongside PDFs.
- **Expanded Test Suite**:
  - 66 unit and integration tests passing with 89% code coverage.

---

## [0.2.0] - 2026-08-19

### Added

- **Multi-Resume Comparison & Benchmarking**:
  - `POST /api/v1/compare`: Concurrently analyzes and ranks candidate resumes against a target job role.
  - `ResumeComparisonService` calculating rank orders, score deltas, and comparative summaries.
- **Printable HTML/PDF Report Generator**:
  - `POST /api/v1/export/report`: Generates self-contained, standalone printable HTML reports with print-optimized styling.
  - `ReportGeneratorService` formatting score gauges, ATS check findings, and bullet rewrite diffs.
- **Enhanced ATS Buzzword & Cliché Detection**:
  - Deterministic check flagging overused buzzwords (`synergy`, `results-driven`, `go-getter`, `hard worker`, etc.).
- **Interactive Web Dashboard (SPA)**:
  - Glassmorphism dark mode single-page application served directly by FastAPI at `/`.
  - Real-time animated score rings, filterable ATS checklists, keyword tag clouds, and 1-click sample demo loader.
  - One-click print/PDF report opening.
- **Command-Line Interface (CLI)**:
  - `python -m resume_analyzer.cli` with `analyze`, `parse`, and `serve` commands.
- **Expanded Test Suite**:
  - 59 unit and integration tests passing with 90% total code coverage.

---

## [0.1.0] - 2026-08-19

### Added

- **PDF Parsing Service**: Dual-engine extraction supporting PyMuPDF and pypdf with layout extraction, section detection, and contact regex parsing.
- **LLM Client Abstraction**: `BaseLLMClient` with `GeminiClient` supporting structured Pydantic schema generation, retry loops with exponential backoff on HTTP 429/503.
- **Resume Analysis Engine**: `ResumeAnalysisService` providing holistic scoring (0-100), deterministic ATS compatibility checks, section-by-section evaluation, ranked actionable rewrite suggestions, and target role alignment.
- **FastAPI Endpoints & Middleware**:
  - `POST /api/v1/analyze`: Full AI analysis with optional target role / job description.
  - `POST /api/v1/parse`: PDF extraction without LLM invocation.
  - `GET /health` & `GET /api/v1/health`: System health and model info.
  - Custom `RequestContextMiddleware` injecting `X-Request-ID` and `X-Process-Time`.
  - Standardized domain exception handling mapping to RFC-like error responses.
- **Docker Containerization**: Multi-stage production `Dockerfile`, `docker-compose.yml`, and `.dockerignore`.
- **CI/CD Automation**: GitHub Actions workflow testing matrix across Python 3.11 & 3.12 with Ruff linting, Mypy type checks, and Pytest coverage enforcement.
- **Comprehensive Documentation**: `docs/architecture.md` and `docs/api.md`.
- **Test Suite**: 44 unit and integration tests achieving 89% code coverage.
