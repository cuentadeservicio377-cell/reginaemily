#!/usr/bin/env pwsh
# Proxy script to execute gog commands from Docker container to Windows host
# Usage: gog-proxy.ps1 <gog-command> [args...]

param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$GogArgs
)

# Execute gog with all passed arguments
& gog $GogArgs
