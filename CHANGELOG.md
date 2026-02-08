# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-02-08

### Added
- Initial release
- 4 customizable modes: eco, balanced, smart, max
- Simple mode switching via natural language commands
- `/modes setup` command for configuration
- `/modes status` command to check current mode
- JSON-based configuration file
- Support for all OpenClaw-compatible model providers
- Comprehensive documentation (SKILL.md, README.md, IMPLEMENTATION.md)
- Example configurations for Anthropic and OpenAI models

### Features
- Instant model switching without gateway restart
- Cost optimization by using appropriate models for tasks
- Privacy-focused local configuration
- Model-agnostic design (works with any provider)

---

## [Unreleased]

Future considerations:
- Auto-detection of task complexity
- Cost tracking per session
- Mode presets for workflows
- Context-aware switching suggestions
