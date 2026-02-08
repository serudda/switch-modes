# Switch Modes - OpenClaw Skill

Switch between AI models instantly to save money. Use cheap models for simple tasks, powerful models for complex ones.

Save 60-80% on your AI API costs.

---

## How It Works

You define 4 modes, each mapped to a different AI model. When you say a mode name, the agent changes the **primary model in your OpenClaw config** (`openclaw.json`). The gateway restarts (~2 seconds) and the change is **real and persistent**.

This is not a session override. It's a real config change.

---

## Commands

### Switch Modes

Say the mode name in your message:

- `eco mode` → Switch to your cheapest model
- `balanced mode` → Switch to your daily driver
- `smart mode` → Switch to your powerful model
- `max mode` → Switch to your most powerful model

### Check Current Mode

```
/modes status
```

Shows your current mode, active model, and all configured modes.

### Setup / Reconfigure

```
/modes setup
```

Conversational wizard. The agent asks you 4 questions (one per mode) and saves your config. No file editing needed.

---

## Setup

### First Time

Tell your agent:

```
/modes setup
```

The agent will ask you to choose a model for each mode:

- **🟢 ECO** - For simple tasks. Recommended: `anthropic/claude-3.5-haiku`
- **🔵 BALANCED** - Daily driver. Recommended: `anthropic/claude-sonnet-4-5`
- **🟠 SMART** - Complex reasoning. Recommended: `anthropic/claude-opus-4-5`
- **🔴 MAX** - Maximum power. Recommended: `anthropic/claude-opus-4-6`

Your config is saved to `~/.openclaw/workspace/switch-modes.json`.

---

## Configuration File

Located at: `~/.openclaw/workspace/switch-modes.json`

```json
{
  "eco": "anthropic/claude-3.5-haiku",
  "balanced": "anthropic/claude-sonnet-4-5",
  "smart": "anthropic/claude-opus-4-5",
  "max": "anthropic/claude-opus-4-6"
}
```

You can edit this file directly or use `/modes setup`.

---

## Technical Details

### What happens when you switch modes:

1. Agent detects mode command in your message (e.g. `eco mode`)
2. Agent reads `~/.openclaw/workspace/switch-modes.json`
3. Agent calls `gateway config.patch` to change `agents.defaults.model.primary` in `openclaw.json`
4. Gateway restarts (~2 seconds)
5. Agent confirms the switch

### Important:

- **Persistent:** The model change survives restarts, new sessions, everything
- **Real:** It changes `openclaw.json` directly - not a temporary override
- **Gateway restart:** Takes ~2 seconds. You'll see a brief reconnection
- **All sessions affected:** This changes the default model for all sessions

---

## Agent Integration

Add this to your `~/.openclaw/workspace/AGENTS.md`:

```markdown
## Switch Modes Skill

I have the Switch Modes skill installed. I can switch between cost-optimized models dynamically.

**Commands I understand:**
- `eco mode` - Switch to cheapest model (simple tasks, summaries, quick questions)
- `balanced mode` - Switch to daily driver model (general work, coding, writing)
- `smart mode` - Switch to powerful model (complex reasoning, architecture, debugging)
- `max mode` - Switch to maximum power (critical decisions, deep analysis)
- `/modes status` - Show current mode and model
- `/modes setup` - Configure model preferences

**How it works:**
1. When I detect a mode command, I read `switch-modes.json` from workspace
2. I call `gateway config.patch` to change the primary model in `openclaw.json`
3. The gateway restarts (~2 seconds)
4. I confirm the switch

**Setup wizard (conversational):**
When user runs `/modes setup`, I guide them through choosing a model for each mode:
1. Ask for ECO mode model (with recommendation)
2. Ask for BALANCED mode model
3. Ask for SMART mode model
4. Ask for MAX mode model
5. Write the config to `switch-modes.json` using the `write` tool
6. Confirm completion

**When to suggest mode switching:**
- User asks for something simple → suggest "eco mode" if not already there
- User needs complex reasoning → suggest "smart mode" or "max mode"
- User mentions cost concerns → explain mode benefits

**Detection:** I automatically detect mode keywords in messages and switch accordingly. No need for special syntax - natural language works.

**Config location:** `~/.openclaw/workspace/switch-modes.json`
```

---

## Supported Models

### Anthropic
- `anthropic/claude-3.5-haiku` (fastest, cheapest)
- `anthropic/claude-sonnet-4-5` (balanced)
- `anthropic/claude-opus-4-5` (powerful)
- `anthropic/claude-opus-4-6` (most powerful)

### OpenAI
- `openai/gpt-4o-mini` (cheap)
- `openai/gpt-4o` (balanced)
- `openai/o1` (reasoning)
- `openai/o1-pro` (max reasoning)

Use any model ID supported by your OpenClaw installation.

---

## Troubleshooting

**"Model not found" error:**
- Check the model ID is correct
- Verify your API keys are configured in OpenClaw

**Mode not switching:**
- Run `/modes status` to check current mode
- Check `~/.openclaw/workspace/switch-modes.json` exists
- Try `/modes setup` again

**Gateway not restarting:**
- Check OpenClaw is running: `openclaw status`
- Try manually: `openclaw gateway restart`

---

## License

MIT - Free to use, modify, and distribute.

## Credits

Created by [Sergio Ruiz (Serudda)](https://uiguideline.com)
