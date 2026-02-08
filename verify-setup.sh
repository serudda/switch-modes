#!/bin/bash

# Model Modes - Setup Verification Script
# Run this to verify your installation and configuration

echo "🔍 Model Modes - Setup Verification"
echo "===================================="
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0
WARNINGS=0

# Check 1: Project files exist
echo "📁 Checking project files..."
PROJECT_DIR="/Users/serudda/Documents/Projects/openclaw-model-modes"

if [ -d "$PROJECT_DIR" ]; then
    echo -e "${GREEN}✓${NC} Project directory exists"
    ((PASSED++))
else
    echo -e "${RED}✗${NC} Project directory not found at $PROJECT_DIR"
    ((FAILED++))
fi

# Check 2: Required documentation files
echo ""
echo "📄 Checking documentation files..."
REQUIRED_FILES=(
    "README.md"
    "SKILL.md"
    "IMPLEMENTATION.md"
    "INSTALL.md"
    "package.json"
    "LICENSE"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$PROJECT_DIR/$file" ]; then
        echo -e "${GREEN}✓${NC} $file exists"
        ((PASSED++))
    else
        echo -e "${RED}✗${NC} $file missing"
        ((FAILED++))
    fi
done

# Check 3: OpenClaw workspace
echo ""
echo "🏠 Checking OpenClaw workspace..."
WORKSPACE_DIR="$HOME/.openclaw/workspace"

if [ -d "$WORKSPACE_DIR" ]; then
    echo -e "${GREEN}✓${NC} OpenClaw workspace exists"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} OpenClaw workspace not found - is OpenClaw installed?"
    ((WARNINGS++))
fi

# Check 4: AGENTS.md integration
echo ""
echo "🤖 Checking AGENTS.md integration..."
AGENTS_FILE="$WORKSPACE_DIR/AGENTS.md"

if [ -f "$AGENTS_FILE" ]; then
    if grep -q "Model Modes" "$AGENTS_FILE"; then
        echo -e "${GREEN}✓${NC} Model Modes section found in AGENTS.md"
        ((PASSED++))
    else
        echo -e "${YELLOW}⚠${NC} Model Modes section not found in AGENTS.md"
        ((WARNINGS++))
    fi
else
    echo -e "${YELLOW}⚠${NC} AGENTS.md not found"
    ((WARNINGS++))
fi

# Check 5: Config file
echo ""
echo "⚙️  Checking configuration..."
CONFIG_FILE="$WORKSPACE_DIR/model-modes.json"

if [ -f "$CONFIG_FILE" ]; then
    echo -e "${GREEN}✓${NC} Config file exists at $CONFIG_FILE"
    
    # Validate JSON
    if jq empty "$CONFIG_FILE" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} Config file is valid JSON"
        ((PASSED++))
        
        # Check required keys
        REQUIRED_KEYS=("eco" "balanced" "smart" "max")
        for key in "${REQUIRED_KEYS[@]}"; do
            if jq -e ".$key" "$CONFIG_FILE" &>/dev/null; then
                echo -e "${GREEN}✓${NC} Config has '$key' mode"
                ((PASSED++))
            else
                echo -e "${RED}✗${NC} Config missing '$key' mode"
                ((FAILED++))
            fi
        done
    else
        echo -e "${RED}✗${NC} Config file is not valid JSON"
        ((FAILED++))
    fi
else
    echo -e "${YELLOW}⚠${NC} Config file not found - run setup or copy example-config.json"
    echo -e "    ${YELLOW}Run:${NC} cp $PROJECT_DIR/example-config.json $CONFIG_FILE"
    ((WARNINGS++))
fi

# Check 6: Git repository
echo ""
echo "🌿 Checking Git repository..."

if [ -d "$PROJECT_DIR/.git" ]; then
    echo -e "${GREEN}✓${NC} Git repository initialized"
    ((PASSED++))
    
    # Check for remote
    cd "$PROJECT_DIR"
    if git remote -v | grep -q "origin"; then
        echo -e "${GREEN}✓${NC} Git remote configured"
        ((PASSED++))
    else
        echo -e "${YELLOW}⚠${NC} No Git remote configured"
        echo -e "    ${YELLOW}Tip:${NC} Add remote: git remote add origin git@github.com:serudda/openclaw-model-modes.git"
        ((WARNINGS++))
    fi
else
    echo -e "${YELLOW}⚠${NC} Git not initialized - ready for GitHub"
    echo -e "    ${YELLOW}Run:${NC} cd $PROJECT_DIR && git init"
    ((WARNINGS++))
fi

# Summary
echo ""
echo "===================================="
echo "📊 Summary"
echo "===================================="
echo -e "${GREEN}Passed:${NC} $PASSED"
echo -e "${RED}Failed:${NC} $FAILED"
echo -e "${YELLOW}Warnings:${NC} $WARNINGS"
echo ""

if [ $FAILED -eq 0 ]; then
    if [ $WARNINGS -eq 0 ]; then
        echo -e "${GREEN}✅ Everything looks good! Ready to launch.${NC}"
        echo ""
        echo "Next steps:"
        echo "1. Test mode switching in OpenClaw"
        echo "2. Create GitHub repository"
        echo "3. Submit to ClawdHub"
    else
        echo -e "${YELLOW}⚠️  Setup mostly complete, but check warnings above.${NC}"
        echo ""
        echo "Most common fix:"
        echo "  cp $PROJECT_DIR/example-config.json $CONFIG_FILE"
    fi
else
    echo -e "${RED}❌ Setup incomplete. Fix the failed checks above.${NC}"
fi

echo ""
echo "For full documentation, see:"
echo "  $PROJECT_DIR/PROJECT-SUMMARY.md"
echo ""
