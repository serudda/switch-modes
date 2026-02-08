# AGENTS.md Snippet for Model Modes

**For users:** Copy this section into your `~/.openclaw/workspace/AGENTS.md` to enable conversational installation and full Model Modes functionality.

---

```markdown
## Skill Installation (Conversational)

I can install skills from ClawdHub conversationally - no terminal commands needed.

**Detection patterns:**
- "install [skill-name]"
- "add [skill-name] skill"
- "get [skill-name]"

**Process:**
1. Detect skill name from user message
2. Execute: `clawdhub install [skill-name]`
3. Check output for success/errors
4. Guide user through next steps (setup, usage)
5. Offer to run setup if the skill has one

**Example:**
```
User: "install model-modes"
Me: 
  [exec: clawdhub install model-modes]
  ✅ Model Modes installed!
  
  This skill lets you switch between AI models to save costs.
  
  Run /modes setup to configure, or I can do it now?
```

---

## Model Modes Skill

I have the Model Modes skill installed. I can switch between cost-optimized models dynamically to save API costs.

**Commands I understand:**
- `eco mode` - Switch to cheapest model (simple tasks, summaries, quick questions)
- `balanced mode` - Switch to daily driver model (general work, coding, writing)
- `smart mode` - Switch to powerful model (complex reasoning, architecture, debugging)
- `max mode` - Switch to maximum power (critical decisions, deep analysis)
- `/modes status` - Show current mode and model
- `/modes setup` - Configure model preferences

**How it works:**
1. When I detect a mode command, I read `model-modes.json` from workspace
2. I call `session_status` with the `model` parameter to switch
3. I confirm the switch to the user

**Setup wizard (conversational):**
When user runs `/modes setup`, I guide them through choosing a model for each mode:
1. Ask for ECO mode model (with recommendation)
2. Ask for BALANCED mode model
3. Ask for SMART mode model
4. Ask for MAX mode model
5. Write the config to `model-modes.json` using the `write` tool
6. Confirm completion

**When to suggest mode switching:**
- User asks for something simple → suggest "eco mode" if not already there
- User needs complex reasoning → suggest "smart mode" or "max mode"
- User mentions cost concerns → explain mode benefits

**Detection:** I automatically detect mode keywords in messages and switch accordingly. No need for special syntax - natural language works.

**Config location:** `~/.openclaw/workspace/model-modes.json`
```

---

## Instructions for Users

1. **Open your AGENTS.md:**
   ```bash
   nano ~/.openclaw/workspace/AGENTS.md
   ```

2. **Copy the markdown section above** (everything between the triple backticks)

3. **Paste it into your AGENTS.md** (anywhere, but near the top is recommended)

4. **Save the file**

5. **Restart your OpenClaw session** (or just continue - it should pick it up)

6. **Test it:**
   ```
   User: install model-modes
   ```

Your agent should now be able to install Model Modes conversationally!

---

## Why This Matters

**Without this snippet:** Users need to manually run `clawdhub install model-modes` in terminal

**With this snippet:** Users just say "install model-modes" in chat - zero friction

This makes skill adoption dramatically easier, especially for non-technical users.

---

## Sharing This Skill

When you share Model Modes with others, you can say:

> "Installation is dead simple. Just ask your OpenClaw agent:
> 
> `install model-modes`
> 
> (Make sure you have this snippet in your AGENTS.md: [link to this file])"

Or even better, bundle it into your installation instructions:

> "**Step 1:** Add [this snippet](AGENTS-SNIPPET.md) to your AGENTS.md
> 
> **Step 2:** Ask your agent: `install model-modes`
> 
> Done!"

---

**Questions?** See the main [README](README.md) or [SKILL.md](SKILL.md) for more details.
