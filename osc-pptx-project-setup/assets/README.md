# \<Tutorial Template\>




## Structure Overview

Top-level files and directories you'll commonly interact with:

- `_quarto.yml` — Site configuration (title, navigation, output settings, theme). Update this to change the site title, navigation order, or basic site settings. We already have a multitude of presets in place here, but feel free to look at Quarto's documentation for further options.
- `index.qmd` — The site homepage content i.e. the landing page when someone opens the link to the tutorial. This should generally be an overview of the tutorial + necessary software information.
- `about.qmd` — An example about page for your tutorial. It's main role is to contain License, Citation, and Contributor information.
- `CITATION.cff` — Citation metadata for your project (authors, affiliations, ORCID, etc.). See the official  [CITATION.cff](https://citation-file-format.github.io/) documentation or sent an OSC member a message if it's unclear how to fill this in.
    - Note: you can also spot-check whether this is valid in R by running `install.packages("cffr"); cffr::cff_validate()`.
- `LICENSE.md` and `LICENSE-CODE.md` — License text for content and code respectively. We use CC-BY-SA 4.0 and CC0 1.0 Universal for authored content and code, respectively.
- `lmu-osc-custom.scss` — Site-specific SCSS tweaks; add branding or small visual changes here.
- `styles.css` — Additional CSS classes for page content (e.g., `.center`, `.img-border`, `.output-overflow`). Edit this file for content-level styling.
- `matomo-analytics.html` — Analytics snippet (managed by OSC staff; do not edit unless instructed).
- `assets/` — Images, downloads, and other static files used by the site.
- `topic-one/`, `topic-two/`, ... — Example topic folders containing `.qmd` pages for tutorial sections. Replace or rename these to match your content.
- `_site/` — Generated site files (output). You normally do not edit this folder directly — it's produced when you build the site.
- `.filenameignore` — Patterns ignored by the automated filename check workflow. Add paths here if the workflow flags files that should be skipped.
- `.gitignore` — Files and directories Git should ignore (e.g., history files, temporary R output). Edit if your project generates new temporary files.

If you want to change what appears in the site's navigation, edit the `sidebar:` and `navbar:` sections in `_quarto.yml`.



## Running Actions (for non-technical contributors)

This template has several automations in place to help ensure consistency across our repositories, namely a citation file checker, a filename checker, an automation for publishing the site, and a code style formatter. You can see details at `.github/workflows/README.md` if interested, but it's not required to know these details by any means.

- If you need to run a repository workflow (for example to re-render the site), open this repository on GitHub and click the **Actions** tab.
- Select the workflow you want (examples: "Render Quarto Site", "Check CITATION.cff", "Filename Checks", "Tidyverse Style Formatting").
- Click **Run workflow**, and then select the branch you want to test a workflow on from the "Branch:" dropdown. Then click **Run workflow** again to start it.
- After the workflow starts, you can monitor progress on the same page and inspect step logs if something fails. If you are unsure what to do after a failure, open a GitHub issue and paste the error or screenshot.
- If you do not see the **Run workflow** button, you can still make changes by editing files and pushing them to GitHub; the workflows that trigger on `push` will run automatically.

## Conventions and tips

- File names: lowercase and kebab-case (e.g. `my-topic/my-page.qmd`).
- Content: use plain text and simple Markdown/Quarto; avoid embedding complex web widgets unless needed.
- Collaboration: edit content on GitHub using branches and pull requests so teammates can review changes.


