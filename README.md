# Palworld — Dedicated Game Server

Palworld multiplayer server for Yggdrasil, running on the Gaia manager node via Docker Swarm.

## Services

| Service | Role |
|---|---|
| palworld-server | Palworld dedicated server (thijsvanloef/palworld-server-docker) |

## Deploy

Stack deployment is managed automatically via GitHub Actions CI/CD on pushes to `main`.

To deploy manually using centralized `yggdrasil-os` tooling:

```bash
curl -fsSL https://raw.githubusercontent.com/yggdrasil-lab/yggdrasil-os/main/deploy/deploy.sh -o /tmp/deploy.sh
chmod +x /tmp/deploy.sh
/tmp/deploy.sh "palworld" docker-compose.yml
```

## Setup

First-time host setup is provisioned on the Manager Node (Gaia) via `yggdrasil-os`:

```bash
curl -fsSL https://raw.githubusercontent.com/yggdrasil-lab/yggdrasil-os/main/hosts/setup_gaia.sh | sudo bash
```

This creates `/opt/palworld/data` and `/opt/palworld/backups` on Gaia with correct ownership (1000:1000).

## Configuration

| Variable | Source | Default |
|---|---|---|
| SERVER_NAME | docker-compose.yml | Palworld Server |
| SERVER_PASSWORD | GitHub secret `PALWORLD_SERVER_PASSWORD` | (none) |
| ADMIN_PASSWORD | GitHub secret `PALWORLD_ADMIN_PASSWORD` | (none) |

## Ports

| Port | Protocol | Purpose |
|---|---|---|
| 8211 | UDP | Game traffic |
| 27015 | UDP | Steam query |
| 25575 | TCP | RCON admin |
