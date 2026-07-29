#!/bin/bash
set -e

# setup_host_gaia.sh
# Prepares the Gaia host directories for Palworld.
# Usage: ./setup_host_gaia.sh via SSH on the target node (Gaia)

echo "Setting up Palworld directories on Gaia..."

DIR="/opt/palworld/data"
if [ ! -d "${DIR}" ]; then
    echo "Creating ${DIR}..."
    sudo mkdir -p "${DIR}"
    sudo chown -R 1000:1000 "${DIR}"
fi

echo "Done. Gaia is ready for Palworld deployment."
