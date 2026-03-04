#!/bin/bash
# Bridge script to execute gog commands from inside Docker container
# This script should be executed on the Windows host via docker exec

set -euo pipefail

# Forward all arguments to gog on the host
exec gog "$@"
