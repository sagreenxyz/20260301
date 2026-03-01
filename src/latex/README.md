# LaTeX Document Generation

This directory contains LaTeX source files for generating professional APA 7 journal articles in PDF format.

## Structure

Each subdirectory represents a separate document:
- `example-article/` - Example APA 7 formatted article

Create new documents by adding new subdirectories with the following structure:
```
src/latex/your-document/
├── main.tex          # Main LaTeX file
├── references.bib    # BibLaTeX bibliography file
└── build/           # Generated build artifacts (not committed)
```

## Building PDFs

### Build all documents once:
```bash
npm run build:latex
```

### Watch mode (auto-rebuild on file changes):
```bash
npm run build:latex:watch
```

### Include LaTeX build in main project build:
```bash
npm run build  # Automatically builds LaTeX first, then Astro
```

## APA 7 Template

The `main.tex` file in each document uses the `apa7` document class with:
- APA 7 formatting (12pt, double-spaced)
- BibLaTeX for bibliography management
- Sections for title, abstract, keywords, main content
- References formatted in APA style

## Generated Files

PDFs are automatically copied to `/public/pdfs/` with the format:
- `{document-folder-name}.pdf`

These files are then viewable through the Astro project's resources page.

## Requirements

- `pdflatex` or `lualatex` (part of TeX Live)
- `latexmk` (for automated compilation)
- `nodemon` (optional, for watch mode)

### Install on Ubuntu/Debian:
```bash
sudo apt-get install texlive-fonts-recommended texlive-latex-base texlive-latex-extra latexmk
npm install --save-dev nodemon
```

## Tips

1. Use `\cite{}` for citations
2. Keep references in the `.bib` file
3. Run `npm run build:latex` before committing to ensure PDFs are generated
4. The output directory (build/) is gitignored to keep the repository clean
5. Only the final PDFs in public/pdfs/ are committed to version control
