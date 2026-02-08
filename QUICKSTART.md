# Quick Start - 5 Minutes to Launch

**Goal:** Get Model Modes working in under 5 minutes.

---

## Step 1: Copy Config (30 seconds)

```bash
cp /Users/serudda/Documents/Projects/openclaw-model-modes/example-config.json ~/.openclaw/workspace/model-modes.json
```

---

## Step 2: Test It (1 minute)

In your OpenClaw chat:

```
eco mode
```

You should see: ✅ ECO mode activated

```
/modes status
```

You should see your current mode.

**It works?** Continue to Step 3.  
**Doesn't work?** Ask Sinistra for help.

---

## Step 3: Customize Config (2 minutes)

Edit your config:

```bash
nano ~/.openclaw/workspace/model-modes.json
```

Change models to your preference:

```json
{
  "eco": "your-cheap-model",
  "balanced": "your-normal-model",
  "smart": "your-powerful-model",
  "max": "your-max-model"
}
```

Save and test again.

---

## Step 4: Create GitHub Repo (1 minute)

```bash
cd /Users/serudda/Documents/Projects/openclaw-model-modes

git init
git add .
git commit -m "Initial release v1.0.0"

# Create repo on GitHub first, then:
git remote add origin git@github.com:serudda/openclaw-model-modes.git
git push -u origin main
```

---

## Step 5: Launch (30 seconds)

Post on Twitter/LinkedIn:

> "Just built Model Modes - a free OpenClaw skill for AI cost optimization.
> 
> 4 commands. Instant switching. 60-80% savings.
> 
> [link to repo]
> 
> Try it and share your savings!"

---

## Done! 🎉

**What you just did:**
- ✅ Installed working skill
- ✅ Tested it works
- ✅ Customized to your needs
- ✅ Created public repo
- ✅ Launched on social

**Next:** See TODO.md for content strategy.

---

**Having issues?** Run:
```bash
/Users/serudda/Documents/Projects/openclaw-model-modes/verify-setup.sh
```
