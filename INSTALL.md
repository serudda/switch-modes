# Installation Guide

## Quick Install (Recommended)

### Via ClawdHub
```bash
clawdhub install model-modes
```

That's it! The skill is now available in your OpenClaw instance.

---

## Manual Install

### Step 1: Clone or Download

**Option A: Git Clone**
```bash
cd ~/.openclaw/skills/
git clone https://github.com/serudda/openclaw-model-modes.git model-modes
```

**Option B: Download ZIP**
1. Download from GitHub: [Releases](https://github.com/serudda/openclaw-model-modes/releases)
2. Extract to `~/.openclaw/skills/model-modes/`

### Step 2: Verify Installation

Check that the skill folder exists:
```bash
ls ~/.openclaw/skills/model-modes/
```

You should see:
- SKILL.md
- README.md
- example-config.json
- (other files)

---

## Initial Configuration

### Step 1: Run Setup

In your OpenClaw chat, type:
```
/modes setup
```

### Step 2: Configure Each Mode

You'll be prompted to choose a model for each mode:

**🟢 ECO Mode**  
For simple tasks (summaries, quick questions, casual chat)  
**Recommended:** `anthropic/claude-3.5-haiku`

**🔵 BALANCED Mode**  
For daily work (coding, writing, problem solving)  
**Recommended:** `anthropic/claude-sonnet-4-5`

**🟠 SMART Mode**  
For complex reasoning (architecture, debugging, analysis)  
**Recommended:** `anthropic/claude-opus-4-5`

**🔴 MAX Mode**  
For maximum power (critical decisions, deep reasoning)  
**Recommended:** `anthropic/claude-opus-4-6`

### Step 3: Confirm

After setup, your config is saved to:
```
~/.openclaw/workspace/model-modes.json
```

---

## Quick Start

Try switching modes:
```
eco mode
```

Check current mode:
```
/modes status
```

---

## Alternative: Manual Configuration

If you prefer not to use the setup wizard:

1. Copy the example config:
```bash
cp ~/.openclaw/skills/model-modes/example-config.json ~/.openclaw/workspace/model-modes.json
```

2. Edit the file:
```bash
nano ~/.openclaw/workspace/model-modes.json
```

3. Set your preferred models:
```json
{
  "eco": "your-eco-model",
  "balanced": "your-balanced-model",
  "smart": "your-smart-model",
  "max": "your-max-model"
}
```

4. Save and test:
```
/modes status
```

---

## Verify Installation

Test each mode:
```
eco mode
[ask a simple question]

balanced mode
[ask a normal question]

smart mode
[ask a complex question]

max mode
[ask something that needs deep reasoning]
```

You should see confirmation messages when switching modes.

---

## Troubleshooting

### "Model not found" error
- Check your model IDs are correct
- Verify API keys are configured in OpenClaw
- Some models require specific API plans

### "/modes setup" doesn't work
- Make sure the skill is in `~/.openclaw/skills/model-modes/`
- Restart OpenClaw gateway if needed
- Check AGENTS.md includes Model Modes section

### Config file not created
- Manually create: `touch ~/.openclaw/workspace/model-modes.json`
- Use the example config as a template
- Check file permissions

### Mode switching doesn't seem to work
- Run `/modes status` to verify current mode
- Check that the model IDs in your config are valid
- Try switching to a different mode and back

---

## Uninstall

To remove Model Modes:

1. Delete the skill folder:
```bash
rm -rf ~/.openclaw/skills/model-modes/
```

2. (Optional) Remove config:
```bash
rm ~/.openclaw/workspace/model-modes.json
```

3. (Optional) Remove from AGENTS.md:
Edit `~/.openclaw/workspace/AGENTS.md` and delete the Model Modes section.

---

## Support

- **Documentation:** [SKILL.md](./SKILL.md)
- **Issues:** [GitHub Issues](https://github.com/serudda/openclaw-model-modes/issues)
- **Community:** OpenClaw Discord

---

**Next:** Read the [SKILL.md](./SKILL.md) for full documentation and use cases.
