#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 input.pdf"
    exit 1
fi

INPUT_PDF="$1"
if [ ! -f "$INPUT_PDF" ]; then
    echo "Error: File '$INPUT_PDF' not found"
    exit 1
fi

OUTPUT_PDF="inverted_$INPUT_PDF"
gs \
    -o "$OUTPUT_PDF" \
    -sDEVICE=pdfwrite \
    -c "{1 exch sub} settransfer" \
    -f "$INPUT_PDF"
