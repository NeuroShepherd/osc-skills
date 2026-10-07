---
name: osc-pptx-project-setup
description: Instructions for setting up project configuration, assets, extensions, and output formats for LMU Open Science Center slide repositories supporting both RevealJS and PowerPoint
metadata:
  author: Pat Callahan
  version: 0.1.1
---

# OSC PowerPoint & Slide Project Setup

Your goal is to configure a Quarto slide repository so that it correctly builds both RevealJS HTML output and PowerPoint (`.pptx`) output using the LMU Open Science Center branding and extensions.

## Project Setup Steps

1. **Assets & Configuration Files:** Add the standard supporting assets and configuration files to the project if not already present:
   - **Logos & Styling:** `assets/logos/` (logos and favicons), `assets/slides-custom.css` (custom CSS for RevealJS).
   - **Bibliography & CSL:** `assets/references.bib` and `assets/apa.csl` (referenced correctly in the `.qmd` via `csl:` and `bibliography:`).
   - **GitHub Workflows:** Standard `.github/workflows/` for CI/CD and testing.
   - **Metadata & Licenses:** `CITATION.cff`, `LICENSE.md`, and `LICENSE-CODE.md`.
   - **Ignore & Config Files:** `.gitignore` and `.filenameignore`.

1. **Asset File References:** Fix file references that use old relative paths (like `../../assets`). That path no longer resolves; reference assets through the project's own `assets` directory instead. Prefer not to use relative path traversal at all.

1. **Branding Extension:** Install the `osc-brand` Quarto extension with `quarto add lmu-osc/osc-brand` if it is not already present. It contributes two formats, `osc-brand-html` and `osc-brand-pptx`. The `osc-brand-pptx` format ships our custom PowerPoint template and wires it up through `reference-doc`, so the PowerPoint output picks up the OSC branding on its own.
   - Do not point `reference-doc` at some other template, and do not edit the extension's template in place. Any fix for how a slide renders belongs in the `.qmd`, not in the `.pptx`.
   - **Note on Limitations:** `brand.yml` and custom Sass/CSS files (like `slides-custom.css`) do not apply to PowerPoint output; Quarto branding features are currently limited to HTML, dashboard, revealjs, and typst formats. All visual styling for PPTX must originate from the template bundled within the `osc-brand` extension.

1. **Bibliography & CSL:** Put the CSL and bibliography files in the project's `assets` directory and make sure they are referenced correctly from the `.qmd` file (`csl:` and `bibliography:` in the YAML header).

1. **Format Order & TOC:** Make sure the first `format` entry in the YAML is `osc-brand-html` (which requires the `osc-brand` extension), and add `toc: true` as an entry for just this format.

1. **Output Filenames:** To each format, add the `output-file` YAML argument, naming the file `repoName-outputName.outputExt`. For example, for a repo named `hello-there` the RevealJS output is `hello-there-revealjs.html` and the PowerPoint output is `hello-there-pptx.pptx`. For formats that come from an extension (`osc-brand`), do not include the `osc-brand` text anywhere in the name; that would be redundant and too long.

1. **Required Extensions:** Add the following Quarto extensions:
   - `mcanouil/quarto-revealjs-tabset`
   - `nicebread/quarto-timer`

1. **Format-Specific Filters:** If a `filter` called `timer` is present, place it in the RevealJS format only. The PowerPoint output does not support it, and it will throw an error if it is present.
