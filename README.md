# My Personal NvChad Configuration

This repository contains my **personal Neovim setup**, built on top of [NvChad](https://github.com/NvChad/NvChad).

I use NvChad as a foundation and customize it through three main folders: **configs**, **plugins**, and **themes**.  
The goal is a fast, clean, and visually cohesive editor that still respects NvChad’s modern modular design.

---

## 🧩 Structure

```
.
├── lua/
│   ├── configs/    → Custom configuration files for specific plugins and options
│   ├── plugins/    → Plugin declarations and setups
│   └── themes/     → Personalized color schemes and highlight tweaks
└── README.md
```

---

## ⚙️ Setup

1. **Install NvChad (base configuration):**
   ```bash
   git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
   ```

2. **Clone this repository into your Neovim config directory:**
   ```bash
   git clone git@github.com:AlmightyGab/nvchad-config.git ~/.config/nvim/lua/custom
   ```

3. **Launch Neovim:**
   ```bash
   nvim
   ```

NvChad will automatically detect and load your custom configuration.

---

## About

This setup is perpetually changing as I get better at this.  
It stays faithful to NvChad’s philosophy while introducing my personal tastes.

I prefer a **traditional, dark theme** with clear syntax contrast — classic yet modern.

---

### License

This configuration is provided *as-is*, free to use or adapt.
