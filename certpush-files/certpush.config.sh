#!/bin/bash
# Run this with https://github.com/jlu5/certpush

# Sets the target conf dir for remote servers (where we will push our configs).
# This is the DEFAULT path, which can be overridden by TARGET_PATHS below.
DEFAULT_TARGETPATH="/etc/aptly/ssl"

# Paths to write the files to in the target folder
CERT_NAME="fullchain.pem"
KEY_NAME="privkey.pem"

# List of DNS names to push to each server - addresses for each server are comma separated
declare -A CERTPUSH_SERVERS=()
CERTPUSH_SERVERS[staging.utopia-repository.org]="staging.utopia-repository.org"

# Server specific scp options
declare -A OPTIONS=()

# Server specific target paths
declare -A TARGET_PATHS=()

# List of DNS names to add to all servers (Round robin addresses)
POOL_NAMES=()
POOL_NAMES+=(staging.utopia-repository.org)
POOL_NAMES+=(deb.utopia-repository.org)
POOL_NAMES+=(ni.deb.utopia-repository.org)
POOL_NAMES+=(utopia-repository.org)
POOL_NAMES+=(www.utopia-repository.org)

# Certbot base arguments. By default this sets config, work, and log dirs to under the certpush
# directory, so that you don't need root to use certbot.
CONFIG_DIR=./certbot-config
CERTBOT_BASE_ARGS=(certbot --config-dir "$CONFIG_DIR" --work-dir ./workdir --logs-dir ./log)

# If enabled, tells certbot to fetch from the staging server
TEST_MODE=false

# Sets the authentication method - this example uses the Cloudflare DNS plugin
AUTH_METHOD=(--dns-cloudflare --dns-cloudflare-credentials ~/cloudflare-credentials.ini)

