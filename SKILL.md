---
name: switch-modes
description: Switch between AI models dynamically to optimize costs and performance. Use when the user says mode commands like "eco mode", "balanced mode", "smart mode", or "max mode", or when they want to check their current mode with "/modes status" or configure modes with "/modes setup".
license: MIT
metadata:
  author: serudda
  version: "1.0.0"
---

# Switch Modes

Dynamically switch between AI models to optimize costs and performance.

## When to Use This Skill

Activate this skill when the user mentions:

- Mode switching commands: eco mode, balanced mode, smart mode, max mode
- Status check: /modes status
- Configuration: /modes setup

## How It Works

The skill manages 4 predefined modes, each mapped to a specific model:

- eco → Cheapest model (for summaries, quick questions)
- balanced → Daily driver model (for general work)
- smart → Powerful model (for complex reasoning)
- max → Most powerful model (for critical tasks)

When switching modes, the agent changes the **primary model in `openclaw.json`** using `gateway config.patch`. This is a **real, persistent change** — not a session override. The gateway restarts (~2 seconds) after each switch.

Configuration is stored in `~/.openclaw/workspace/switch-modes.json`.

## Step-by-Step Instructions

### 1. Detect Mode Commands

When the user message contains any of these patterns:

- `eco mode` or `eco` (standalone)
- `balanced mode` or `balanced`
- `smart mode` or `smart`
- `max mode` or `max`
- `/modes status`
- `/modes setup`

### 2. Handle Setup Command (/modes setup)

If the configuration file doesn't exist or user requests setup:

1. Ask the user for their preferred model for each mode:
   - ECO mode: Recommend `anthropic/claude-3.5-haiku`
   - BALANCED mode: Recommend `anthropic/claude-sonnet-4-5`
   - SMART mode: Recommend `anthropic/claude-opus-4-5`
   - MAX mode: Recommend `anthropic/claude-opus-4-6` or `openai/o1-pro`

2. Create/update `~/.openclaw/workspace/switch-modes.json` with the structure:

```json
{
	"eco": "model-id",
	"balanced": "model-id",
	"smart": "model-id",
	"max": "model-id"
}
```

3. Confirm setup completion to the user.

### 3. Handle Status Command (/modes status)

1. Call `session_status` to get current model
2. Read `~/.openclaw/workspace/switch-modes.json` to get mode mappings
3. Determine which mode is currently active by matching the current model
4. Display:

```
🎛️ Switch Modes - Status

Current mode: 🟢 ECO (anthropic/claude-3.5-haiku)

All modes:
🟢 eco → claude-3.5-haiku ← active
🔵 balanced → claude-sonnet-4-5
🟠 smart → claude-opus-4-5
🔴 max → claude-opus-4-6
```

### 4. Handle Mode Switch Commands

When user requests a mode switch:

1. Read configuration:

```
~/.openclaw/workspace/switch-modes.json
```

If file doesn't exist, prompt user to run `/modes setup` first.

2. Get the target model from the config based on requested mode (eco/balanced/smart/max)

3. Call `gateway config.patch` with:

```json
{ "agents": { "defaults": { "model": { "primary": "target-model-id" } } } }
```

This changes the primary model in `openclaw.json` and triggers a gateway restart (~2 seconds).

4. Confirm to user:

```
✅ ECO mode activated (claude-3.5-haiku)
```

## Examples

### Example 1: Mode Switch

```
User: eco mode

Agent: [reads switch-modes.json, gets model for "eco"]
Agent: [calls gateway config.patch to change primary model]
Agent: ✅ ECO mode activated (anthropic/claude-3.5-haiku)
```

### Example 2: Status Check

```
User: /modes status

Agent: [calls session_status for current model]
Agent: [reads switch-modes.json for mode mappings]
Agent:
🎛️ Switch Modes - Status

Current mode: 🔵 BALANCED (anthropic/claude-sonnet-4-5)

All modes:
🟢 eco → claude-3.5-haiku
🔵 balanced → claude-sonnet-4-5 ← active
🟠 smart → claude-opus-4-5
🔴 max → claude-opus-4-6
```

### Example 3: First Time Setup

```
User: /modes setup

Agent: Let's configure your modes! 🎛️

🟢 ECO MODE (simple tasks)
Recommended: anthropic/claude-3.5-haiku
What model for ECO?

User: anthropic/claude-3.5-haiku

Agent: ✅ ECO: anthropic/claude-3.5-haiku

🔵 BALANCED MODE (daily driver)
Recommended: anthropic/claude-sonnet-4-5
What model for BALANCED?

[continues for smart and max...]

Agent: [creates ~/.openclaw/workspace/switch-modes.json]
Agent: 🎉 Setup complete! Use: eco mode, balanced mode, smart mode, max mode
```

## File Locations

- Configuration: `~/.openclaw/workspace/switch-modes.json`
- OpenClaw Config: `~/.openclaw/openclaw.json`
- Example Config: See `example-config.json` in skill directory

## Common Edge Cases

1. **Config file missing:** Prompt user to run `/modes setup`
2. **Invalid model ID:** Show error and ask user to reconfigure that mode
3. **Model not available:** Suggest checking API keys and model access in OpenClaw
4. **Ambiguous input:** If just "eco" or "smart" without "mode", still treat as mode switch command
5. **Case insensitive:** Accept "ECO MODE", "Eco Mode", "eco mode" all the same

## Important Notes

- Mode switching triggers a gateway restart (~2 seconds)
- Changes the primary model in `openclaw.json` — affects all sessions
- Preserve all other settings in `openclaw.json` when updating model
- Always validate JSON before writing config files
- Use absolute paths: `~/.openclaw/...` not relative paths
