---
name: osc-pptx-content-adaptation
description: Instructions for editing existing Quarto `.qmd` files written for RevealJS so that PowerPoint output renders correctly without disrupting the RevealJS presentation
metadata:
  author: Pat Callahan
  version: 0.1.0
---

# OSC PowerPoint Content Adaptation

Your goal is to take an existing Quarto document written primarily as RevealJS slides and make the smallest possible changes to the `.qmd` markup so that the PowerPoint (`.pptx`) output is acceptable, without disrupting the RevealJS experience. Where RevealJS and PowerPoint can both be satisfied by the same markup, prefer that; only add PowerPoint-specific content as a last resort.

## Understanding PowerPoint Limitations & Behavior

The layouts available to PowerPoint are the ones defined in the template bundled with `osc-brand` (e.g., `Title and Content`, `Two Content`, `Comparison`, `Content with Caption`, and `Blank`). Quarto picks between them from the _structure_ of a slide rather than from styling. Restructuring a slide, not restyling it, is therefore how you change which layout it lands on.

- **`brand.yml` & Custom CSS/Sass:** Quarto's support for `brand.yml` and custom stylesheets does not extend to PowerPoint output. Do not rely on custom CSS rules or brand variables for PPTX formatting.
- **Footers:** PowerPoint does not ignore footers; instead, footer content is incorrectly placed onto a new, separate slide. Avoid using `footer` in shared blocks or scope it appropriately.
- **Alignment:** Formatting options like `fig-align` are ignored in PPTX.
- **Vertical Alignment in Tables:** A table's default vertical alignment cannot be adjusted in the template `.pptx`.

## Structural Rules & Layout Adjustments

1. **Headings:** `#` level headings trigger "Section Header" slides in PowerPoint. Ensure content slides use appropriate heading levels (`##`) or bullet lists.

2. **Tables:** Replace HTML tables with markdown tables, aiming to preserve the style as closely as possible. If this cannot be done reliably, create a separate PowerPoint-only table using conditional blocks.

3. **Caption Layout Trap:** Avoid triggering the "Content with Caption" layout. It is selected whenever text is followed by a non-text element — namely an image, figure, or table. Order matters: an image, figure, or table followed by text does _not_ trigger this layout, so prefer putting these elements first. The better option is usually to use a column layout instead.

4. **Multiple Images / Figures:** Watch for slides with text followed by multiple image, figure, or table elements. PowerPoint splits these into untitled, split-off slides. Use a column layout or the `Comparison` layout to keep everything structured properly.

5. **Tabsets:** `.panel-tabset` collapses all panels into a single stacked slide in PowerPoint. Use conditional blocks to split tabsets into separate slides or provide alternative layouts for PPTX.

6. **Conditional Content (`.content-visible`):** Use `::: {.content-visible when-format="pptx"}` (and corresponding `when-format="revealjs"` or negative selectors) as the standard pattern to handle content that needs to split or diverge between formats, such as breaking tabsets into separate slides or providing PPTX-only table alternatives.

7. **Final Verification:** Render to PowerPoint to confirm the output is acceptable before finishing.
