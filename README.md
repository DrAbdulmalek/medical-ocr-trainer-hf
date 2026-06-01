---
title: Medical OCR Trainer — Ensemble
emoji: 🏥
colorFrom: blue
colorTo: green
sdk: docker
app_port: 7860
pinned: false
---

# Medical OCR Trainer — Ensemble

**5 OCR Engines + Smart Merging** — Interactive tool for training and correcting medical handwriting OCR.

## Active Engines (Free Tier)

| Engine | Status | Description |
|--------|--------|-------------|
| 🔷 PaddleOCR | ✅ Active | Arabic + English, best for mixed medical docs |
| 🟢 EasyOCR | ✅ Active | 80+ languages, Latin text |
| 🔵 Tesseract | ✅ Active | Fast, reliable for printed text |
| 🟠 TrOCR | ⬜ Disabled | Needs more RAM (paid space) |
| 🟣 Surya OCR | ⬜ Disabled | Needs more RAM (paid space) |

## How to Use

1. Upload a medical note (JPG/PNG)
2. Select which OCR engines to use (sidebar checkboxes)
3. Choose a merging strategy (majority voting, confidence-weighted, etc.)
4. Review and correct results in the interactive editor
5. Export training data (JSONL)

## Merging Strategies

- **🗳️ Majority Voting** — Text with most engine votes wins
- **⚖️ Confidence Weighted** — Weighted average by confidence
- **📏 Levenshtein Consensus** — Most similar text across all engines
- **🏆 Best Single** — Highest confidence result

## Technical Details

- Persistent storage via `/data/` (survives container restarts)
- CPU-only PyTorch for minimal memory footprint
- Streamlit UI with Arabic RTL support
- SQLite database for corrections and engine logs
