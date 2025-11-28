# MANIT Pre-Thesis Synopsis Template

A Quarto extension template for formatting Pre-Thesis Synopsis submissions according to MANIT (Maulana Azad National Institute of Technology) guidelines.

## Preview

📄 **[View Sample PDF](draft/PreThesisSynopsis.pdf)** - See the generated output with tutorial content

![Pre Thesis Synopsis](manit-pre-thesis.jpg)

## Features

- MANIT-compliant synopsis formatting
- Tutorial-style chapters with formatting examples
- IEEE bibliography style
- Professional algorithm formatting with pseudocode support
- Mermaid diagram support
- Cross-references for figures, tables, equations
- MANIT institutional branding
- Support for multiple output formats (PDF, HTML, DOCX)

## Prerequisites

Before using this template, ensure you have the following installed:

1. **Quarto** (>= 1.3): Download from [https://quarto.org/docs/get-started/](https://quarto.org/docs/get-started/)
2. **LaTeX Distribution**:
   - Windows: MiKTeX or TeX Live
   - Mac: MacTeX
   - Linux: TeX Live
3. **R or Python** (optional, if using code chunks)

## Installation

### Method 1: Using Git Clone

```bash
git clone https://github.com/ResearchInfuser/manit-pre-thesis.git
cd manit-pre-thesis
```

### Method 2: Download ZIP

Download the repository as a ZIP file and extract it to your desired location.

## Project Structure

```
manit-pre-thesis/
├── _quarto.yml                    # Main configuration file
├── index.qmd                      # Entry point
├── references.bib                 # Bibliography file
├── Chapters/                      # Chapter files
│   ├── 01_introduction.qmd       # Introduction and objectives
│   ├── 02_literature_review.qmd  # Literature review
│   ├── 03_methodology.qmd        # Research methodology
│   ├── 04_results_and_discussion.qmd  # Results and analysis
│   ├── 05_conclusions.qmd        # Conclusions and future work
│   ├── 06_publications.qmd       # Publications list
│   ├── 07_references.qmd         # References (auto-generated)
│   └── 03_methodology_files/     # Supporting files for chapters
├── images/                        # Logo and images
├── figures/                       # Place your figures here
├── _extensions/                   # MANIT format extension (DO NOT MODIFY)
└── draft/                         # Output directory (generated)
```

## Quick Start

### 1. Configure Your Synopsis

Edit `_quarto.yml` to add your personal information:

```yaml
book:
  title: "[Your Synopsis Title]"
  author:
    name: "[Your Name]"

synopsis:
  scholar-number: '[Your Scholar Number]'
  department: "[Your Department]"
  institute: "[Your Institute]"
  keywords: "[Keywords separated by commas]"
  
  supervisor:
    name: "[Supervisor Name]"
    designation: "[Designation]"
```

### 2. Write Your Chapters

Edit the chapter files in `Chapters/`:

- `01_introduction.qmd` - Research introduction and objectives
- `02_literature_review.qmd` - Literature review
- `03_methodology.qmd` - Research methodology
- `04_results_and_discussion.qmd` - Results and analysis
- `05_conclusions.qmd` - Conclusions and future work
- `06_publications.qmd` - Publications list
- `07_references.qmd` - References (auto-generated from bibliography)

Each file uses Quarto markdown syntax and contains examples for formatting.

### 3. Add References

Add your references to `references.bib` in BibTeX format:

```bibtex
@article{author2023title,
  title={Title of the Article},
  author={Author, First and Author, Second},
  journal={Journal Name},
  year={2023}
}
```

### 4. Build Your Synopsis

#### Generate PDF (Synopsis Format)

```bash
quarto render --to manit-synopsis-pdf
```

Output: `draft/PreThesisSynopsis.pdf`

#### Generate PDF (General)

```bash
quarto render
```

#### Generate HTML (for preview)

```bash
quarto render --to html
```

#### Generate DOCX

```bash
quarto render --to docx
```

### 5. Preview While Writing

Use Quarto's preview mode for live updates:

```bash
quarto preview
```

## Customization

### Adding Figures

Place figures in the `figures/` directory and reference them in your chapters:

```markdown
![Caption for your figure](../figures/your-figure.png){#fig-label}

As shown in @fig-label, we can see...
```

### Adding Tables

Create tables using markdown or Quarto syntax:

```markdown
| Header 1 | Header 2 |
|----------|----------|
| Cell 1   | Cell 2   |

: Caption for your table {#tbl-label}
```

### Cross-References

- Sections: `@sec-label`
- Figures: `@fig-label`
- Tables: `@tbl-label`
- Equations: `@eq-label`

### Citations

Cite references using `@citekey`:

```markdown
According to @author2023title, the method works well.
Multiple citations [@author2023title; @another2022paper].
```

### Pseudocode and Algorithms

The template includes support for pseudocode formatting:

````markdown
```{pseudocode}
\ALGORITHM{Algorithm Name}
  \INPUT{Input parameters}
  \OUTPUT{Output results}
  \BEGIN
    \STATE initialize variables
    \FOR{each item}
      \STATE process item
    \ENDFOR
  \END
\ENDALGORITHM
```
````

### Math Equations

Use LaTeX math syntax:

```markdown
Inline equation: $E = mc^2$

Display equation:
$$
\frac{\partial f}{\partial x} = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}
$$ {#eq-derivative}
```

### Diagrams

Support for Mermaid diagrams:

````markdown
```{mermaid}
graph TD
  A[Start] --> B[Process]
  B --> C[End]
```
````

## VS Code Tasks

Use **Terminal > Run Task** for quick builds:

- **Quarto Render** - Render to default format
- **Quarto Render HTML** - Generate HTML output
- **Quarto Render DOCX** - Generate Word document
- **Render Synopsis PDF** - Generate synopsis PDF format
- **Quarto Preview** - Live preview while editing
- **Open PDF Output** - Open the generated PDF
- **Clean Build Files** - Remove draft directory

## Troubleshooting

### Common Issues

1. **PDF generation fails**
   - Ensure LaTeX is properly installed
   - Check that all required packages are installed
   - Run `quarto check` to verify installation

2. **Bibliography not showing**
   - Verify `references.bib` syntax
   - Ensure citations are used in the text
   - Check BibTeX backend is installed

3. **Figures not appearing**
   - Check file paths are correct (relative to chapter files)
   - Ensure images exist in the specified location
   - Verify image formats are supported (PNG, PDF, JPG)

4. **Cross-references not working**
   - Ensure labels are unique and follow the format `{#label-name}`
   - Check reference syntax uses `@label-name`
   - Rebuild the entire project

### Getting Help

- Quarto Documentation: [https://quarto.org/docs/](https://quarto.org/docs/)
- MANIT Guidelines: Check with your department
- Issues: Open an issue on GitHub

## Documentation

Each chapter contains examples and instructions for:
- Text formatting and sections
- Citations and references
- Figures, tables, equations
- Algorithms and code blocks
- Cross-referencing

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. If you have suggestions for improvements or find any issues, please open an issue on GitHub.

## Acknowledgments

This template is designed for Pre-Thesis Synopsis students at MANIT, Bhopal. It follows the official synopsis formatting guidelines and incorporates best practices for academic document preparation.

## Citation

If you use this template, please cite it as:

```bibtex
@software{manit_pre_thesis_template,
  title={MANIT Pre-Thesis Synopsis Quarto Template},
  author={Prashant Kumar Nag},
  year={2024},
  url={https://github.com/ResearchInfuser/manit-pre-thesis}
}
```

## License

This template is released under the MIT License. See [LICENSE](LICENSE) for details.

## Repository

https://github.com/ResearchInfuser/manit-pre-thesis

---

**Good luck with your synopsis!**
