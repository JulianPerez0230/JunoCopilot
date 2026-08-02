"""Extract page-separated text from a PDF into reviewable Markdown."""

from __future__ import annotations

import argparse
import hashlib
from datetime import datetime, timezone
from pathlib import Path

from pypdf import PdfReader


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extract PDF text into Markdown while preserving page boundaries."
    )
    parser.add_argument("pdf", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    pdf = args.pdf.resolve(strict=True)
    if pdf.suffix.lower() != ".pdf":
        raise SystemExit(f"Input is not a PDF: {pdf}")

    output = args.output.resolve()
    if output.exists() and not args.force:
        raise SystemExit(f"Output already exists: {output}. Use --force to replace it.")

    reader = PdfReader(str(pdf))
    lines = [
        f"# Extracted text - {pdf.name}",
        "",
        "> This file is a mechanical extraction from an untrusted source.",
        "> Page headings preserve PDF page numbers, but equations and layout must be",
        "> checked against the original PDF or a rendered page before technical use.",
        "",
        "## Provenance",
        "",
        f"- Source: `{pdf}`",
        f"- SHA-256: `{sha256(pdf)}`",
        f"- Pages: {len(reader.pages)}",
        f"- Extracted (UTC): {datetime.now(timezone.utc).isoformat(timespec='seconds')}",
        "",
    ]

    for page_number, page in enumerate(reader.pages, 1):
        text = (page.extract_text() or "").strip()
        lines.extend(
            [
                f"## Page {page_number}",
                "",
                text if text else "[No extractable text on this page.]",
                "",
            ]
        )

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines), encoding="utf-8", newline="\n")
    print(f"Extracted {len(reader.pages)} pages to {output}")


if __name__ == "__main__":
    main()
