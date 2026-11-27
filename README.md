# NodeBudget — Production Self-Hosted AI & n8n Docker Compose Templates (2026)

Production-hardened Docker Compose stacks, Caddy 2.8 automatic HTTPS configs, 2 GB Linux swap protection, and Ubuntu 24.04 bootstrap scripts for running AI agents and workflow automation 24/7 without OOM crashes.

- **Interactive Cost & Docker Blueprint Generator**: https://nodebudget.dev/
- **Container RAM, Swap & OOM Sizing Calculator**: https://nodebudget.dev/tools/ram-sizing/
- **n8n / OpenClaw / Docker Error Decoder**: https://nodebudget.dev/tools/error-decoder/
- **2026 First-Party Linux 6.8 VPS Telemetry Lab & JSON Dataset**: https://nodebudget.dev/benchmarks/
- **Head-to-Head Comparisons**: [n8n vs Make vs Zapier](https://nodebudget.dev/compare/n8n-vs-make-vs-zapier/) · [RackNerd vs Hostinger vs DigitalOcean](https://nodebudget.dev/compare/racknerd-vs-hostinger-vs-digitalocean/) · [Beelink N100 vs Mac mini M4 vs VPS](https://nodebudget.dev/compare/beelink-n100-vs-mac-mini-m4-vs-vps/)

## Included Production Stacks

| Directory | Stack | Key Production Safeguards |
| --- | --- | --- |
| `n8n-caddy-postgres/` | n8n Community + PostgreSQL 16 + Caddy 2.8 | Eliminates `SQLITE_BUSY`, automatic 7-day execution pruning (`EXECUTIONS_DATA_PRUNE=true`), automatic Let's Encrypt TLS |
| `openclaw-24x7-vps/` | OpenClaw 24/7 AI Agent + Caddy 2.8 | 2 GB Linux swap, `NODE_OPTIONS=--max-old-space-size=2048`, container memory cap preventing Exit Code 137 OOM kills |
| `ai-voice-receptionist-n8n-elevenlabs/` | n8n + PostgreSQL 16 + ElevenLabs Streaming Voice | Caddy `flush_interval -1` for sub-900ms streaming voice webhooks |
| `benchmark-repro.sh` | Reproducible Linux VPS Telemetry Check | Measures kernel, CPU, `fdatasync` disk I/O, and live process RSS |

## Quick Start (Ubuntu 24.04 LTS)

```bash
git clone https://github.com/a895047059/stackpilot-ai-docker-templates.git
cd stackpilot-ai-docker-templates/n8n-caddy-postgres
cp .env.example .env
# Edit .env and Caddyfile with your domain & secrets
bash install-ubuntu.sh
```

## First-Party Linux 6.8 Telemetry Summary (2026-11-26)

Measured on a live 3 vCPU Intel Xeon E5-2680 v4 KVM node (`Linux 6.8.0-147-generic`):
- Sequential 64 MB `fdatasync` disk write: **490 MB/s**
- `PostgreSQL 16` idle RSS: **31 MB**
- `cloudflared` Zero-Trust HTTPS tunnel RSS: **39 MB**
- `dockerd` + `containerd` combined RSS: **138 MB**

Download the full machine-readable telemetry dataset: https://nodebudget.dev/benchmarks/2026-11-telemetry.json

## License

MIT License — maintained by [Yuanqiang Leng](https://nodebudget.dev/about/).

## 2026 First-Party Engineering Lab Essays (NodeBudget)

All templates in this repository are backed by reproducible measurements on a live Linux 6.8 KVM node ([benchmark CLI repo](https://github.com/a895047059/nodebudget-vps-bench)):

- [Full Searchable Engineering Library (17 Essays & Field Guides)](https://nodebudget.dev/guides/)
- [Why 90% of 'Best VPS for n8n' Benchmarks Lie: Live 4K fsync & SQLite WAL Burst Study](https://nodebudget.dev/guides/why-cheap-vps-benchmarks-lie/)
- [The AI Agent Billing Trap: Zapier & Make vs Self-Hosting (And 3 Cases Not to Self-Host)](https://nodebudget.dev/guides/ai-agent-billing-trap-zapier-make-n8n/)
- [Anatomy of a 03:14 UTC Exit Code 137 OOM Crash](https://nodebudget.dev/guides/anatomy-of-n8n-exit-137-oom-postmortem/)
- [Caddy 2.8 vs Nginx vs Cloudflare Tunnel for AI Webhooks](https://nodebudget.dev/guides/caddy-vs-nginx-vs-cloudflare-tunnel-webhooks/)
- [PostgreSQL 16 Tuning on a 4 GB VPS (6 Exact Flags)](https://nodebudget.dev/guides/postgres-16-tuning-4gb-vps-n8n/)
- [Why I Retired Raspberry Pi 5 for a $169 Intel N100 Mini PC (Real BOM)](https://nodebudget.dev/guides/beelink-n100-vs-raspberry-pi-5-ai-homelab/)
- [The Docker UFW Bypass Trap: 60-Second Port Audit](https://nodebudget.dev/guides/docker-security-hardening-ufw-bypass-myth/)
- [Mac mini M4 Local LLMs (Ollama / MLX) vs Cloud APIs](https://nodebudget.dev/guides/local-llm-mac-mini-m4-vs-api-break-even/)
- [n8n Redis Queue Mode & Multi-Worker Thresholds](https://nodebudget.dev/guides/n8n-queue-mode-redis-workers-when-to-upgrade/)
- [Zero-Cost Encrypted Offsite Backups (pg_dump + age + Cloudflare R2)](https://nodebudget.dev/guides/encrypted-offsite-backups-n8n-postgres-r2/)
- [Fixing OpenClaw / Headless Chromium 64 MB /dev/shm & Zombie PIDs](https://nodebudget.dev/guides/openclaw-memory-leak-browser-automation-limits/)
- [Dissecting a 900 ms AI Voice Receptionist Latency Budget](https://nodebudget.dev/guides/ai-voice-agent-latency-budget-900ms/)
