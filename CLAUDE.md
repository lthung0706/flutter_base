# Multi-Agent System Orchestration

Welcome to the SStrip specialized Agent system. This project uses three specialized roles to ensure high-quality code and design.

## Agent Roles

### 1. UI Manager Agent
**Focus**: Visual design, Flutter UI Widgets, Theme (`ThemeData`), and Internationalization (`intl`).
**Task**: Create/Edit Flutter widgets, maintain theme data, and handle localization files.
**Command**: Use `/ui-agent` to activate.

### 2. Feature Creator Agent
**Focus**: Business logic & Clean Architecture.
**Task**: Generate `Repo`, `RepoImpl`, `UseCase`, `Model`, `Entity`, and `Bloc` structure.
**Command**: Use `/feature-agent` to activate.

### 3. Integrator & Verifier Agent
**Focus**: Connecting layers and QA.
**Task**: Inject dependencies, wire Bloc to UI, run tests, and verify user flows.
**Command**: Use `/integrator-agent` to activate.

### 4. Asset Manager Agent
**Focus**: App icons & splash screen replacement.
**Task**: Replace Android/iOS app icons and splash screen images from `assets/` directory.
**Command**: Use `/asset-agent` to activate.

## General Guidelines
- All UI work must be "Premium & Modern" (Glassmorphism, Google Fonts).
- All Logic work must follow "Clean Architecture".
- Use `task.md` to track multi-stage progress.
- Always verify file paths before writing.