# Palworld — Dedicated Game Server

Palworld multiplayer server for Yggdrasil, running on the Gaia manager node via Docker Swarm.

## Services

| Service | Role |
|---|---|
| palworld-server | Palworld dedicated server (thijsvanloef/palworld-server-docker) |

## Deploy

CI/CD runs via GitHub Actions on the gaia self-hosted runner. Push to main triggers deploy automatically.

Manual deploy:

```
DOCKER_HOST=ssh://gaia docker stack deploy -c docker-compose.yml palworld
```

## Setup

First-time host setup:

```
./setup_host_gaia.sh
```

This creates `/opt/palworld/data` on gaia with correct ownership for the container's 1000:1000 user.

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
