---
name: osc-pptx-content-adaptation
description: Instructions for editing existing Quarto `.qmd` files written for RevealJS so that PowerPoint output renders correctly without disrupting the RevealJS presentation
metadata:
  author: Pat Callahan
  version: 0.2.0
---

# OSC PowerPoint Content Adaptation

Your goal is to inspect and adapt an existing Quarto presentation (`.qmd`) written for RevealJS so that its PowerPoint (`.pptx`) output renders correctly using the LMU Open Science Center template, with minimal disruption to the RevealJS presentation.

## Step-by-Step Adaptation Workflow

Execute this workflow systematically on the target `.qmd` file(s). For each slide/section, review the structure and apply the necessary fixes.

### Step 1: Scan and Fix Slide Headings (`#` vs `##`)

- **Issue:** Level 1 headings (`#`) trigger full-screen **Section Header** slides in PowerPoint.
- **Action:** Inspect all headings in the document. Convert any content slide headings from `#` to `##` so they map to standard content layouts. Reserve `#` strictly for major section breaks where a Section Header slide is intended.

### Step 2: Check for Caption Layout Traps

- **Issue:** Placing text followed by an image, figure, or table triggers the **Content with Caption** layout in PowerPoint.
- **Action:** Check the order of elements on content slides. If an image, figure, or table follows text, either:
  - Move the non-text element _above_ the text.
  - Wrap the content in a two-column layout (`::: {.columns}` / `::: {.column}`) to prevent unwanted caption styling.

### Step 3: Handle Multiple Images, Figures, or Tables

- **Issue:** Text followed by multiple images, figures, or tables causes PowerPoint to automatically split them across untitled, fragmented slides.
- **Action:** Refactor slides containing multiple media/table elements into a multi-column layout (`::: {.columns}`) or the **Comparison** layout structure.

### Step 4: Convert or Isolate Tabsets

- **Issue:** Quarto's `.panel-tabset` collapses all tabs into a single stacked slide in PowerPoint.
- **Action:** For any slide utilizing `.panel-tabset`, use conditional content blocks to provide separate slides for PowerPoint:

  ```markdown
  ::: {.content-visible when-format="revealjs"}
  ::: {.panel-tabset}

  ## Tab 1

  Content 1

  ## Tab 2

  Content 2
  :::
  :::

  ::: {.content-visible when-format="pptx"}

  ## Tab 1 (PPTX Slide)

  Content 1

  ## Tab 2 (PPTX Slide)

  Content 2
  :::
  ```

### Step 5: Replace HTML Tables & Check Alignment

- **Issue:** HTML tables may not style correctly, table vertical alignment cannot be modified in the template, and `fig-align` options are ignored.
- **Action:**
  - Ensure tables are written in clean Markdown format.
  - If an HTML table is too complex, provide a PPTX-specific markdown alternative using `::: {.content-visible when-format="pptx"}`.
  - Remove or scope `fig-align` and custom footers (note that footers placed in shared blocks will render as separate standalone slides in PowerPoint).
