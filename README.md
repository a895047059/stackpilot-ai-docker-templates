# StackPilot — Production Self-Hosted AI & n8n Docker Compose Templates (2026)

Production-hardened Docker Compose stacks, Caddy 2.8 automatic HTTPS configs, 2 GB Linux swap protection, and Ubuntu 24.04 bootstrap scripts for running AI agents and workflow automation 24/7 without OOM crashes.

- **Interactive Cost & Docker Blueprint Generator**: https://stack.lyq705.com/
- **Container RAM, Swap & OOM Sizing Calculator**: https://stack.lyq705.com/tools/ram-sizing/
- **n8n / OpenClaw / Docker Error Decoder**: https://stack.lyq705.com/tools/error-decoder/
- **2026 First-Party Linux 6.8 VPS Telemetry Lab & JSON Dataset**: https://stack.lyq705.com/benchmarks/
- **Head-to-Head Comparisons**: [n8n vs Make vs Zapier](https://stack.lyq705.com/compare/n8n-vs-make-vs-zapier/) · [RackNerd vs Hostinger vs DigitalOcean](https://stack.lyq705.com/compare/racknerd-vs-hostinger-vs-digitalocean/) · [Beelink N100 vs Mac mini M4 vs VPS](https://stack.lyq705.com/compare/beelink-n100-vs-mac-mini-m4-vs-vps/)

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

Download the full machine-readable telemetry dataset: https://stack.lyq705.com/benchmarks/2026-11-telemetry.json

## License

MIT License — maintained by [Yuanqiang Leng](https://stack.lyq705.com/about/).
