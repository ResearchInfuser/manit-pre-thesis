# MANIT Synopsis Template

Quarto-based template for Synopsis submissions at Maulana Azad National Institute of Technology, Bhopal.

## Prerequisites

- [Quarto](https://quarto.org/docs/get-started/) (latest version)
- LaTeX: TeX Live (Windows/Linux) or MacTeX (Mac)

## Quick Start

1. **Edit `_quarto.yml`** with your details (name, scholar number, supervisor, etc.)

2. **Update chapters** in `Chapters/` directory:
   - `01_introduction.qmd` - Introduction and objectives
   - `02_literature_review.qmd` - Literature review
   - `03_methodology.qmd` - Research methodology
   - `04_results_and_discussion.qmd` - Results and analysis
   - `05_conclusions.qmd` - Conclusions and future work
   - `06_publications.qmd` - Publications list
   - `07_references.qmd` - References (auto-generated)

3. **Add references** to `references.bib` in BibTeX format

4. **Build PDF**:
   ```bash
   quarto render --to manit-synopsis-pdf
   ```

Output: `draft/PreThesisSynopsis.pdf`

## Features

- Tutorial-style chapters with formatting examples
- IEEE bibliography style
- Professional algorithm formatting
- Mermaid diagram support
- Cross-references for figures, tables, equations
- MANIT institutional branding

## Structure

```
manit-pre-thesis/
├── _quarto.yml           # Configuration
├── index.qmd             # Entry point
├── references.bib        # Bibliography
├── Chapters/             # Chapter files (7 chapters)
├── images/               # Logo and images
├── _extensions/          # MANIT format extension
└── draft/                # Output directory
```

## VS Code Tasks

Use **Terminal > Run Task** for quick builds:
- Render PDF
- Preview HTML
- Clean build files

## Documentation

Each chapter contains examples and instructions for:
- Text formatting and sections
- Citations and references
- Figures, tables, equations
- Algorithms and code blocks
- Cross-referencing

## License

LPPL v1.3c - Academic use at MANIT Bhopal

## Repository

https://github.com/ResearchInfuser/manit-pre-thesis
