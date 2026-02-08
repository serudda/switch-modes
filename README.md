# 🎛️ Model Modes for OpenClaw

**Save 60-80% on AI costs by dynamically switching between models based on task complexity.**

---

## Why This Exists

You don't need GPT-4 to answer "What's the weather?" and you don't want Claude Haiku designing your architecture.

This skill lets you define 4 modes (eco/balanced/smart/max) and switch between them instantly with simple commands.

---

## Installation (Choose One)

### 🎤 Conversational (Easiest)

Just ask your OpenClaw agent:

```
install model-modes
```

That's it! Your agent will install it and guide you through setup.

---

### 💻 Command Line

```bash
clawdhub install model-modes
```

---

### 🔧 Manual (GitHub)

```bash
git clone https://github.com/serudda/openclaw-model-modes.git
cp -r openclaw-model-modes ~/.openclaw/skills/model-modes
```

See [INSTALL.md](./INSTALL.md) for detailed manual installation.

---

## Quick Start

### Setup (Conversational)
```
/modes setup
```

Your agent will ask you 4 questions to configure your modes. All conversational - no file editing needed.

### Use
```
eco mode          # Switch to cheapest model
balanced mode     # Switch to daily driver
smart mode        # Switch to powerful model
max mode          # Switch to maximum power
```

---

## Example Workflow

```
User: eco mode

User: Summarize this article for me
[AI responds using cheap model - perfect for summaries]

User: smart mode

User: Now design a scalable architecture for this system
[AI responds using powerful model - needed for complex reasoning]
```

**Result:** You paid cheap model prices for the summary, premium model prices only for architecture design.

---

## Features

✅ **4 customizable modes** - Define any model for eco/balanced/smart/max  
✅ **Instant switching** - No restart needed  
✅ **Conversational setup** - No file editing, all done through chat  
✅ **Cost tracking** - See current mode anytime with `/modes status`  
✅ **Model agnostic** - Works with Anthropic, OpenAI, or any provider OpenClaw supports  
✅ **Privacy focused** - All config stored locally  

---

## Use Cases

💰 **Optimize costs** - Use cheap models for simple tasks  
🎯 **Task-based switching** - Right model for the job  
🧪 **Model testing** - Compare outputs quickly  
📊 **Budget control** - Stay within API limits  

---

## Documentation

Full docs: [SKILL.md](./SKILL.md)

---

## Requirements

- OpenClaw installed
- At least 2 different models configured (e.g., Claude Sonnet + Haiku)

---

## Author

Created by **Sergio Ruiz (Serudda)**  
Design Systems expert | Content creator | Building in public

- 🌐 [UIGuideline.com](https://uiguideline.com)
- 🐦 [@serudda](https://twitter.com/serudda)
- 💼 [LinkedIn](https://linkedin.com/in/serudda)

---

## License

MIT - Free to use, modify, and share.

---

**Star ⭐ this repo if you find it useful!**
