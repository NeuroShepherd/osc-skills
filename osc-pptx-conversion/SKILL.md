---
name: osc-pptx-conversion
description: Instructions for adjusting existing Quarto documents written for RevealJS so that the LMU Open Science Center PowerPoint output is acceptable, with minimal changes to the source
metadata:
  author: Pat Callahan
  version: 0.0.3
---

# OSC PowerPoint Conversion

Your goal is to take an existing Quarto document that was written primarily as RevealJS slides and make the smallest possible changes so that the PowerPoint output is acceptable. Where RevealJS and PowerPoint can both be satisfied by the same markup, prefer that; only add PowerPoint-specific content as a last resort.

## Project setup

1. Add the files in the [`assets`](assets/) directory to the project if they are not already present. This includes the [CSL](assets/assets/apa.csl), [bibliography](assets/assets/references.bib), [logos](assets/assets/logos/), [stylesheet](assets/assets/slides-custom.css), [workflows](assets/.github/workflows), and supporting config files ([`.gitignore`](assets/.gitignore), [`.filenameignore`](assets/.filenameignore), [CITATION.cff](assets/CITATION.cff), and the `LICENSE` files).

1. Fix file references that use the old relative path to `../../assets`. That path no longer resolves; reference assets through the project's own `assets` directory instead. Prefer not to use this kind of referencing at all.

1. Install the `osc-brand` Quarto extension with `quarto add lmu-osc/osc-brand` if it is not already present. It contributes two formats, `osc-brand-html` and `osc-brand-pptx`. The `osc-brand-pptx` format ships our custom PowerPoint template and wires it up through `reference-doc`, so the PowerPoint output picks up the OSC branding on its own. Do not point `reference-doc` at some other template, and do not edit the extension's template in place. Any fix for how a slide renders belongs in the `.qmd`, not in the `.pptx`.

1. Put the CSL and bibliography files in the project's `assets` directory and make sure they are referenced correctly from the `.qmd` file (`csl:` and `bibliography:` in the YAML).

1. Make sure the first `format` entry is `osc-brand-html` (which requires the `osc-brand` extension), and add `toc: true` as an entry for just this format.

1. To each format, add the `output-file` YAML argument, naming the file `repoName-outputName.outputExt`. For example, for a repo named `hello-there` the RevealJS output is `hello-there-revealjs.html` and the PowerPoint output is `hello-there-pptx.pptx`. For formats that come from an extension (`osc-brand`), do not include the `osc-brand` text anywhere in the name; that would be redundant and too long.

1. Add the following Quarto extensions:
   - `mcanouil/quarto-revealjs-tabset`
   - `nicebread/quarto-timer`

## PowerPoint layout adjustments

The layouts available to you are the ones defined in the template bundled with `osc-brand`. These are the standard set — among them `Title and Content`, `Two Content`, `Comparison`, `Content with Caption`, and `Blank` — and Quarto picks between them from the _structure_ of a slide rather than from any styling. Restructuring a slide, not restyling it, is therefore how you change which layout it lands on.

1. Replace HTML tables with markdown tables, aiming to preserve the style as closely as possible. If this cannot be done reliably, create a separate PowerPoint-only table as a last resort. Table output itself looks fine; the one limitation is that a table's default vertical alignment cannot be adjusted in the template `.pptx`, so do not attempt to.

1. Avoid triggering the "Content with Caption" layout. It is selected whenever text is followed by a non-text element — namely an image, figure, or table. Order matters: an image, figure, or table followed by text does _not_ trigger this layout, so prefer putting these elements first. The better option is usually to use a column layout instead.

1. Watch for slides with text followed by multiple image, figure, or table elements. PowerPoint splits these across multiple slides, so a column layout is even more important here to keep everything on a single slide. Triggering the `Comparison` layout is another good option in this case.

1. If a `.panel-tabset` is used, make it so the PowerPoint output splits each panel into its own slide.

1. Ignore custom footers in the PowerPoint output, as they do not render properly. Remove them or scope them so they apply only to the non-PowerPoint formats.

1. Render to PowerPoint to confirm the output is acceptable before finishing.
