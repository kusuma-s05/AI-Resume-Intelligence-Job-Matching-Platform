# =============================================================================
# AI Resume Analyzer — Makefile
# =============================================================================
# Common development commands. Run `make help` to see available targets.
# On Windows without make, use the raw commands documented in each target.
# =============================================================================

.PHONY: help install lint format typecheck test test-unit test-integration run docker-build docker-run clean

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# --- Setup ---

install: ## Install all dependencies (including dev)
	uv sync --all-extras

# --- Code Quality ---

lint: ## Run linter (ruff)
	uv run ruff check src/ tests/

format: ## Format code (ruff)
	uv run ruff format src/ tests/
	uv run ruff check --fix src/ tests/

typecheck: ## Run type checker (mypy)
	uv run mypy src/

# --- Testing ---

test: ## Run all tests with coverage
	uv run pytest

test-unit: ## Run unit tests only
	uv run pytest tests/unit/ -v

test-integration: ## Run integration tests only
	uv run pytest tests/integration/ -v

# --- Running ---

run: ## Start the development server
	uv run uvicorn resume_analyzer.main:app --reload --host 0.0.0.0 --port 8000

# --- Docker ---

docker-build: ## Build Docker image
	docker build -t ai-resume-analyzer .

docker-run: ## Run with Docker Compose
	docker compose up

# --- Cleanup ---

clean: ## Remove build artifacts and caches
	rm -rf dist/ build/ *.egg-info .mypy_cache/ .pytest_cache/ .ruff_cache/ htmlcov/ .coverage
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
