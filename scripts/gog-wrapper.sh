#!/bin/bash
# Wrapper to execute gog from the host machine
# Emily can call this script from within the container

# This script should be executed by docker exec on the host
# Usage: docker exec <container> /home/node/scripts/gog-wrapper.sh <gog-command> [args...]

echo "ERROR: gog must be executed on the Windows host"
echo "To use gog from Emily, she needs to execute PowerShell commands via the runtime"
echo "Example: Run-Command 'gog drive list'"
exit 1
