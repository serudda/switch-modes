# Switch Modes for OpenClaw

https://github.com/user-attachments/assets/5afbc416-f2e1-42a2-877d-008ee63f9b1c

Switch between AI models instantly to save money. Use cheap models for simple tasks, powerful models for complex ones.

**Save 60-80% on your AI API costs.**

---

## What This Does

You have 4 modes:

- **eco** → cheapest model (summaries, quick questions)
- **balanced** → daily model (general work)
- **smart** → powerful model (complex stuff)
- **max** → most powerful (critical tasks)

Switch by just saying the mode name:

```
eco mode
```

That's it.

---

## Installation

### Easiest Way

Tell your OpenClaw agent:

```
install switch-modes
```

Done. Your agent will install it and help you set it up.

### Alternative: Command Line

```bash
clawdhub install switch-modes
```

### Manual Install

```bash
git clone https://github.com/serudda/switch-modes.git
cp -r switch-modes ~/.openclaw/skills/switch-modes
```

Restart OpenClaw after installing.

---

## Setup

After installing, tell your agent:

```
/modes setup
```

Answer 4 simple questions about which models you want for each mode. That's it.

---

## Usage

Switch modes anytime:

```
eco mode
balanced mode
smart mode
max mode
```

Check what mode you're using:

```
/modes status
```

---

## Example

```
You: eco mode
Agent: ✅ ECO mode activated

You: Summarize this article for me
[uses cheap model]

You: smart mode
Agent: ✅ SMART mode activated

You: Design a system architecture for this
[uses powerful model]
```

You just saved money by using the right model for each task.

---

## Requirements

- OpenClaw installed
- At least 2 different AI models configured

---

## Documentation

Full documentation: [SKILL.md](SKILL.md)

---

## License

MIT - Free to use and modify.

---

## Author

By [Sergio Ruiz](https://uiguideline.com)

Questions? [Open an issue](https://github.com/serudda/switch-modes/issues)
