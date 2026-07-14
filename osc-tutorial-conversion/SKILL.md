---
name: osc-tutorial-conversion
description: Instructions for converting existing OSC tutorials to match our `tutorial-template` repo
metadata:
  author: Pat Callahan
  version: 0.0.4
---

# OSC Tutorial Conversion

Your goal is to convert existing OSC tutorials to match the structure and style of our `tutorial-template` repo. This will ensure consistency across all tutorials and make it easier for users to follow along.

1. Install the Quarto extension `lmu-osc/tutorial-template` if it is not already present in `_extensions`.

1. Use the available [`.github` workflows](assets/.github/workflows) for CI/CD and testing, replacing existing workflows in the tutorials with these standardized ones as needed. Do not remove non-related workflows.

1. Apply kebab case to all file names and directories. For example, `someFolder/My_Tutorial.md` should be renamed to `some-folder/my-tutorial.md`. Files in the `assets` directory should also follow this convention. LICENSE, README, and CITATION files should not be renamed.

1. For renamed Quarto and Markdown files, use the `aliases:` YAML field to allow redirects from the old path to the new one. Extending the previous example, you would use: `aliases: someFolder/My_Tutorial.md`.

1. Update the references to all files and folders in the tutorials to reflect the new kebab case naming convention. This includes links, images, and any other references.

1. The `tutorial-template` Quarto extension now handles theming and branding (replacing the old `lmu-osc-custom.scss` and `styles.css`). Update the tutorial's `_quarto.yml` to use `type: tutorial-template` as the project type — see step 8 for the full template. Remove any references to the old standalone stylesheets. If the tutorial has custom styling that needs preserving, add it via the `format.tutorial-template-html+tutorial.css` section in `_quarto.yml`.

1. Add the [footer folder](assets/footer/) to the tutorial.

1. Add the [assets](assets/assets/) folder to the tutorial, or just the contents within it if the folder already exists. This will ensure that all necessary assets are included in the tutorial.

1. Follow the conventions in [`_quarto.yml`](assets/_quarto.yml) for the tutorial's configuration. The template uses the `tutorial-template` project type (a Quarto extension) and includes:
   - Website metadata: title, repo URL, page footer with copyright
   - Navbar with Home and About links, plus GitHub and OSC icon tools
   - Docked sidebar with Overview and topic sections
   - Matomo analytics via `include-in-header`
   - Footer via `include-after-body`
   - A format override section for custom CSS if needed

1. Add supporting configuration files from the assets folder:
   - [`matomo-analytics.html`](assets/matomo-analytics.html) — required by `_quarto.yml`'s `include-in-header`. Leave alone if this file already exists.
   - [`CITATION.cff`](assets/CITATION.cff) — citation metadata template (fill in the placeholders)
   - [`references.bib`](assets/references.bib) — bibliography file
   - [`LICENSE.md`](assets/LICENSE.md) and [`LICENSE-CODE.md`](assets/LICENSE-CODE.md) — dual license files (CC BY-SA 4.0 for content, CC0 1.0 for code)

1. Add the [`.filenameignore`](assets/.filenameignore) file if the tutorial doesn't have one. This is required by the `filename-check.yml` workflow to exclude certain paths from validation (e.g., `_extensions/`, `LICENSE` files, `README`).

1. Add the custom [404 page](assets/404.qmd) to the root of the project if not already present.

1. Update the [`.gitignore`](assets/.gitignore) file to include any new files or directories that should be ignored by Git.

1. Make sure the [`index.qmd`](assets/index.qmd) includes the callout tips to support the OSC and pose questions.

1. Tell the user to also run the `/quarto-headers` skill to check their Quarto document headers.
