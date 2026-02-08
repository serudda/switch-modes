# Implementation Guide

This document explains how to integrate Model Modes detection into your OpenClaw agent.

---

## How It Works

The agent needs to:
1. Detect mode switch commands in user messages
2. Read the user's model-modes.json config
3. Call session_status with the appropriate model parameter
4. Confirm the switch to the user

---

## Detection Logic

The agent should detect these patterns in user messages:

```
eco mode
balanced mode  
smart mode
max mode
```

**Case insensitive, flexible matching:**
- "eco mode"
- "switch to eco"
- "use eco mode"
- "eco"

---

## Configuration File

Location: `~/.openclaw/workspace/model-modes.json`

Format:
```json
{
  "eco": "anthropic/claude-3.5-haiku",
  "balanced": "anthropic/claude-sonnet-4-5",
  "smart": "anthropic/claude-opus-4-5",
  "max": "anthropic/claude-opus-4-6"
}
```

---

## Agent Implementation

### Step 1: Detect Command

When user message contains mode keywords:
- Check for: "eco", "balanced", "smart", "max" + "mode"
- Or command: `/modes status` or `/modes setup`

### Step 2: Load Config

Read `~/.openclaw/workspace/model-modes.json`

If file doesn't exist → prompt user to run `/modes setup`

### Step 3: Switch Model

For mode switch (e.g., "eco mode"):
1. Get model from config: `config.eco`
2. Call `session_status({ model: config.eco })`
3. Confirm to user: "✅ ECO mode activated (claude-3.5-haiku)"

For `/modes status`:
1. Call `session_status()` to get current model
2. Match current model to mode in config
3. Reply: "🔵 BALANCED mode (claude-sonnet-4-5)"

For `/modes setup`:
1. Ask user for each mode's model
2. Save to `model-modes.json`
3. Confirm: "✅ Configuration saved"

---

## Example Agent Flow

### Scenario 1: User Switches Mode

```
User: eco mode

Agent detects "eco mode"
→ Reads model-modes.json
→ Gets eco: "anthropic/claude-3.5-haiku"
→ Calls session_status({ model: "anthropic/claude-3.5-haiku" })
→ Replies: "✅ ECO mode activated (claude-3.5-haiku)"
```

### Scenario 2: User Checks Status

```
User: /modes status

Agent detects "/modes status"
→ Calls session_status() to get current model
→ Reads model-modes.json
→ Matches current model to mode
→ Replies: "🔵 Current: BALANCED mode (claude-sonnet-4-5)"
```

### Scenario 3: First Time Setup

```
User: /modes setup

Agent detects "/modes setup"
→ Checks if model-modes.json exists
→ Prompts:
   "Configure your modes:
    
    🟢 ECO (simple tasks)
    Recommended: anthropic/claude-3.5-haiku
    Your model: [waiting for input]"
    
User: anthropic/claude-3.5-haiku

→ Agent continues for balanced, smart, max
→ Saves to model-modes.json
→ Confirms: "✅ Configuration saved. Use 'eco mode' to switch."
```

---

## Error Handling

### Config File Missing
```
User: eco mode

Agent:
"Model Modes not configured yet. Run '/modes setup' to configure your modes first."
```

### Invalid Model ID
```
User has configured: "eco": "invalid-model-id"

Agent attempts switch:
→ session_status returns error
→ Agent replies:
"⚠️ Model 'invalid-model-id' not found. Check your configuration or API keys."
```

### Mode Not Found
```
User: ultra mode

Agent:
"Mode 'ultra' not recognized. Available modes: eco, balanced, smart, max"
```

---

## Integration with AGENTS.md

Add this section to your AGENTS.md:

```markdown
## Model Modes Skill

I have the Model Modes skill installed. I can switch between cost-optimized models dynamically.

**Commands I understand:**
- `eco mode` - Switch to cheapest model
- `balanced mode` - Switch to daily driver  
- `smart mode` - Switch to powerful model
- `max mode` - Switch to maximum power
- `/modes status` - Show current mode
- `/modes setup` - Configure modes

**When to switch:**
- Use ECO for: summaries, simple questions, casual chat
- Use BALANCED for: general work, coding, writing
- Use SMART for: complex reasoning, debugging, architecture
- Use MAX for: critical decisions, deep analysis

**Detection:** I automatically detect mode keywords in messages and switch accordingly.
```

---

## Testing

### Manual Test Checklist

- [ ] `/modes setup` - Creates config file
- [ ] `eco mode` - Switches to eco model
- [ ] `balanced mode` - Switches to balanced model
- [ ] `smart mode` - Switches to smart model
- [ ] `max mode` - Switches to max model
- [ ] `/modes status` - Shows current mode correctly
- [ ] Invalid mode - Shows helpful error
- [ ] Config missing - Prompts for setup
- [ ] Invalid model ID - Shows error with guidance

---

## Advanced: Custom Modes

Users can manually edit `model-modes.json` to add custom logic:

```json
{
  "eco": "anthropic/claude-3.5-haiku",
  "balanced": "anthropic/claude-sonnet-4-5",
  "smart": "anthropic/claude-opus-4-5",
  "max": "openai/o1-pro",
  "_note": "Custom modes not officially supported but possible"
}
```

---

## Performance Considerations

- Config file is small (~200 bytes) - OK to read on every mode switch
- session_status call is fast (<100ms typically)
- No need to cache - simple read → switch flow is efficient

---

## Future Enhancements

Possible additions (not in v1.0):
- Auto-detect task complexity and suggest mode
- Cost tracking per session
- Mode presets for different workflows
- Context-aware mode switching
- Integration with billing/quota systems

---

For questions or issues, see the main [SKILL.md](./SKILL.md) documentation.
