---
name: osc-tutorial-conversion
description: Instructions for converting existing OSC tutorials to match our `tutorial-template` repo
metadata:
  author: Pat Callahan
  version: 0.0.1
---

# OSC Tutorial Conversion

Your goal is to convert existing OSC tutorials to match the structure and style of our `tutorial-template` repo. This will ensure consistency across all tutorials and make it easier for users to follow along.

1. Use the available [`.github` workflows](assets/.github/workflows) for CI/CD and testing, replacing existing workflows in the tutorials with these standardized ones as needed. Do not remove non-related workflows.
2. Apply kebap case to all file names and directories. For example, `MyTutorial.md` should be renamed to `my-tutorial.md`. Files in the `assets` directory should also follow this convention.
3. Update the references to all files and folders in the tutorials to reflect the new kebap case naming convention. This includes links, images, and any other references.
4. Apply the [lmu-osc-custom.scss](assets/lmu-osc-custom.scss) and [styles.css](assets/styles.css) stylesheet to all tutorials. This will ensure a consistent look and feel across all tutorials.
5. Add the [footer folder](assets/footer/) to the tutorial.
6. Add the [assets](assets/assets/) folder to the tutorial, or just the contents within it if the folder already exists. This will ensure that all necessary assets are included in the tutorial.
7. Follow the conventions in [`_quarto.yml`](assets/_quarto.yml) for the tutorial's configuration. This includes settings for the title, author, date, and any other relevant metadata.
8. Add the custom [404 page](assets/404.qmd) to the root of the project if not already present.
