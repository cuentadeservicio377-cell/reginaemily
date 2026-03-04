# Google Workspace Integration via gog

## Status
- `gog` is installed on the Windows host (not in the container)
- Authenticated account: regina939ph@gmail.com
- Services: gmail, calendar, drive, contacts, docs, sheets

## How Emily Should Use gog

Since `gog` runs on the Windows host, Emily cannot execute it directly from the container.

### Workaround Options:

**Option 1: Manual Execution (Current)**
- Emily requests Google Workspace operations
- User executes `gog` commands manually on Windows
- Results are copied to memory files

**Option 2: MCP Integration (Future)**
- Set up an MCP server on Windows that exposes Google Workspace APIs
- Emily connects to the MCP server from the container

**Option 3: Native OpenClaw Commands (If Available)**
- Check if OpenClaw has native Google Workspace integration
- Configure OAuth directly in OpenClaw config

## Common gog Commands

```powershell
# List files in Drive
gog drive list --account regina939ph@gmail.com

# Create a folder
gog drive mkdir "Regina Pilates System" --account regina939ph@gmail.com

# Create a Google Doc
gog docs create "Plan de Estudio" --account regina939ph@gmail.com

# Create a Google Sheet
gog sheets create "Bitácora de Horas" --account regina939ph@gmail.com

# List calendar events
gog calendar events list --account regina939ph@gmail.com

# Create calendar event
gog calendar events create --summary "Práctica Pilates" --start "2026-03-04T10:00:00-06:00" --end "2026-03-04T11:00:00-06:00" --account regina939ph@gmail.com
```

## For Regina

Until we set up a proper MCP bridge, you can run these commands directly in PowerShell and tell Emily what was created.
