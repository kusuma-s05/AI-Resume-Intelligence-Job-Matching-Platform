# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.3.x   | :white_check_mark: |
| < 0.3.0 | :x:                |

---

## Reporting a Vulnerability

We take the security and integrity of **AI Resume Analyzer** seriously.

If you believe you have found a security vulnerability or sensitive data exposure issue:

1. **Do not create a public GitHub issue.**
2. Please open a private security advisory on GitHub or email the maintainer directly.
3. Include detailed reproduction steps, proof of concept, and impact assessment.

### Security Best Practices

- **Never commit `.env` files** containing live API keys to version control.
- Ensure all uploaded resume files are validated for magic byte signatures before processing.
- Run production deployments behind a reverse proxy (e.g., Nginx, Cloudflare) with rate limiting enabled.
