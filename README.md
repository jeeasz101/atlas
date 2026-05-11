# Atlas — Local AI Assistant

> Your private AI assistant running 100% locally on your computer. Powered by Gemma 4 via Ollama. No cloud, no fees, no tracking.

---

## 📋 Hardware Requirements

| Component | Minimum |
|-----------|---------|
| GPU | NVIDIA GTX 1050 Ti (4 GB VRAM) |
| RAM | 8 GB (16 GB recommended) |
| Disk | 20 GB free space |
| OS | Windows 10/11 |

## 🚀 Installation

### Step 1 — Install Ollama
Go to [https://ollama.com/download](https://ollama.com/download), download the Windows installer (.exe) and run it.

### Step 2 — Download AI models (open CMD)
```
ollama pull gemma4:e4b
ollama pull gemma4:e2b
```

### Step 3 — Install Node.js
Download LTS from [nodejs.org](https://nodejs.org), install.

### Step 4 — Run Atlas
1. Extract ZIP to a folder
2. Double-click `install.bat` — installs dependencies
3. Double-click `start.bat` — starts backend + frontend
4. Browser opens at `http://localhost:3000`

---

## ✨ Features
- 💬 **Chat** with model selection (Gemma4:E4B / E2B)
- 🖼️ **Image analysis** — attach images in chat
- 🎨 **Artifacts** — live HTML/CSS/JS preview panel
- ⚡ **Skills** — YAML-based modular AI templates with auto-selection
- 🤖 **50 AI Agents** — specialized agents across 5 categories
- 🖥️ **Cowork Agent** — autonomous AI execution agent with planning loop
- 🔄 **Workflow** — visual node-based automation builder
- 🧠 **AI Constitution** — 60-section behavioral system prompt
- 📁 **Projects** — organize conversations
- ⚙️ **Settings** — model selection, customization

## 📜 License
MIT — free to use, modify, and share.

---

Powered by [Ollama](https://ollama.com) + [Gemma 4](https://ollama.com/library/gemma4)
