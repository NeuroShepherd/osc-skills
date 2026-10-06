

# PowerPoint specific notes

* Table output
    - Tables look fine
    - Can't adjust their default vertical alignment in the template pptx, however
* The "Content with Caption Layout" is triggered when there is text followed by something non-text, namely images/figures/tables
    - Order matters--images/figures/tables followed by text does not trigger this slide layout
    - Probably prefer putting these in column layout instead
    - Additionally, some slides have text followed by multiples image/figure/table elements. However, PowerPoint will split these multiple slides so it is even more preferable to use columns to keep them on one single slide. Attempting to trigger the side by side comparison layout is a good option here too.
* If a .panel-tabset is used, make it so the PowerPoint output splits each panel into its own slide
* Custom footers should be ignored in PowerPoint as they do not render properly
* Replace HTML tables with markdown tables, aiming to preserve the style as best as possible. If this cannot reliably be done, then create a separate PowerPoint-only table as a last resort


# Notes specific to the old format of the Quarto files

* Many file references are made on a relative path that no longer exists, namely to `../../assets`. It is not needed, and is preferred not to, use this kind of referencing.
* Add the files in assets/ if they are not already present
* Install the osc-brand Quarto extension with `quarto add lmu-osc/osc-brand` to make the correct pptx doc available
* To each format, add the `output-file` yaml arg, and make it so the file name is `repoName-outputName.outputExt`. For example, the RevealJS output for a repo named `hello-there` would be `hello-there-revealjs.html`.
    - For formats from an extension, namely from the `osc-brand` extension, do not include the `osc-brand` text anywhere in the name. That will be redundant and too long
* Put the CSL and references.bib files at `/assets` and make sure they are properly referenced from the qmd file
* Make sure the first `format` entry is `html`
* Add the following Quarto extensions
    - mcanouil/quarto-revealjs-tabset
    - nicebread/quarto-timer
