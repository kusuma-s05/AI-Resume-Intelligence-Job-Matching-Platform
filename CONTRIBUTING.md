# Contributing to AI Resume Analyzer

Thank you for your interest in contributing to **AI Resume Analyzer**! We welcome bug reports, feature proposals, and pull requests.

---

## 🛠️ Development Setup

### 1. Prerequisites
- **Python 3.11+** (Python 3.12 recommended)
- **Node.js 18+** & **npm** (optional, for developer workflow scripts)
- **Git**
- A **Google Gemini API Key** from [Google AI Studio](https://aistudio.google.com/)

### 2. Clone & Install
```bash
git clone https://github.com/tokumag/ai-resume-analyzer.git
cd ai-resume-analyzer

# Create virtual environment
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\Activate.ps1

# Install in editable mode with development dependencies
pip install -e .[dev]
```

### 3. Configure Environment Variables
```bash
cp .env.example .env
```
Edit `.env` and set your `GEMINI_API_KEY`:
```ini
GEMINI_API_KEY=your_actual_gemini_api_key
GEMINI_MODEL=gemini-3.5-flash
```

---

## 🧪 Testing & Quality Gates

Before submitting a Pull Request, all automated checks must pass:

```bash
# 1. Code Style & Formatting (Ruff)
ruff check src/ tests/
ruff format --check src/ tests/

# 2. Static Type Checking (Mypy)
mypy src/

# 3. Unit & Integration Tests with Coverage (Pytest)
pytest --cov=resume_analyzer --cov-fail-under=80

# Or run everything via npm:
npm test
npm run build
```

---

## 🌿 Branching & PR Guidelines

1. **Branch Naming**:
   - `feature/your-feature-name`
   - `fix/issue-description`
   - `docs/update-readme`
2. **Commit Messages**:
   - Follow [Conventional Commits](https://www.conventionalcommits.org/): `feat:`, `fix:`, `docs:`, `test:`, `refactor:`, `chore:`.
3. **Pull Request Checklist**:
   - [ ] All 66+ tests pass with `pytest`.
   - [ ] Type checking passes with `mypy src/`.
   - [ ] Linter passes with `ruff check src/ tests/`.
   - [ ] New features include corresponding unit and integration tests.
   - [ ] Documentation (`README.md`, `docs/`) updated if APIs or configuration changed.

---

## 📄 License
By contributing, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).
