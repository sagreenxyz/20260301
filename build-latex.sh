#!/bin/bash

# Build script for LaTeX documents
# Compiles all LaTeX documents in src/latex subdirectories to public/pdfs

set -e

LATEX_DIR="src/latex"
OUTPUT_DIR="public/pdfs"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Find all main.tex files and compile them
for latex_doc in $(find "$LATEX_DIR" -name "main.tex" | sort); do
  doc_dir=$(dirname "$latex_doc")
  doc_name=$(basename "$doc_dir")
  
  echo "Building: $doc_name"
  
  # Use latexmk to compile with pdflatex (more compatible)
  (
    cd "$doc_dir"
    rm -rf build
    latexmk -pdf -interaction=nonstopmode -output-directory=build main.tex 2>&1 | grep -v "^$" || true
    
    # Copy the PDF to public/pdfs with the document folder name
    if [ -f "build/main.pdf" ]; then
      cp "build/main.pdf" "../../$OUTPUT_DIR/${doc_name}.pdf"
      echo "✓ Created: $OUTPUT_DIR/${doc_name}.pdf"
    else
      echo "✗ Failed to create PDF for: $doc_name"
    fi
  )
done

echo ""
echo "LaTeX build complete!"
