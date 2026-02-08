# Model Modes - OpenClaw Skill

**Dynamically switch between AI models to optimize costs and performance.**

---

## What This Does

Tired of paying premium model prices for simple questions? This skill lets you define custom "modes" (eco, balanced, smart, max) and switch between them on the fly with simple commands.

**Example:**
- "eco mode" → Switch to cheapest model for quick tasks
- "smart mode" → Switch to powerful model for complex work
- Save 60-80% on API costs by using the right model for each task

---

## Installation

### Via ClawdHub (Recommended)
```bash
clawdhub install model-modes
```

### Manual
1. Clone or download this skill
2. Place in your OpenClaw skills directory
3. Run setup (see below)

---

## Setup

### First Time Configuration

Run the setup command:
```
/modes setup
```

You'll be asked to choose a model for each mode:

**🟢 ECO** - Cheapest, for simple tasks  
Recommended: `anthropic/claude-3.5-haiku`

**🔵 BALANCED** - Daily driver  
Recommended: `anthropic/claude-sonnet-4-5`

**🟠 SMART** - Complex reasoning  
Recommended: `anthropic/claude-opus-4-5`

**🔴 MAX** - Maximum power  
Recommended: `anthropic/claude-opus-4-6` or `openai/o1-pro`

Your configuration is saved to `workspace/model-modes.json`

---

## Usage

### Switch Modes

Simply include the mode name in your message:

```
eco mode
```
→ Switches to your ECO model

```
balanced mode
```
→ Switches to your BALANCED model

```
smart mode
```
→ Switches to your SMART model

```
max mode
```
→ Switches to your MAX model

### Check Current Mode

```
/modes status
```
→ Shows current mode + active model

### Reconfigure

```
/modes setup
```
→ Run setup again to change your model preferences

---

## Configuration File

Located at: `~/.openclaw/workspace/model-modes.json`

Example:
```json
{
  "eco": "anthropic/claude-3.5-haiku",
  "balanced": "anthropic/claude-sonnet-4-5",
  "smart": "anthropic/claude-opus-4-5",
  "max": "openai/o1-pro"
}
```

You can edit this file directly if you prefer.

---

## Use Cases

### 💰 Cost Optimization
- Use ECO for quick questions, summaries, simple tasks
- Use BALANCED for daily work
- Use SMART only when you need deep reasoning
- Use MAX for critical, complex problems

**Real savings:** Users report 60-80% cost reduction by using appropriate models.

### 🎯 Task-Based Switching
- Code review? → SMART mode
- Writing email? → ECO mode
- Architecture design? → MAX mode
- General chat? → BALANCED mode

### 🧪 Model Testing
- Quickly compare outputs from different models
- Test which model works best for your use case
- Switch mid-conversation to see differences

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

## Commands Reference

| Command | Action |
|---------|--------|
| `/modes setup` | Initial configuration or reconfigure |
| `/modes status` | Show current mode and model |
| `eco mode` | Switch to ECO mode |
| `balanced mode` | Switch to BALANCED mode |
| `smart mode` | Switch to SMART mode |
| `max mode` | Switch to MAX mode |

---

## Technical Details

**How it works:**
- Detects mode commands in your messages
- Uses OpenClaw's `session_status` tool with `model` parameter
- No gateway restart needed - instant switching
- Per-session override (doesn't affect other sessions)

**Privacy:**
- All configuration stored locally
- No data sent externally
- Standard OpenClaw security model

---

## Troubleshooting

**"Model not found" error:**
- Make sure the model ID is correct
- Check your API keys are configured in OpenClaw
- Some models require specific API plans

**Mode not switching:**
- Run `/modes status` to verify current mode
- Check `workspace/model-modes.json` exists and is valid JSON
- Try running `/modes setup` again

**Cost not decreasing:**
- Verify you're actually using ECO mode for simple tasks
- Check your model IDs - make sure ECO points to a cheaper model
- Review your usage patterns

---

## FAQ

**Q: Does this work with all OpenClaw installations?**  
A: Yes, as long as you have the models configured in your OpenClaw setup.

**Q: Can I add more than 4 modes?**  
A: Currently limited to 4 modes (eco/balanced/smart/max), but you can edit them to be whatever you want.

**Q: Will this break my existing setup?**  
A: No, it only changes models when you explicitly use mode commands.

**Q: Can I use this with custom/local models?**  
A: Yes! Any model ID that OpenClaw supports will work.

---

## Contributing

Found a bug? Have a feature request?  
Open an issue or PR on [GitHub](#).

---

## Agent Integration

To enable conversational installation and full Model Modes functionality, add this to your `~/.openclaw/workspace/AGENTS.md`:

```markdown
## Model Modes Skill

I have the Model Modes skill installed. I can switch between cost-optimized models dynamically.

**Commands I understand:**
- `eco mode` / `balanced mode` / `smart mode` / `max mode`
- `/modes status` - Show current mode
- `/modes setup` - Configure modes

**How it works:**
1. I detect mode commands in messages
2. I read `model-modes.json` from workspace
3. I call `session_status` with the model parameter
4. I confirm the switch

**Detection:** I automatically detect mode keywords - no special syntax needed.
```

---

## License

MIT - Free to use, modify, and distribute.

---

## Credits

Created by [Sergio Ruiz (Serudda)](https://uiguideline.com)  
Part of the OpenClaw skills ecosystem.

---

**Enjoying this skill? Share it and help others save on AI costs!** 🌑
