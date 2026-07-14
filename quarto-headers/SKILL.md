---
name: quarto-headers
description: Instructions to check the headers in Quarto documents
metadata:
  author: Pat Callahan
  version: 0.0.1
---

Your objective is to check Quarto documents (`*.qmd`) for proper use of cascading headers. You will check all Quarto files by default, or the file(s) specified by the user.

1. Reserve level 1 (`<h1> level one <\h1>`, `# level one`) for document-level titles. In most documents, the main document title should be defined in the YAML block with the `title:` key. In these cases, body headers should being with level 2 headers.

- Inform user on missing `title:` YAML fields.

2. Maintain a strict hierarchy in the headers. Do not skip levels as this breaks accessibility structures and tables of contents.
3. Always include a space after the trailing `#`.
